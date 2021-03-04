from django.shortcuts import render, redirect, HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterFrom, KorisnikUpdate
from django.contrib.auth.models import User
from .models import Korisnici
User = Korisnici




def registracija(request):
    if request.user.is_authenticated:
        return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))

    if request.method == 'POST':
        form = UserRegisterFrom(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request, f'Vaš račun je napravljen, možete se prijaviti!')
            return redirect('mentorski-pocetna')
    else:
        form = UserRegisterFrom()
    return render(request, 'korisnici/registracija.html', {'form': form})


@login_required
def profil(request):

    if request.method == 'POST':
        update_form = KorisnikUpdate(request.POST, request.FILES, instance=request.user)

        if update_form.is_valid():
            update_form.save()
            messages.success(request, f'Vaš račun je ažuriran!')
            return redirect('mentorski-profil')
    else:
        update_form = KorisnikUpdate(instance=request.user)

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs.update({'user': self.request.user})
        return kwargs


    context = {
        'korisnici': Korisnici.objects.all().filter(id=request.user.id),
        'update_form':update_form,
    }
    return render(request, 'korisnici/profil.html', context)

