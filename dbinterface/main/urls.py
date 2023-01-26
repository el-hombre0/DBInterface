from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('create/', views.create, name='create')
    # path('guests_list', views.guests_list, name='guests_list')
]