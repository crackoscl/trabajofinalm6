
from django import forms
from django.core import validators
from .models import User
    
class Examen(forms.Form):
    
    perfil = forms.ModelChoiceField(queryset=User.objects.all().exclude(is_superuser=True))
    nombre = forms.CharField(label="Nombre Examen")
    valor = forms.CharField(label="valor")
    fecha = forms.DateField(label='Fecha de examen:', widget=forms.SelectDateWidget(years=range(1900,2022)))
    observaciones = forms.CharField(widget=forms.Textarea(attrs={'rows':3, 'cols':20}))
    
    perfil.widget.attrs.update({'class': 'form-control'})
    nombre.widget.attrs.update({'class': 'form-control'})
    valor.widget.attrs.update({'class': 'form-control'})
    fecha.widget.attrs.update({'class': 'form-control'})
    observaciones.widget.attrs.update({'class': 'form-control'})

    
class FormularioPacientes(forms.Form):
    
    CHOICES =( 
        ("Medico", "Medico"), 
        ("Paciente", "Paciente"), 
        ("Familiar", "Familar"), 
        ("Cuidador_Autorizado", "Cuidador_Autorizado"), 
            ) 

    rol = forms.ChoiceField(choices=CHOICES , required=True)
    username = forms.CharField(label='Nombre Usuario ',validators=[validators.MinLengthValidator(2,"Su UserName debe poseer mas de 2 caracteres")])
    first_name  = forms.CharField(label='Nombre',validators=[validators.MinLengthValidator(2,"Su Nombre debe poseer mas de 2 caracteres")])
    last_name = forms.CharField(label='Apellido',validators=[validators.MinLengthValidator(2,"Su Apellido debe poseer mas de 2 caracteres")])
    email = forms.EmailField()
    password = forms.CharField(label='Contraseña',required=False,widget = forms.PasswordInput())
    rut = forms.CharField()
    edad = forms.IntegerField()
    fecha_nacimiento = forms.DateField()
    direccion = forms.CharField(label='Dirección')
    ocupacion = forms.CharField(label='Ocupación')
    telefono = forms.CharField(label='Telefono')
    foto = forms.CharField(label='Foto')
    resumen = forms.CharField(widget=forms.Textarea(attrs={'rows':3, 'cols':50}))
    educacion = forms.CharField(widget=forms.Textarea(attrs={'rows':3, 'cols':50}))
    historial = forms.CharField(widget=forms.Textarea(attrs={'rows':3, 'cols':50}))
    
    rol.widget.attrs.update({'class': 'form-control'})
    username.widget.attrs.update({'class': 'form-control'})
    first_name.widget.attrs.update({'class': 'form-control'})
    last_name.widget.attrs.update({'class': 'form-control'})
    email.widget.attrs.update({'class': 'form-control'})
    password.widget.attrs.update({'class': 'form-control'})
    rut.widget.attrs.update({'class': 'form-control'})
    edad.widget.attrs.update({'class': 'form-control'})
    fecha_nacimiento.widget.attrs.update({'class': 'form-control'})
    foto.widget.attrs.update({'class': 'form-control'})
    resumen.widget.attrs.update({'class': 'form-control'})
    ocupacion.widget.attrs.update({'class': 'form-control'})
    telefono.widget.attrs.update({'class': 'form-control'})
    direccion.widget.attrs.update({'class': 'form-control'})
    educacion.widget.attrs.update({'class': 'form-control'})
    historial.widget.attrs.update({'class': 'form-control'})
    
    