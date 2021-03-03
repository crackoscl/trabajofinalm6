from .models import Examenes, User
from django.contrib.auth.hashers import make_password
from typing import ContextManager
import datetime
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test 
from django.conf import settings
from django.http import JsonResponse
from django.template.loader import render_to_string
from .forms import  Examen, FormularioPacientes

    
def inicio(request):
    # if request.method == "GET":
    #     formulario = Login(request.GET)
    #     context = {'formulario':formulario}
    return render(request,'app/index.html')


@login_required(login_url="/login/")
def private(request):
    perfiles = User.objects.values()
    context = {'perfiles':perfiles}
    return render(request,'app/Privada.html',context)
   
    
@login_required(login_url="/login/")
def graficos(request):
    datos = {}
    glucosa = []
    fecha_glucosa = []
    hemograma = []
    fecha_hemograma = []
    orina = []
    fecha_orina = []
    fechas = []
    
    charts = Examenes.objects.values()
    for item in charts:
        if item['nombre'] == 'glucosa':
            glucosa.append(item['valor'])
            fecha_glucosa.append(str(item['fecha']))
        elif item['nombre'] == 'orina':
            orina.append(item['valor'])
            fecha_orina.append(str(item['fecha']))
        elif item['nombre'] == 'hemograma':
            hemograma.append(item['valor'])
            fecha_hemograma.append(str(item['fecha']))
    
    
    datos['glucosa'] = glucosa
    datos['fecha_glucosa'] = fecha_glucosa
    datos['hemograma'] = hemograma
    datos['fecha_hemograma'] = fecha_hemograma     
    datos['orina'] = orina   
    datos['fecha_orina'] = fecha_orina
    return render(request,'app/Graficos.html', {'labels_glucosa':fecha_glucosa, 'labels_orina':fecha_orina, 'labels_hemograma':fecha_hemograma,'data':datos})


@login_required(login_url="/login/")
def agendar(request):
    return render(request,'app/Agendar.html')



def funcion_permiso(user):
    return user.rol == 'paciente'

@login_required(login_url="/login/")
@user_passes_test(funcion_permiso) 
def listar_examenes(request):
        examenes = Examenes.objects.all()
        context = {"lista_examenes": examenes}
        return render(request,'app/examenes/Examenes.html',context)

@login_required(login_url="/login/")
def crear_examen(request):
    data = dict() # pa meter cosas 
    
    if request.method == 'POST':
        formulario = Examen(request.POST)
        if formulario.is_valid():
            datos_formulario = formulario.cleaned_data
            datos_formulario['fecha'] = datos_formulario['fecha'].strftime("%Y-%m-%d")
            print(datos_formulario)
            Examenes.objects.create(
                nombre = datos_formulario['nombre'],
                valor = datos_formulario['valor'],
                fecha = datos_formulario['fecha'],
                observaciones = datos_formulario['observaciones'],
                paciente = datos_formulario['perfil']
            )
            data['formulario_is_valid'] = True
            examenes = Examenes.objects.all()
            data['html_examenes_list'] = render_to_string('app/examenes/Examenes_lista_parcial.html',{
                'lista_examenes': examenes
                })      
        else:
            data['formulario_is_valid'] = False 
    else:
        formulario = Examen()
    
    context = {'formulario': formulario}
    data['html_formulario'] = render_to_string('app/examenes/Examen_parcial.html',
                                               context,
                                               request = request,)
    return JsonResponse(data)


@login_required(login_url="/login/")
def editar_examen(request,pk):
    data = dict() # pa meter cosas 
    if request.method == 'POST':
        formulario = Examen(request.POST)
        if formulario.is_valid():
            datos_formulario = formulario.cleaned_data
            datos_formulario['fecha'] = datos_formulario['fecha'].strftime("%Y-%m-%d")
            Examenes.objects.filter(id=pk).update(
                nombre = datos_formulario['nombre'],
                valor = datos_formulario['valor'],
                fecha = datos_formulario['fecha'],
                observaciones = datos_formulario['observaciones'],
                paciente = datos_formulario['perfil']
            )
            data['formulario_is_valid'] = True
            examenes = Examenes.objects.all()
            data['html_examenes_list'] = render_to_string('app/examenes/Examenes_lista_parcial.html',{
                'lista_examenes': examenes
                })      
        else:
            data['formulario_is_valid'] = False 
    else:
        examen = Examenes.objects.filter(id=pk).values()[0]
        formulario = Examen(initial=examen)
    context = {'formulario': formulario,"id":pk}
    data['html_formulario'] = render_to_string('app/examenes/Examen_parcial_actualizar.html',
                                               context,
                                               request = request,)
    return JsonResponse(data)

