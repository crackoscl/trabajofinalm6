from django.contrib import admin
from .models import paciente, Genre, examen, examenInstance, Language
# ---------------------------------------------------------------
# Register your models here.

# Define the admin class
class pacienteAdmin(admin.ModelAdmin):
    list_display = ('Foto_perfil', 'Rut', 'Nombre', 'Apellido', 'Nacimiento',
                    'Edad', 'Telefono', 'Direccion', 'Correo', 'Password', 'Ocupacion',
                    'Resumen', 'Educacion', 'Historial', 'Rol')
    fields = ['Foto_perfil', 'Rut', 'Nombre', 'Apellido',
                    'Edad', 'Telefono', 'Direccion', 'Correo', 'Password', 'Ocupacion',
                    'Resumen', 'Educacion', 'Historial', 'Rol', ('Nacimiento')]
    # Register the admin class with the associated model
admin.site.register(paciente, pacienteAdmin)


class examenesInstanceInline(admin.TabularInline):
    model = examenInstance
    
# Register the Admin classes for examen using the decorator
@admin.register(examen)
class examenAdmin(admin.ModelAdmin):
    list_display = ('paciente', 'Nombre', 'Valor_Examen', 'Fecha', 'Observaciones')
    inlines = [examenesInstanceInline]

# Register the Admin classes for examenInstance using the decorator
@admin.register(examenInstance)
class examenInstanceAdmin(admin.ModelAdmin):
    list_display = ('examen', 'status', 'borrower', 'due_back', 'id')
    list_filter = ('status', 'due_back')

    fieldsets = (
        (None, {
            'fields': ('examen','imprint', 'id')
        }),
        ('Availability', {
            'fields': ('status', 'due_back','borrower')
        }),
    )

