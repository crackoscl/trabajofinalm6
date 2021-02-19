from os import name
from django.urls import path
from . import views


app_name = 'app'

urlpatterns = [
    path('', views.inicio,name='inicio'),
    path('login/',views.login_user,name='login'),
    path('private/', views.private,name='private'),
    path('examenes/', views.listar_examenes,name='examenes'),
    path('crearexamen/', views.crear_examen,name='crearexamen'),
    path('<pk>/editar_examen/', views.editar_examen, name='editar_examen'),
    path('<pk>/eliminar/', views.eliminar_examen, name='eliminar_examen'),
    path('graficos/', views.graficos,name='graficos'),  
    path('agendar/', views.agendar,name='agendar'),
    path('agregar_usuario/', views.agregar_usuario,name='agregar_usuario'),
    path('<rut>/eliminar_pacientes', views.eliminar_pacientes, name='eliminar_pacientes'),
]
