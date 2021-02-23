import json
from typing import ContextManager


from django.shortcuts import render, redirect, get_object_or_404
from django.conf import settings
from django.http import JsonResponse
from django.template.loader import render_to_string
from .forms import Login, Examen, FormularioPacientes,Selectform
from .models import Examenes


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
    hemograma = []
    orina = []
    fechas = []
        
    filename = "/app/data/base.json"
    with open(str(settings.BASE_DIR)+filename,'r') as file:
        pacientes = json.load(file)
        pacientes = pacientes['pacientes']
        for item in pacientes:
            for lista in item['examenes']:
                glucosa.append(lista['glucosa'])
                hemograma.append(lista['hemograma'])
                orina.append(lista['orina'])
                fechas.append(lista['fecha'])
    datos['glucosa'] = glucosa
    datos['hemograma'] = hemograma
    datos['orina'] = orina
    datos['fechas'] = fechas
    return render(request,'app/Graficos.html',{'labels': fechas,'data':datos})



def agendar(request):
    return render(request,'app/Agendar.html')

##############################################
################## GILBERT ###################
##############################################

def listar_examenes(request):
        examenes = Examenes.objects.values()
        context = {"lista_examenes": examenes}
        return render(request,'app/examenes/Examenes.html',context)


def crear_examen(request):
    data = dict() # pa meter cosas 
    
    if request.method == 'POST':
        formulario = Examen(request.POST)
        if formulario.is_valid():
            datos_formulario = formulario.cleaned_data
            datos_formulario['fecha'] = datos_formulario['fecha'].strftime("%Y-%m-%d")
            Examenes.objects.create(
                nombre = datos_formulario['nombre'],
                valor = datos_formulario['valor'],
                fecha = datos_formulario['fecha'],
                observaciones = datos_formulario['observaciones']
            )
            data['formulario_is_valid'] = True
            examenes = Examenes.objects.values()
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
                observaciones = datos_formulario['observaciones']
            )
            data['formulario_is_valid'] = True
            examenes = Examenes.objects.values()
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


def eliminar_examen(request,pk):
    examen = get_object_or_404(Examenes, pk=pk)
    data = dict()
    if request.method == 'POST':
        examen.delete()
        data['formulario_is_valid'] = True
        examenes = Examenes.objects.values()
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
            

##############################################
################## GILBERT ###################
##############################################

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
            return render(request, 'app/Agregar_usuario.html', context)
        


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


    