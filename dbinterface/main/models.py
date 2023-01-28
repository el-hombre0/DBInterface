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
        verbose_name = 'Постоялец'
        verbose_name_plural = 'Постояльцы'

class Payment(models.Model):
    id_payment = models.AutoField('ID платежа', primary_key=True)
    id_room = models.IntegerField('ID комнаты')
    check_in_date = models.DateField('Дата заезда')
    check_out_date = models.DateField('Дата выезда')
    payment_accommodation = models.DecimalField('Стоимость проживания', max_digits=12, decimal_places=2)

    def __str__(self):
        return self.id_payment
    
    class Meta:
        verbose_name = 'Платёж'
        verbose_name_plural = 'Платежи'