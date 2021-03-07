from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.shortcuts import get_object_or_404
from django.shortcuts import render
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views import generic
from django.urls import reverse_lazy
from django.urls import reverse
from django.http import HttpResponseRedirect
from .models import examen, paciente
import datetime
#-----------------------------------------------------

# Create your views here.
#-----------------------------------------INICIO------
def index(request):
    """
    Función vista para la página inicio del sitio.
    """
    # Genera contadores de algunos de los objetos principales
    num_examenes = examen.objects.all().count()
    num_pacientes = paciente.objects.count()

    # Numero de visitas a esta view, como está contado en la variable de sesión.
    num_visits = request.session.get('num_visits', 0)
    request.session['num_visits'] = num_visits + 1

    context = {
        'num_examenes':num_examenes,
        'num_pacientes':num_pacientes,
        'num_visits':num_visits,
    } 

    # Carga la plantilla index.html con la información adicional en la variable context.
    return render(request, 'index.html', context=context)
#-----------------------------------------INICIO------

#-----------------------------------------GRAFICOS------
@permission_required('catalog.acceso_natural')
def graficos(request):
    
    datos = {}
    glucosa = []
    fecha_glucosa = []
    hemograma = []
    fecha_hemograma = []
    orina = []
    fecha_orina = []
    fechas = []
    
    charts = examen.objects.values()
    for item in charts:
        if item['Nombre'] == 'glucosa':
            glucosa.append(item['Valor_Examen'])
            fecha_glucosa.append(str(item['Fecha']))
        elif item['Nombre'] == 'orina':
            orina.append(item['Valor_Examen'])
            fecha_orina.append(str(item['Fecha']))
        elif item['Nombre'] == 'hemograma':
            hemograma.append(item['Valor_Examen'])
            fecha_hemograma.append(str(item['Fecha']))
    
    
    datos['glucosa'] = glucosa
    datos['fecha_glucosa'] = fecha_glucosa
    datos['hemograma'] = hemograma
    datos['fecha_hemograma'] = fecha_hemograma     
    datos['orina'] = orina   
    datos['fecha_orina'] = fecha_orina
    return render(request,'catalog/graficos.html', {'labels_glucosa':fecha_glucosa, 'labels_orina':fecha_orina, 'labels_hemograma':fecha_hemograma,'data':datos})
#-----------------------------------------GRAFICOS------


#-----------------------------------------CRUD examen------
class examenListView(generic.ListView):#lISTAR
    model = examen
    paginate_by = 5

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(examenListView, self).get_context_data(**kwargs)
        # Get the blog from id and add it to the context
        context['some_data'] = 'This is just some data'
        return context 

class examenCreate(CreateView):#CREAR
    model = examen
    fields = '__all__'
    initial={'isbn':'1234567891234',}

class examenUpdate(UpdateView):#ACTUALIZAR
    model = examen
    fields = ['paciente','Nombre','Valor_Examen','Fecha', 'Observaciones']

class examenDelete(PermissionRequiredMixin, DeleteView):#ELIMINAR
    permission_required = 'catalog.acceso_natural'
    model = examen
    success_url = reverse_lazy('examenes')
   

#-----------------------------------------DETALLES examen------
class examenDetailView(generic.DetailView):#VISTADETALLADA
    model = examen
#-----------------------------------------DETALLES examen------

#-----------------------------------------CRUD paciente------
class pacienteListView(generic.ListView): #LISTAR
    model = paciente
    paginate_by = 5

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(pacienteListView, self).get_context_data(**kwargs)
        # Get the blog from id and add it to the context
        context['some_data'] = 'This is just some data'
        return context 

class pacienteCreate(CreateView):#CREAR
    model = paciente
    fields = '__all__'
    initial={'Rut':'183623835'}

class pacienteUpdate(UpdateView):#ACTUALIZAR
    model = paciente
    fields = ['Foto_perfil', 'Rut', 'Nombre', 'Apellido', 'Nacimiento',
            'Edad', 'Telefono', 'Direccion', 'Correo', 'Password', 'Ocupacion',
            'Resumen', 'Educacion', 'Historial', 'Rol']

class pacienteDelete(DeleteView):#ELIMINAR
    model = paciente
    success_url = reverse_lazy('pacientes')
#-----------------------------------------DETALLES paciente------
class pacienteDetailView(generic.DetailView): #VISTADETALLADA
    model = paciente
#-----------------------------------------DETALLES paciente------

