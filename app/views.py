from .models import Examenes, Administradores, Pacientes
import json
from typing import ContextManager
import datetime


from django.shortcuts import render, redirect
from django.conf import settings
from django.http import JsonResponse
from django.template.loader import render_to_string
from .forms import Login, Examen, FormularioPacientes,Selectform
from .models import Graficos

import random


# Create your views here.

def buscar(correo,clave,pacientes):
    for item in pacientes['pacientes']:
        if item['correo'] == correo and item['clave'] == clave:
            return True
    
def inicio(request):
    if request.method == "GET":
        formulario = Login(request.GET)   
        
        context = {'formulario':formulario}
    return render(request,'app/index.html',context)

def login_user(request):
    if request.method == "POST":
        formulario_lleno = Login(request.POST)
        if formulario_lleno.is_valid() == True:
            data = formulario_lleno.cleaned_data
            filename = "/app/data/base.json"
            with open(str(settings.BASE_DIR)+filename,'r') as file:
                contactos = json.load(file) 
            validar = buscar(data['correo'],data['clave'],contactos)
            if validar == True:
                return redirect('app:private')
            else:
                formulario_lleno = Login()
                return redirect('app:inicio')               
        else:
            formulario_lleno = Login()
            return redirect('app:inicio')



perfilusuario = dict()

def private(request):
    
    filename = "/app/data/base.json"
    with open(str(settings.BASE_DIR)+filename,'r') as file:
        perfiles = json.load(file)  
         
    if request.method == "POST":
        usuarios = request.POST.get('usuarios')
        
        for perfil in perfiles['pacientes']:
            if str(perfil['id']) == str(usuarios):
                perfilusuario['perfil'] = perfil
            
        return redirect('app:private')
   
    elif request.method == "GET":
        print(perfilusuario)
        formulario = Selectform(request.GET)
        context = {'formulario':formulario,'perfiles':perfiles['pacientes'],"perfiluser":perfilusuario}
        return render(request,'app/Privada.html',context)
   
    
                
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
    print('Este es el chart: ',charts)
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
    
    print(len(glucosa))
    print(len(hemograma))
    print(len(orina)) 
    datos['glucosa'] = glucosa
    datos['fecha_glucosa'] = fecha_glucosa
    datos['hemograma'] = hemograma
    datos['fecha_hemograma'] = fecha_hemograma     
    datos['orina'] = orina   
    datos['fecha_orina'] = fecha_orina
    #print('Estas son las fechas:', datos['fechas'])
    return render(request,'app/Graficos.html', {'labels':fecha_glucosa, 'labels':fecha_orina, 'labels':fecha_hemograma,'data':datos})


def listar_examenes(request):
    filename = "/app/data/base.json"
    with open(str(settings.BASE_DIR)+filename,'r') as file:
        pacientes = json.load(file)
        context = {"lista_examenes": pacientes['pacientes']}
        return render(request,'app/Examenes.html',context)


        
def agendar(request):
    return render(request,'app/Agendar.html')


def crear_examen(request):
    data = dict() # pa meter cosas 
    
    if request.method == 'POST':
        formulario = Examen(request.POST)
        if formulario.is_valid():
            datos_formulario = formulario.cleaned_data
            datos_formulario['fecha'] = datos_formulario['fecha'].strftime("%Y-%m-%d")
            
            examenes = {
                    "fecha":datos_formulario['fecha'],
                    "hemograma":datos_formulario['hemograma'],
                    "orina": datos_formulario['orina'],
                    "colesterolhdl": datos_formulario['colesterolhdl'],
                    "colesterolldl":datos_formulario['colesterolldl'],
                    "glucosa":datos_formulario['glucosa']  
                }
            datos_formulario['examenes'] = []
            filename = "/app/data/base.json"
            with open(str(settings.BASE_DIR)+filename,'r') as file:
                pacientes = json.load(file)   
                for item in pacientes['pacientes']:
                    if str(item['rut']) == str(datos_formulario['rut']):
                        item['examenes'].append(examenes)
                        data['formulario_is_valid'] = True
                    else:
                        data['formulario_is_valid'] = False
            
            with open(str(settings.BASE_DIR)+filename,'w') as file:
                 json.dump(pacientes,file)
            
            data['html_examenes_list'] = render_to_string('app/Examenes_lista_parcial.html',{
                'lista_examenes': pacientes['pacientes']
                })      
        else:
            data['formulario_is_valid'] = False 
    else:
        formulario = Examen()
    
    context = {'formulario': formulario}
    data['html_formulario'] = render_to_string('app/Examen_parcial.html',
                                               context,
                                               request = request,)
    return JsonResponse(data)

