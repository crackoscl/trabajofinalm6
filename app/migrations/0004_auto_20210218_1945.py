# Generated by Django 3.1.6 on 2021-02-18 19:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_pacientes_clave'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pacientes',
            old_name='fecha_nacimiento',
            new_name='fecha',
        ),
    ]
