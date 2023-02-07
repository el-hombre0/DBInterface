from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
# from django.views.generic import ListView
from django.db.models import Q

from .models import Guest, Payment

# Create your views here.

def search_results(request):
    query = request.GET.get('q')
    search_thing = "1"
    match search_thing:
        case "1":
            add_serv = AddServ.object.filter()
            return render(request, 'main/search_results.html', {'title': 'Поиск', 'guests': add_serv})

    guests = Guest.objects.filter(Q(first_name=query) | Q(second_name=query))
    return render(request, 'main/search_results.html', {'title': 'Поиск', 'guests': guests})


def guests(request):
    guests = Guest.objects.all()
    return render(request, 'main/guests.html', {'title': 'Список гостей', 'guests': guests})

def guest_create(request):
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

def guest_edit(request, id_guest):
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
            return render(request, "main/guest_edit.html", {"guest": guest})

    except Guest.DoesNotExist:
        return HttpResponseNotFound("<h2>Гость не найден!</h2>")


def guest_delete(request, id_guest):
    try:
        guest = Guest.objects.get(id_guest=id_guest)
        guest.delete()
        return HttpResponseRedirect("/")
    except Guest.DoesNotExist:
        return HttpResponseNotFound("<h2>Гость не найден!</h2>")


def payments(request):
    payments = Payment.objects.all()
    return render(request, 'main/payments.html', {'title': 'Платежи', 'payments': payments})
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