def eliminar_examen(request,pk):
    
    filename= "/app/data/base.json"
    with open(str(settings.BASE_DIR)+filename, 'r') as file:
        pacientes = json.load(file)
    
    if request.method == "POST":
        for examen in pacientes['pacientes']:
            print(examen['id'])
            print(pk)
            
            if str(examen['id']) == str(pk):
                pacientes['pacientes'].remove(examen)
                break
            
        with open(str(settings.BASE_DIR)+filename, 'w') as file:
            json.dump(pacientes,file)
        return redirect('app:examenes')

    else:
        
        context = {'pk': pk}
        return render(request, 'app/Eliminar_examen_parcial.html', context)
            



def context_lista_pacientes():
    filename = "/app/data/base.json"
    with open(str(settings.BASE_DIR)+filename, 'r') as file:
        pacientes = json.load(file)
    context= {'lista_pacientes': pacientes['pacientes']}
    return context
    

def agregar_usuario(request):
    
    if request.method == 'GET':
        formulario = FormularioPacientes()
        context = {'formulario': formulario}
        context.update(context_lista_pacientes())
        #print(context)
        return render(request,'app/Agregar_usuario.html',context)

    elif request.method == 'POST':
        #print('El post contiene:', request.POST)
        
        formulario_devuelto = FormularioPacientes(request.POST)
        
        if formulario_devuelto.is_valid() == True:
            datos_formulario = formulario_devuelto.cleaned_data
            datos_formulario['fecha']= datos_formulario['fecha'].strftime("%Y-%m-%d")
            datos_formulario['examenes'] = []
            
           # print ('los datos limpios del formulario son: ', datos_formulario)
            filename = '/app/data/base.json'
            with open(str(settings.BASE_DIR)+ filename, 'r') as file:
                data= json.load(file)
                nuevo_ultimo_id = int(data['ultimo_id']) + 1
                data['ultimo_id'] = nuevo_ultimo_id
                datos_formulario['id'] = nuevo_ultimo_id
                data['pacientes'].append(datos_formulario)
            with open(str(settings.BASE_DIR)+ filename, 'w') as file:
                json.dump(data, file)
                
            return redirect('app:agregar_usuario')
             
        else:
            context= {'formulario': formulario_devuelto}
            context.update(context_lista_pacientes())
            return render(request, 'app/agregar_usuario.html', context)
        
        
