from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseNotFound, response
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib import messages
from .models import Predmeti, Upisi
from korisnici.models import Korisnici
from django.db.models import Sum
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView



def home(request):

    context = {
        'predmeti':Predmeti.objects.all()
    }
    return render(request, 'mentorski/pocetna.html', context)


class predmetiListView(LoginRequiredMixin, UserPassesTestMixin, ListView):
    model = Predmeti
    template_name = 'mentorski/predmeti.html'
    context_object_name = 'predmeti'
    ordering = ['ime']

    def test_func(self):
        if self.request.user.role == 'mentor' or self.request.user.is_staff:
            return True
        return False



class predmetiDetailView(LoginRequiredMixin, UserPassesTestMixin, DetailView):
    model = Predmeti

    def test_func(self):
        if self.request.user.role == 'mentor' or self.request.user.is_staff:
            return True
        return False


class predmetiCreateView(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    model = Predmeti
    fields = ['ime', 'kod', 'program', 'bodovi', 'izborni', 'sem_redovni', 'sem_izvanredni']

    def test_func(self):
        if self.request.user.role == 'mentor' or self.request.user.is_staff:
            return True
        return False


class predmetiUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Predmeti
    fields = ['ime', 'kod', 'program', 'bodovi', 'izborni', 'sem_redovni', 'sem_izvanredni']

    def form_valid(self, form):
        form.save()
        return redirect('mentorski-predmeti')

    def test_func(self):
        if self.request.user.role == 'mentor' or self.request.user.is_staff:
            return True
        return False


class predmetiDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Predmeti
    success_url = '/predmeti/'

    def test_func(self):
        if self.request.user.role == 'mentor' or self.request.user.is_staff:
            return True
        return False



class korisniciListView(LoginRequiredMixin, UserPassesTestMixin, ListView):
    model = Korisnici
    template_name = 'mentorski/korisnici.html'
    context_object_name = 'korisnici'
    ordering = ['username']

    def test_func(self):
        if self.request.user.role == 'mentor' or self.request.user.is_staff:
            return True
        return False

    def get_queryset(self):
        return Korisnici.objects.filter(role='student')


class upisni_listListView(LoginRequiredMixin, UserPassesTestMixin, ListView):
    model = Predmeti
    template_name = 'mentorski/upisni_list.html'
    context_object_name = 'predmeti'
    
    


    def get_queryset(self):
        if not Korisnici.objects.filter(id=self.kwargs['pk']).exists():
            return HttpResponseNotFound()


        if(self.request.user.role == 'student' and self.request.user.status == 'redovni'):
            
            queryset = {'svi_predmeti': Predmeti.objects.all(),
                        'semestri': Predmeti.objects.values('sem_redovni').order_by('sem_redovni').distinct(),
                        'upisani': Upisi.objects.all().filter(student_id = self.request.user.id),
                        'neupisani': Predmeti.objects.exclude(id__in=Upisi.objects.values('predmet_id').filter(student_id=self.kwargs['pk'])),

            }
            return queryset
            
        if(self.request.user.role == 'student' and self.request.user.status == 'izvanredni'):
            
            queryset = {'svi_predmeti': Predmeti.objects.all(),
                        'semestri': Predmeti.objects.values('sem_izvanredni').order_by('sem_izvanredni').distinct(),
                        'upisani': Upisi.objects.all().filter(student_id = self.request.user.id),
                        'neupisani': Predmeti.objects.exclude(id__in=Upisi.objects.values('predmet_id').filter(student_id=self.kwargs['pk'])),

            }
            return queryset


        if(self.request.user.role == 'mentor' and Korisnici.objects.filter(id=self.kwargs['pk']).values('status')[0].get('status') == 'izvanredni'):

            queryset = {'svi_predmeti': Predmeti.objects.all(),
                        'semestri': Predmeti.objects.values('sem_izvanredni').order_by('sem_izvanredni').distinct(),
                        'upisani': Upisi.objects.all().filter(student_id = self.kwargs['pk']),
                        'studenti': Korisnici.objects.all().filter(id = self.kwargs['pk']),
                        'neupisani': Predmeti.objects.exclude(id__in=Upisi.objects.values('predmet_id').filter(student_id=self.kwargs['pk'])),
            }
            return queryset

        

        if(self.request.user.role == 'mentor' and Korisnici.objects.filter(id=self.kwargs['pk']).values('status')[0].get('status') == 'redovni'):

            queryset = {'svi_predmeti': Predmeti.objects.all(),
                        'semestri': Predmeti.objects.values('sem_redovni').order_by('sem_redovni').distinct(),
                        'upisani': Upisi.objects.all().filter(student_id = self.kwargs['pk']),
                        'studenti': Korisnici.objects.values('username','status').filter(id = self.kwargs['pk']),
                        'neupisani': Predmeti.objects.exclude(id__in=Upisi.objects.values('predmet_id').filter(student_id=self.kwargs['pk'])),
            }
            return queryset

            

        
        


    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return HttpResponseForbidden()


        if request.POST.get('upisi'):
            predmet = request.POST.get('upisi')
            student = self.kwargs['pk']
            upisani = Upisi.objects.select_related('predmet').filter(student_id=self.kwargs['pk'])
            new_status = 'enrolled'
            predmet_name = Predmeti.objects.values('ime').get(id=predmet)
            predmet_name = predmet_name.get('ime')
            upis = Upisi(status=new_status, predmet_id=predmet, student_id = student)
            upis.save()
            messages.success(request, f'Uspješno upisan predmet: {predmet_name}!')
            return redirect('mentorski-upisni-list', student)

        if request.POST.get('polozen'):
            new_status = 'passed'
            predmet = request.POST.get('polozen')
            student = self.kwargs['pk']
            current = Upisi.objects.get(predmet_id = predmet, student_id = student)
            current.status = new_status
            predmet_name = Predmeti.objects.values('ime').get(id=predmet)
            predmet_name = predmet_name.get('ime')
            current.save()
            messages.warning(request, f'Promjenjen status predmeta: {predmet_name}!')
            return redirect('mentorski-upisni-list', student)


        if request.POST.get('nije_polozen'):
            new_status = 'enrolled'
            predmet = request.POST.get('nije_polozen')
            student = self.kwargs['pk']
            current = Upisi.objects.get(predmet_id = predmet, student_id = student)
            current.status = new_status
            predmet_name = Predmeti.objects.values('ime').get(id=predmet)
            predmet_name = predmet_name.get('ime')
            current.save()
            messages.warning(request, f'Promjenjen status predmeta: {predmet_name}!')
            return redirect('mentorski-upisni-list', student)


        if request.user.role=='mentor' and request.POST.get('izbrisi'):
            predmet = request.POST.get('izbrisi')
            student = self.kwargs['pk']
            current = Upisi.objects.get(predmet_id = predmet, student_id = student)
            predmet_name = Predmeti.objects.values('ime').get(id=predmet)
            predmet_name = predmet_name.get('ime')
            current.delete()
            messages.error(request, f'Uklonjen predmet: {predmet_name} sa upisnog lista!')
            return redirect('mentorski-upisni-list', student)


    def test_func(self):
        id = Korisnici.objects.values('id').get(id=self.request.user.id)
        id = id.get('id')

        if (self.request.user.role == 'mentor' and id == self.kwargs['pk']):
            return False
        if (self.request.user.id == self.kwargs['pk'] or self.request.user.role == 'mentor'):
            return True


@login_required
def zadatak(request):
#ZBROJ UPISANIH BODOVA
#Upisi.objects.select_related('predmet').filter(predmet__bodovi__gt=6, status='passed').aggregate(Sum('predmet__bodovi'))
#UPISAN PREDMET SA 6 BOD ili više
#Upisi.objects.select_related('predmet').filter(predmet__bodovi__gt=6)
#Upisi.objects.select_related('predmet').values('predmet_id','predmet__ime').filter(predmet__bodovi__gt=6).distinct() (samo naziv jednog)



    foo = Upisi.objects.select_related('predmet').values('predmet_id','predmet__ime').filter(predmet__bodovi__gt=6).distinct()

    context = {
        'upisani': Upisi.objects.select_related('predmet').filter(predmet__bodovi__gt=6),
        'bar': foo,
    }
    if (request.user.role=='mentor'):
        return render(request, 'mentorski/zadatak.html', context)
    else:
        return render(request, 'mentorski/pocetna.html')



