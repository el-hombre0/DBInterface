from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect

from .models import Guest

# Create your views here.

# def index(request):

#     tasks = Task.objects.order_by('id')[:]

#     return render(request, 'main/index.html', {'title': 'Главная страница сайта', 'tasks': tasks})

def index(request):
    guests = Guest.objects.all()
    return render(request, 'main/index.html', {'title': 'Список гостей', 'guests': guests})

def create(request):
    if request.method == "POST":
        guest = Guest()
        guest.id_administrator = request.POST.get("id_administrator")
        guest.id_room = request.POST.get("id_room")
        guest.first_name = request.POST.get("first_name")
        guest.second_name = request.POST.get("second_name")
        guest.birth_date = request.POST.get("birth_date")
        guest.visit_purpose = request.POST.get("visit_purpose")
        guest.note = request.POST.get("note")
        guest.save()
    return HttpResponseRedirect("/")

def edit(request, id_guest):
    try:
        guest = Guest.objects.get(id_guest=id_guest)

        if request.method == "POST":
            guest.id_administrator = request.POST.get("id_administrator")
            guest.id_room = request.POST.get("id_room")
            guest.first_name = request.POST.get("first_name")
            guest.second_name = request.POST.get("second_name")
            guest.birth_date = request.POST.get("birth_date")
            guest.visit_purpose = request.POST.get("visit_purpose")
            guest.note = request.POST.get("note")
            guest.save()
            return HttpResponseRedirect("/")
        else:
            return render(request, "main/edit.html", {"guest": guest})

    except Guest.DoesNotExist:
        return HttpResponseNotFound("<h2>Гость не найден!</h2>")


def delete(request, id_guest):
    try:
        guest = Guest.objects.get(id_guest=id_guest)
        guest.delete()
        return HttpResponseRedirect("/")
    except Guest.DoesNotExist:
        return HttpResponseNotFound("<h2>Гость не найден!</h2>")

# def about(request):

#     return render(request, 'main/about.html')


# def jls_extract_def():
#     error = ''
#     return error


# def create_task(request):

#     error = jls_extract_def()
#     if request.method == 'POST':
#         form = TaskForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('index')
#         else:
#             error = 'Форма не корректна'

#     form = TaskForm()
#     context = {
#         'form': form,
#         'error': error
#     }
#     return render(request, 'main/create_task.html', context)
