# Generated by Django 3.0.2 on 2020-01-22 21:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('korisnici', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='korisnici',
            name='image',
            field=models.ImageField(default='default.jpg', upload_to='profile_pics'),
        ),
    ]
