from django.urls import path
from . import views
from .views import predmetiListView, predmetiDetailView, predmetiCreateView, predmetiUpdateView, predmetiDeleteView, korisniciListView, upisni_listListView



urlpatterns = [
    path('', views.home, name='mentorski-pocetna'),
    path('predmeti/', predmetiListView.as_view(), name='mentorski-predmeti'),
    path('predmeti/<int:pk>/', predmetiDetailView.as_view(), name='mentorski-predmeti-detalji'),
    path('predmeti/novi/', predmetiCreateView.as_view(), name='mentorski-predmeti-novi'),
    path('predmeti/update/<int:pk>/', predmetiUpdateView.as_view(), name='mentorski-predmeti-update'),
    path('predmeti/delete/<int:pk>/', predmetiDeleteView.as_view(), name='mentorski-predmeti-delete'),
    path('korisnici/', korisniciListView.as_view(), name='mentorski-korisnici'),
    path('upisni_list/<int:pk>/', upisni_listListView.as_view(), name='mentorski-upisni-list'),
    path('zadatak/', views.zadatak, name='mentorski-zadatak'),
]
