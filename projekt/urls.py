"""projekt URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from korisnici import views as korisnici_views
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('registracija/', korisnici_views.registracija, name='mentorski-registracija'),
    path('profil/', korisnici_views.profil, name='mentorski-profil'),
    path('prijava/', auth_views.LoginView.as_view(template_name='korisnici/prijava.html'), name='mentorski-prijava'),
    path('odjava/', auth_views.LogoutView.as_view(template_name='korisnici/odjava.html'), name='mentorski-odjava'),
    path('', include('mentorski.urls')),
    

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
