from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Korisnici
User = Korisnici


class UserRegisterFrom(UserCreationForm):

    Izbor = [
        ("redovni", "Redovni"),
        ("izvanredni", "Izvanredni"),
    ]

    email = forms.EmailField()
    status = forms.ChoiceField(choices=Izbor, required=True)
    #role = forms.CharField(max_length=7,initial='student',disabled=True,required=True)

    class Meta:
        model = User
        fields = ['username', 'email', 'status', 'password1', 'password2']

    def save(self, commit=True):
        user = super().save(commit=False)

        user.email = self.cleaned_data['email']
        user.status = self.cleaned_data['status']
        #user.role = self.cleaned_data['role']

        if commit:
            user.save()
        return user


    def clean(self):
       email = self.cleaned_data.get('email')
       username = self.cleaned_data.get('username')
       if User.objects.filter(email=email).exists():
            raise forms.ValidationError("Email je već registriran!")

       if User.objects.filter(username=username).exists():
            raise forms.ValidationError("Korisničko ime već postoji!") 
       return self.cleaned_data


class KorisnikUpdate(forms.ModelForm):

    Izbor = [
        ("redovni", "Redovni"),
        ("izvanredni", "Izvanredni"),
    ]


    status = forms.ChoiceField(choices=Izbor, required=True)

    class Meta:
        model = User
        fields = ['status', 'image']



    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('instance', None)
        super().__init__(*args, **kwargs)
        logged_user = Korisnici.objects.values('role').get(id = self.user.id)
        logged_user = logged_user.get('role')

        if logged_user == 'mentor':
           del self.fields['status']