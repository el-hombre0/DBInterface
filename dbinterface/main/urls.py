from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index_guest'),
    path('create/', views.create, name='create_guest'),
    path('edit/<int:id_guest>/', views.edit, name='edit_guest'),
    path('delete/<int:id_guest>/', views.delete, name='delete_guest'),
]