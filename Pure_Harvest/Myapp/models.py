from django.db import models

# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=300)
    password=models.CharField(max_length=300)
    type=models.CharField(max_length=300)

class farmer_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    # FARMER_id=LOGIN
    name=models.CharField(max_length=30)
    place=models.CharField(max_length=30)
    post = models.CharField(max_length=30)
    pin=models.IntegerField()
    phone=models.BigIntegerField()
    email=models.CharField(max_length=30)
    photo=models.CharField(max_length=500)
    status=models.CharField(max_length=50,default="pending")

class user_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=30)
    place=models.CharField(max_length=30)
    post = models.CharField(max_length=30)
    pin=models.IntegerField()
    phone=models.BigIntegerField()
    email=models.CharField(max_length=30)
    photo = models.CharField(max_length=500)

class fertilizer_table(models.Model):

    name=models.CharField(max_length=30)
    usage=models.CharField(max_length=30)
    description = models.CharField(max_length=300)
    company=models.CharField(max_length=50)
    photo=models.FileField()
    price = models.CharField(max_length=50,default="100")
    type = models.CharField(max_length=50,default="Organic Fertilizer")
    stock = models.CharField(max_length=50,default=30)
    current_stock = models.CharField(max_length=50, default=30)
class complaint_table(models.Model):
    LOGIN = models.ForeignKey(login_table, on_delete=models.CASCADE)
    complaint=models.TextField()
    date=models.DateField()
    reply=models.TextField()

class feedback_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    feedback=models.TextField()
    date=models.DateField()

class order_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    date=models.DateField()
    amount=models.FloatField()
    status=models.CharField(max_length=100)
    FARMER = models.ForeignKey(farmer_table, on_delete=models.CASCADE,default=1)

class product_table(models.Model):
    FARMER=models.ForeignKey(farmer_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=30)
    image=models.CharField(max_length=500)
    quantity=models.IntegerField()
    description = models.CharField(max_length=150,default="")
    price=models.FloatField()

class orderdetails_table(models.Model):
    ORDER=models.ForeignKey(order_table,on_delete=models.CASCADE)
    PRODUCT=models.ForeignKey(product_table,on_delete=models.CASCADE)
    quantity=models.IntegerField()
    amount = models.FloatField()
    status = models.CharField(max_length=100)

class chat_table(models.Model):
    fromid=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name="fromid")
    toid = models.ForeignKey(login_table, on_delete=models.CASCADE, related_name="toid")
    message=models.CharField(max_length=100)
    date=models.DateField()

class doubt_table(models.Model):
    FARMER=models.ForeignKey(farmer_table,on_delete=models.CASCADE)
    doubt=models.TextField()
    date=models.DateField()
    reply=models.TextField()


class fertbooking_table(models.Model):
    FERTILIZER=models.ForeignKey(fertilizer_table,on_delete=models.CASCADE,default=1)
    FARMER=models.ForeignKey(farmer_table,on_delete=models.CASCADE)
    date=models.DateField()
    status = models.CharField(max_length=100)
    qty = models.IntegerField()

class subsidy_table(models.Model):

    PRODUCT=models.ForeignKey(product_table,on_delete=models.CASCADE)
    subsidy=models.CharField(max_length=500)
    details=models.TextField()
    date=models.DateField()

class notification_table(models.Model):
    notification=models.TextField()
    date=models.DateField()

class payment_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    ORDER=models.ForeignKey(order_table,on_delete=models.CASCADE)
    amount=models.FloatField()
    date=models.DateField()
    status=models.CharField(max_length=100)

class Diease(models.Model):
    dieasename= models.CharField(max_length=100)
    details = models.CharField(max_length=2000)
    photo = models.FileField()

class Remedy(models.Model):
    remedy = models.CharField(max_length=100)
    description = models.CharField(max_length=500,default="")
    DISEASE=models.ForeignKey(Diease, on_delete=models.CASCADE)

class Cart(models.Model):
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE,default=1)
    PRODUCT= models.ForeignKey(product_table, on_delete=models.CASCADE)
    quantity=models.IntegerField()




