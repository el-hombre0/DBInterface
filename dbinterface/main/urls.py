from django.urls import path
from . import views

urlpatterns = [
    path('', views.guests, name='guests'),
    path('guest_create/', views.guest_create, name='guest_create'),
    path('guest_edit/<int:id_guest>/', views.guest_edit, name='guest_edit'),
    path('guest_delete/<int:id_guest>/', views.guest_delete, name='guest_delete'),


    path('payments/', views.payments, name='payments')
]