def agregar_usuario_db(request):
    
    if request.method == 'GET':
        formulario = FormularioPacientes()
        context = {'formulario': formulario}
        pacientes = Pacientes.objects.all()
        context={ 'formulario': formulario,
                 'lista_pacientes': pacientes}
        print(context)
        return render(request,'app/agregar_usuario_db.html',context)

    elif request.method == 'POST':
        #print('El post contiene:', request.POST)
        
        formulario_devuelto = FormularioPacientes(request.POST)
        
        if formulario_devuelto.is_valid() == True:
            datos_formulario = formulario_devuelto.cleaned_data
            datos_formulario['fecha']= datos_formulario['fecha'].strftime("%Y-%m-%d")
            
            Pacientes.objects.create(nombre= datos_formulario['nombre'],
                                    correo= datos_formulario['correo'],
                                    clave= datos_formulario['clave'],
                                    rut= datos_formulario['rut'],
                                    edad = datos_formulario['edad'],
                                    fecha = datos_formulario['fecha'],
                                    direccion= datos_formulario['direccion'],
                                    ocupacion= datos_formulario['ocupacion'],
                                    telefono = datos_formulario['telefono'],
                                    foto = datos_formulario['foto'],
                                    resumen= datos_formulario['resumen'],
                                    educacion = datos_formulario['educacion'],
                                    historial = datos_formulario['historial'],
                                    examenes = Examenes.objects.all()[0],
                                    )
                
            return redirect('app:agregar_usuario_db')
             
        else:
            context= {'formulario': formulario_devuelto}
            context.update(context_lista_pacientes())
            return render(request, 'app/agregar_usuario_db.html', context)
        


def lista_pacientes(request):
    context = context_lista_pacientes()
    return render( request, 'app/lista_pacientes.html', context)


def eliminar_pacientes(request, rut):
    
    if request.method == "GET":
        context = { 'rut': rut}
        return render( request, 'app/eliminar_pacientes.html', context)
    
    if request.method == "POST":
        filename ="/app/data/base.json"
        with open(str(settings.BASE_DIR)+filename, 'r') as file:
            data=json.load(file)
        for paciente in data['pacientes']:
            if str(paciente['rut']) == rut:
                data['pacientes'].remove(paciente)
                break
        with open(str(settings.BASE_DIR)+filename, 'w') as file:
            json.dump(data, file)
            
        return redirect('app:agregar_usuario')
    
def eliminar_pacientes_db(request, rut):
    
    if request.method == 'GET':
        context = {'rut': rut}
        return render(request, 'app/eliminar_pacientes_db.html', context)
    
    if request.method == 'POST':
        Pacientes.objects.filter(rut = rut).delete()
        
        return redirect('app:agregar_usuario_db')
    
    
def editar_paciente_db(request, rut):
    
    if request.method == 'GET':
        paciente= Pacientes.objects.filter(rut = rut).values()[0]
        
        formulario = FormularioPacientes(initial=paciente)
        context = {'formulario':formulario, 'rut': rut}
        return render( request, 'app/editar_paciente_db.html', context)
    
    elif request.method == 'POST':
        formulario_devuelto = FormularioPacientes(request.POST)
        if formulario_devuelto.is_valid() == True:
            datos_formulario = formulario_devuelto.cleaned_data
            datos_formulario['fecha']=datos_formulario['fecha'].strftime("%Y-%m-%d")
            paciente = Pacientes.objects.filter(rut=rut).update(
                                    nombre= datos_formulario['nombre'],
                                    correo= datos_formulario['correo'],
                                    clave= datos_formulario['clave'],
                                    rut= datos_formulario['rut'],
                                    edad = datos_formulario['edad'],
                                    fecha = datos_formulario['fecha'],
                                    direccion= datos_formulario['direccion'],
                                    ocupacion= datos_formulario['ocupacion'],
                                    telefono = datos_formulario['telefono'],
                                    foto = datos_formulario['foto'],
                                    resumen= datos_formulario['resumen'],
                                    educacion = datos_formulario['educacion'],
                                    historial = datos_formulario['historial']
                                    )
            return redirect('app:agregar_usuario_db')
        else:
            context = {'formulario': formulario_devuelto}
            return render ( request, 'app/editar_paciente_db.html', context)
        

        

def eliminar_pacientes_db(request, rut):
    
    if request.method == 'GET':
        context = {'rut': rut}
        return render(request, 'app/eliminar_pacientes_db.html', context)
    
    if request.method == 'POST':
        Pacientes.objects.filter(rut = rut).delete()
        
        return redirect('app:agregar_usuario_db')
    