@login_required(login_url="/login/")
def eliminar_examen(request,pk):
    examen = get_object_or_404(Examenes, pk=pk)
    data = dict()
    if request.method == 'POST':
        examen.delete()
        data['formulario_is_valid'] = True
        examenes = Examenes.objects.all()
        data['html_examenes_list'] = render_to_string('app/examenes/Examenes_lista_parcial.html',{
                'lista_examenes': examenes
                })      
    else:
        context = {'examen': examen}
        data['html_formulario'] = render_to_string('app/examenes/Eliminar_examen_parcial.html',
            context,
            request=request,
        )
    return JsonResponse(data)
            

@login_required(login_url="/login/")
def context_lista_pacientes():
    
    pacientes = User.objects.values()
    context= {'lista_pacientes': pacientes}
    return context



# def funcion_permiso(user):
#     return user.rol == 'medico'

@login_required(login_url="/login/")  
#@user_passes_test(funcion_permiso)     
def agregar_usuario_db(request):
    
    if request.method == 'GET':
        formulario = FormularioPacientes()
        context = {'formulario': formulario}
        pacientes = User.objects.values()
        context={ 'formulario': formulario,
                 'lista_pacientes': pacientes}
        return render(request,'app/agregar_usuario_db.html',context)

    elif request.method == 'POST':
       
        
        formulario_devuelto = FormularioPacientes(request.POST)
        
        if formulario_devuelto.is_valid() == True:
            datos_formulario = formulario_devuelto.cleaned_data
            datos_formulario['fecha_nacimiento']= datos_formulario['fecha_nacimiento'].strftime("%Y-%m-%d")
            User.objects.create_user(
                                    username = datos_formulario['username'],
                                    first_name = datos_formulario['first_name'],
                                    last_name = datos_formulario['last_name'],
                                    email= datos_formulario['email'],
                                    password = make_password(datos_formulario['password']),
                                    rut= datos_formulario['rut'],
                                    edad = datos_formulario['edad'],
                                    fecha_nacimiento = datos_formulario['fecha_nacimiento'],
                                    direccion= datos_formulario['direccion'],
                                    ocupacion= datos_formulario['ocupacion'],
                                    telefono = datos_formulario['telefono'],
                                    foto = datos_formulario['foto'],
                                    resumen= datos_formulario['resumen'],
                                    educacion = datos_formulario['educacion'],
                                    historial = datos_formulario['historial'],
                                    rol = datos_formulario['rol']
                                    )
                
            return redirect('app:agregar_usuario_db')
             
        else:
            context= {'formulario': formulario_devuelto}
            context.update(context_lista_pacientes())
            return render(request, 'app/agregar_usuario_db.html', context)
        


    
@login_required(login_url="/login/")   
def editar_paciente_db(request, pk):
    
    if request.method == 'GET':
        paciente= User.objects.filter(pk = pk).values()[0]
        print(paciente)
        
        formulario = FormularioPacientes(initial=paciente)
        context = {'formulario':formulario, 'pk': pk}
        return render( request, 'app/editar_paciente_db.html', context)
    
    elif request.method == 'POST':
        
        formulario_devuelto = FormularioPacientes(request.POST)
        print(formulario_devuelto)
        if formulario_devuelto.is_valid() == True:
            datos_formulario = formulario_devuelto.cleaned_data
            datos_formulario['fecha_nacimiento']= datos_formulario['fecha_nacimiento'].strftime("%Y-%m-%d")
            paciente = User.objects.filter(id=pk).update(
                                    username = datos_formulario['username'],
                                    first_name = datos_formulario['first_name'],
                                    last_name = datos_formulario['last_name'],
                                    email= datos_formulario['email'],
                                    password = make_password(datos_formulario['password']),
                                    rut= datos_formulario['rut'],
                                    edad = datos_formulario['edad'],
                                    fecha_nacimiento = datos_formulario['fecha_nacimiento'],
                                    direccion= datos_formulario['direccion'],
                                    ocupacion= datos_formulario['ocupacion'],
                                    telefono = datos_formulario['telefono'],
                                    foto = datos_formulario['foto'],
                                    resumen= datos_formulario['resumen'],
                                    educacion = datos_formulario['educacion'],
                                    historial = datos_formulario['historial'],
                                    rol = datos_formulario['rol']
                                    )
            return redirect('app:agregar_usuario_db')
        else:
            context = {'formulario': formulario_devuelto}
            return render ( request, 'app/editar_paciente_db.html', context)
        
@login_required(login_url="/login/")       
def eliminar_pacientes_db(request, pk):
    
    if request.method == 'GET':
        context = {'pk': pk}
        return render(request, 'app/eliminar_pacientes_db.html', context)
    
    if request.method == 'POST':
        User.objects.filter(id = pk).delete()
        
        return redirect('app:agregar_usuario_db')