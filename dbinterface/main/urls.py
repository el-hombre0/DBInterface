from django.urls import path
# from .views import SearchResultsView
from . import views

urlpatterns = [
    path('', views.guests, name='guests'),
    path('search/', views.search_results, name='search_results'),
    path('guest_create/', views.guest_create, name='guest_create'),
    path('guest_edit/<int:id_guest>/', views.guest_edit, name='guest_edit'),
    path('guest_delete/<int:id_guest>/', views.guest_delete, name='guest_delete'),


    path('payments/', views.payments, name='payments')
]