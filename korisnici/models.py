from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext as _
from PIL import Image


# Create your models here.



class Korisnici(AbstractUser):

    redovni = 'redovni'
    izvanredni = 'izvanredni'

    Statusi = [
    (redovni, 'Redovni'),
    (izvanredni, 'Izvanredni'),
    ]


    mentor = 'mentor'
    student = 'student'

    Role = [
        (mentor, 'Mentor'),
        (student, 'Student'),
    ]

    is_staff = models.BooleanField(_('staff status'),default=False)
    role = models.CharField(max_length=7,default='student')
    status = models.CharField(max_length=10)

    image = models.ImageField(default='default.png', upload_to='profile_pics')

    def __str__(self):
        return self.username

    def __str__(self):
        return self.status
