from django.contrib.auth.models import User 
from django.urls import reverse 
from django.db import models
from datetime import date
import uuid 
#-----------------------------------------------
# Create your models here.
#-----------------------------------------------

class examen(models.Model):
    paciente = models.ForeignKey('paciente', on_delete=models.CASCADE, null=True)
    Nombre = models.CharField(max_length=50)
    Valor_Examen = models.CharField(max_length=50)
    Fecha = models.DateField()
    Observaciones = models.TextField(max_length=1000, help_text="Ingrese una breve descripcion del examen.")
    
    class Meta:
        ordering = ['paciente', 'Nombre']
        permissions = (("acceso_natural", "Control de edicion y eliminacion"),) 

    def get_absolute_url(self):
        """Retorna la url para acceder a una instancia de examen en particular"""
        return reverse('examen-detail', args=[str(self.id)])

    def __str__(self):
        """String para representar el objeto del modelo"""
        return self.Nombre

class paciente(models.Model):
    """Modelo para representar a paciente."""
    Foto_perfil = models.CharField(max_length=65535, default='Inserte una URL')
    Rut = models.CharField(max_length=10)
    Nombre = models.CharField(max_length=100)
    Apellido = models.CharField(max_length=100)
    Nacimiento = models.DateField(null=True, blank=True, default='05/12/2020')
    Edad = models.IntegerField()
    Telefono = models.CharField(max_length=20)
    Direccion = models.CharField(max_length=150)
    Correo = models.EmailField(max_length=200)
    Password = models.CharField(max_length=50, default='123456')
    Ocupacion = models.CharField(max_length=150, default='influencer')
    Resumen = models.TextField(default='Ingrese un breve resumen')
    Educacion = models.TextField(default='Ingrese estudios')
    Historial = models.TextField(default='Ingrese historial clinico')
    Rol = models.CharField(max_length=15)

    def get_absolute_url(self):
        """Retorna la url para acceder a una instancia de paciente en particular"""
        return reverse('paciente-detail', args=[str(self.id)])

    def __str__(self):
        """String para representar el objeto del modelo"""
        return '{0}, {1}'.format(self.Nombre, self.Apellido)
    
    class Meta:
        ordering = ['Nombre']
        permissions = (("acceso_natural", "Control de edicion y eliminacion"),) 

