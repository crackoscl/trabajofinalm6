# Generated by Django 3.1.6 on 2021-02-20 03:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_auto_20210219_1952'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pacientes',
            old_name='email',
            new_name='correo',
        ),
    ]