from django.contrib import admin
from .models import Guest


# Register your models here.
class GuestAdmin(admin.ModelAdmin):
    list_display = (
        'id_guest',
        'id_administrator', 
        'id_room', 
        'first_name', 
        'last_name',
        'birth_date', 
        'visit_purpose',
        'note'
        )

admin.site.register(Guest)
# admin.site.register(Payment)
