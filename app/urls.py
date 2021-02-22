from os import name
from django.urls import path
from . import views


app_name = 'app'

urlpatterns = [
    path('', views.inicio,name='inicio'),
    path('login/',views.login_user,name='login'),
    path('private/', views.private,name='private'),
    path('graficos/', views.graficos,name='graficos'),
    path('crearexamen/', views.crear_examen,name='crearexamen'),
    path('<pk>/eliminar/', views.eliminar_examen, name='eliminar_examen'),
    path('examenes/', views.listar_examenes,name='examenes'),
    path('agendar/', views.agendar,name='agendar'),
    path('agregar_usuario/', views.agregar_usuario,name='agregar_usuario'),
    path('agregar_usuario_db/', views.agregar_usuario_db,name='agregar_usuario_db'),
    path('<rut>/eliminar_pacientes', views.eliminar_pacientes, name='eliminar_pacientes'),
    path('<rut>/eliminar_pacientes_db', views.eliminar_pacientes_db, name='eliminar_pacientes_db'),
    path('<rut>/editar_paciente_db', views.editar_paciente_db, name='editar_paciente_db'),
]
