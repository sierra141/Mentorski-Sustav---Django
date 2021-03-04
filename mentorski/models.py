from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import gettext_lazy as _
from django.core.validators import MaxValueValidator, MinValueValidator
from django.urls import reverse
from django.conf import settings
User = settings.AUTH_USER_MODEL

class Predmeti(models.Model):

    class Izborni(models.TextChoices):
        DA = 'da', _('da')
        NE = 'ne', _('ne')

    ime = models.CharField(max_length=255)
    kod = models.CharField(unique=True, max_length=6)
    program = models.TextField()
    bodovi = models.PositiveIntegerField(default=1, validators=[MinValueValidator(1), MaxValueValidator(8)])
    sem_redovni = models.PositiveIntegerField(default=1, validators=[MinValueValidator(1), MaxValueValidator(6)])
    sem_izvanredni = models.PositiveIntegerField(default=1, validators=[MinValueValidator(1), MaxValueValidator(8)])
    izborni = models.CharField(max_length=2, choices=Izborni.choices, default=Izborni.NE,)


    def __str__(self):
        return self.ime

    def get_absolute_url(self):
        return reverse('mentorski-predmeti-detalji', kwargs={'pk': self.pk})


class Upisi(models.Model):

    class Status(models.TextChoices):
        ENROLLED = 'enrolled', _('enrolled')
        PASSED = 'passed', _('passed')
        NOT_PASSED = 'not_passed', _('not_passed')


    student = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    predmet = models.ForeignKey(Predmeti, models.CASCADE, null=True)
    status = models.CharField(max_length=10, choices=Status.choices)


    def __str__(self):
        return str(self.predmet)