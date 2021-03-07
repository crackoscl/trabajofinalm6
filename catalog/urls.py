from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^graficos/$', views.graficos, name='graficos'),  
    url(r'^examenes/$', views.examenListView.as_view(), name='examenes'),
    url(r'^examen/(?P<pk>\d+)$', views.examenDetailView.as_view(), name='examen-detail'),
    url(r'^pacientes/$', views.pacienteListView.as_view(), name='pacientes'),
    url(r'^paciente/(?P<pk>\d+)$', views.pacienteDetailView.as_view(), name='paciente-detail'),
    url(r'^paciente/create/$', views.pacienteCreate.as_view(), name='paciente_create'),
    url(r'^paciente/(?P<pk>\d+)/update/$', views.pacienteUpdate.as_view(), name='paciente_update'),
    url(r'^paciente/(?P<pk>\d+)/delete/$', views.pacienteDelete.as_view(), name='paciente_delete'),
    url(r'^examen/create/$', views.examenCreate.as_view(), name='examen_create'),
    url(r'^examen/(?P<pk>\d+)/update/$', views.examenUpdate.as_view(), name='examen_update'),
    url(r'^examen/(?P<pk>\d+)/delete/$', views.examenDelete.as_view(), name='examen_delete'),
   
]
