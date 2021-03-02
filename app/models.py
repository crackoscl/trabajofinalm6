from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class User(AbstractUser):
    rut = models.CharField(max_length=10, )
    edad = models.IntegerField(null=True)
    fecha_nacimiento = models.DateField(null=True)
    direccion = models.CharField(max_length=150,blank=True)
    ocupacion = models.CharField(max_length=150, default='influencer',blank=True)
    foto = models.CharField(max_length=65535, default='complete info',blank=True)
    telefono = models.CharField(max_length=20,blank=True)
    resumen= models.TextField(default='complete la info',blank=True)
    educacion=models.TextField(default='complete la info',blank=True)
    historial = models.TextField(default='complete la info',blank=True)
    rol = models.CharField(max_length=50,default="sin asignar",blank=True)
    
    # add additional fields in here
    class Meta:
        ordering = ['id']
    

    def __str__(self):
        return self.username
    
    
class Examenes(models.Model):
    nombre = models.CharField(max_length=50)
    valor = models.CharField(max_length=50)
    fecha = models.DateField()
    observaciones = models.CharField(max_length=250)
    paciente = models.ForeignKey(User, on_delete=models.CASCADE)
    
    class Meta:
        ordering = ['id']

