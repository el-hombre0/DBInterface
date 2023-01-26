from django.db import models

# Create your models here.

class Guest(models.Model):
    id_guest = models.AutoField('ID гостя', primary_key=True)
    id_administrator = models.IntegerField('ID администратора')
    id_room = models.IntegerField('ID комнаты')
    first_name = models.CharField('Имя', max_length=70)
    second_name = models.CharField('Фамилия', max_length=70)
    birth_date = models.DateField('Дата рождения')
    visit_purpose = models.TextField('Цель визита')
    note = models.TextField('Заметка')

    def __str__(self):
        return self.id_guest
    
    class Meta:
        verbose_name = 'Гость'
        verbose_name_plural = 'Гости'