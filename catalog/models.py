from django.contrib.auth.models import User  # Required to assign User as a borrower
from django.urls import reverse  # To generate URLS by reversing URL patterns
from django.db import models
from datetime import date
import uuid  # Required for unique examen instances
#-----------------------------------------------
# Create your models here.
#-----------------------------------------------
#-----------------EJEMPLO LIBROS---------------------

class Genre(models.Model):
    """Model representing a examen genre (e.g. Science Fiction, Non Fiction)."""
    name = models.CharField(
        max_length=200,
        help_text="Enter a examen genre (e.g. Science Fiction, French Poetry etc.)"
        )

    def __str__(self):
        """String for representing the Model object (in Admin site etc.)"""
        return self.name

class Language(models.Model):
    """Model representing a Language (e.g. English, French, Japanese, etc.)"""
    name = models.CharField(max_length=200,
                            help_text="Enter the examen's natural language (e.g. English, French, Japanese etc.)")

    def __str__(self):
        """String for representing the Model object (in Admin site etc.)"""
        return self.name

class examen(models.Model):
    paciente = models.ForeignKey('paciente', on_delete=models.CASCADE, null=True)
    Nombre = models.CharField(max_length=50)
    Valor_Examen = models.CharField(max_length=50)
    Fecha = models.DateField()
    Observaciones = models.TextField(max_length=1000, help_text="Enter a brief description of the examen")
    
    class Meta:
        ordering = ['paciente', 'Nombre']

    def get_absolute_url(self):
        """Returns the url to access a particular examen instance."""
        return reverse('examen-detail', args=[str(self.id)])

    def __str__(self):
        """String for representing the Model object."""
        return self.Nombre

class examenInstance(models.Model):
    """Model representing a specific copy of a examen (i.e. that can be borrowed from the library)."""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          help_text="Unique ID for this particular examen across whole library")
    examen = models.ForeignKey('examen', on_delete=models.RESTRICT, null=True)
    imprint = models.CharField(max_length=200)
    due_back = models.DateField(null=True, blank=True)
    borrower = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)

    @property
    def is_overdue(self):
        if self.due_back and date.today() > self.due_back:
            return True
        return False

    LOAN_STATUS = (
        ('d', 'Maintenance'),
        ('o', 'On loan'),
        ('a', 'Available'),
        ('r', 'Reserved'),
    )

    status = models.CharField(
        max_length=1,
        choices=LOAN_STATUS,
        blank=True,
        default='d',
        help_text='examen availability')

    class Meta:
        ordering = ['due_back']
        permissions = (("can_mark_returned", "Set examen as returned"),)

    def __str__(self):
        """String for representing the Model object."""
        return '{0} ({1})'.format(self.id, self.examen.title)

class paciente(models.Model):

    """Model representing an paciente."""
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
        """Returns the url to access a particular paciente instance."""
        return reverse('paciente-detail', args=[str(self.id)])

    def __str__(self):
        """String for representing the Model object."""
        return '{0}, {1}'.format(self.Nombre, self.Apellido)
    
    class Meta:
        ordering = ['Nombre']

