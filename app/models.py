from django.db import models

# Create your models here.

class Examenes(models.Model):
    nombre = models.CharField(max_length=50)
    valor = models.CharField(max_length=50)
    fecha = models.DateField(auto_now=True)
    observaciones = models.CharField(max_length=250)
    
    class Meta:
        ordering = ['id']

class Administradores(models.Model):
    nombre = models.CharField(max_length=50)
    correo = models.EmailField(max_length=254)
    clave = models.CharField(max_length=50)
    
class Pacientes(models.Model):
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    rut = models.CharField(max_length=10)
    edad = models.IntegerField()
    direccion = models.CharField(max_length=150)
    fecha_nacimiento = models.DateField()
    correo = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    examenes = models.ForeignKey(Examenes, on_delete=models.CASCADE,null=True)
    
    
    

