from django.shortcuts import render

# Create your views here.

# Create your views here.
import smtplib
from datetime import datetime
from email.mime.text import MIMEText

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models.query_utils import Q
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.shortcuts import render, redirect

# from Myapp.CNN_PREDICTION import predict
from Myapp.models import *

def login(request):
    return render(request,'intexlogin.html')

def logout(request):
    auth.logout(request)
    return render(request,'intexlogin.html')



def login_post(request):
    un=request.POST['username']
    psw=request.POST['pass']

    try:
        ob=login_table.objects.get(username=un,password=psw)
        if ob.type=="admin":

            request.session['lid']=ob.id
            return redirect('/admin_home')
            # return HttpResponse('''<script>alert("welcome admin");window.location="/admin_home"'</script>''')
        # elif ob.type=="officer":
        #
        #     request.session['lid'] = ob.id
        #     return HttpResponse('''<script>alert("welcome officer");window.location="/officerhome"</script>''')
        else:
            return HttpResponse('''<script>alert("Invalid");window.location="/"</script>''')
    except:
        return HttpResponse('''<script>alert("Invalid");window.location="/"</script>''')



# _______________________________ADMIN____________________________________________


def add_fertilizer(request):
    return render(request,'admin/add.html')




def add_fertilizer_post(request):
    name=request.POST['textfield']
    photo=request.FILES['file']
    fs=FileSystemStorage()
    fsave=fs.save(photo.name, photo)
    usage=request.POST['textfield2']
    desc=request.POST['textfield3']
    company=request.POST['textfield7']
    price=request.POST["price"]
    stock = request.POST["stock"]
    type = request.POST['type']


    ob1 =  fertilizer_table()
    ob1.name = name
    ob1.description=desc
    ob1.usage=usage
    ob1.company=company
    ob1.photo=fsave
    ob1.type=type
    ob1.price=price
    ob1.stock = stock
    ob1.current_stock = stock
    ob1.save()
    return HttpResponse('''<script>alert("SUCCESSFULLY ADDED");window.location="/managefert"</script>''')


def admin_home(request):
    return render(request,'admin/admin_index.html')

def feedback(request):
    ob=feedback_table.objects.all()
    return render(request,'admin/feedback.html',{'val':ob})


def search_feed(request):
    dt = request.POST['textfield']
    ob=feedback_table.objects.filter(date=dt)
    return render(request,'admin/feedback.html',{'val':ob})



def editfertilizer(request,id):
    request.session['idd']=id
    ob=fertilizer_table.objects.get(id=id)
    return render(request,"admin/editfertilizer.html",{"val":ob})


def editfertilizerpost(request):
    if 'file' in request.FILES:
        name = request.POST['textfield']
        photo = request.FILES['file']
        fs = FileSystemStorage()
        fsave = fs.save(photo.name, photo)
        usage = request.POST['textfield2']
        desc = request.POST['textfield3']
        company = request.POST['textfield7']
        price = request.POST["price"]

        type = request.POST['type']


        ob1 = fertilizer_table.objects.get(id=request.session['idd'])
        ob1.name = name
        ob1.description = desc
        ob1.usage = usage
        ob1.company = company
        ob1.photo = fsave
        ob1.type = type
        ob1.price = price
        ob1.save()

        return HttpResponse('''<script>alert("SUCCESSFULLY EDITED");window.location="/managefert"</script>''')
    else:
        name = request.POST['textfield']

        usage = request.POST['textfield2']
        desc = request.POST['textfield3']
        company = request.POST['textfield7']
        price = request.POST["price"]

        type = request.POST['type']

        ob1 = fertilizer_table.objects.get(id=request.session['idd'])
        ob1.name = name
        ob1.description = desc
        ob1.usage = usage
        ob1.company = company

        ob1.type = type
        ob1.price = price
        ob1.save()
        return HttpResponse('''<script>alert("SUCCESSFULLY EDITED");window.location="/managefert"</script>''')

def search_noti(request):
    dt = request.POST['textfield']
    ob=notification_table.objects.filter(date=dt)
    return render(request,'admin/view_notifications.html',{'data':ob})

def delete_fertilizer(request,id):
    ob=fertilizer_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("SUCCESSFULLY DELETED");window.location="/managefert"</script>''')


def managefert(request):
    ob=fertilizer_table.objects.all()
    return render(request, 'admin/managefert.html', {'val':ob})


def search_fert(request):
    srch=request.POST['textfield']
    ob=fertilizer_table.objects.filter(name__icontains=srch)
    return render(request, 'admin/managefert.html', {'val':ob, "s":srch})


def sendreply (request,id):
    request.session['sr']=id
    return render(request,'admin/sendreply.html')


def sendreplypost(request):
    rply=request.POST['textfield']
    ob=complaint_table.objects.get(id=request.session['sr'])
    ob.reply=rply
    ob.save()
    return HttpResponse('''<script>alert("Reply Send");window.location="/view_complaint"</script>''')


def view_complaint(request):
    ob=complaint_table.objects.all()
    l=[]
    for d in ob:
        
        if login_table.objects.filter(id=d.LOGIN_id).exists():
            if login_table.objects.get(id=d.LOGIN_id).type=="farmer":
                f=farmer_table.objects.get(LOGIN_id=d.LOGIN_id)
                l.append({"id":d.id,"complaint":d.complaint,"date":d.date,"reply":d.reply,"Name":f.name})
            else:
                f = user_table.objects.get(LOGIN_id=d.LOGIN_id)
                l.append({"id": d.id, "complaint": d.complaint, "date": d.date, "reply": d.reply, "Name": f.name})
    return render(request,'admin/view complaint.html',{'val':l})


def searchcomplaint(request):
    s=request.POST['select']
    if s=='u':
        ob=complaint_table.objects.filter(LOGIN__type='user')
    else:
        ob=complaint_table.objects.filter(LOGIN__type='farmer')

    return render(request,'admin/view complaint.html',{"val":ob,'t':s})




def viewfarmer(request):
    ob=farmer_table.objects.all()
    return render(request,'admin/viewfarmer.html',{'val':ob})


def block(request,id):
    bl = farmer_table.objects.get(id=id)
    bl.status = "rejected"
    bl.save()
    return HttpResponse('''<script>alert("Rejected");window.location="/viewfarmer#Services"</script>''')



def unblock(request,id):
    bl=farmer_table.objects.get(id=id)
    bl.status="approved"
    bl.save()
    return HttpResponse('''<script>alert("Approved");window.location="/viewfarmer#Services"</script>''')




def search_farmer(request):
    name = request.POST['textfield']
    ob = farmer_table.objects.filter(name__icontains=name)
    return render(request,'admin/viewfarmer.html',{'val':ob})


def view_users(request):
    ob = user_table.objects.all()
    return render(request,'admin/view_users.html',{'val':ob})


def search_user(request):
    name = request.POST['textfield']
    ob = user_table.objects.filter(name__icontains=name)
    return render(request,'admin/view_users.html',{'val':ob})

def send_notification(request):
    return render(request, 'admin/send_notification.html')


def send_not(request):
    noti = request.POST['textfield']
    ob = notification_table()
    ob.notification=noti
    ob.date = datetime.today()
    ob.save()
    return HttpResponse('''<script>alert("NOTIFICATION SENDED");window.location="/admin_home"</script>''')

def view_notification(request):
    data=notification_table.objects.all()
    return render(request, 'admin/view_notifications.html',{"data":data})
def delete_noti(request,id):
    ob=notification_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("SUCCESSFULLY DELETED");window.location="/view_notification"</script>''')


def view_fert_book(request):
    data=fertbooking_table.objects.all()
    return render(request, 'admin/view_fert_booking.html',{"data":data})

def app_fert(request,id):
    ob=fertbooking_table.objects.get(id=id)
    ob.status="approved"
    ob.save()
    return HttpResponse('''<script>alert("APPROVED");window.location="/view_fert_book"</script>''')


def rej_fert(request,id):
    ob = fertbooking_table.objects.get(id=id)
    ob.status = "rejected"
    ob.save()
    return HttpResponse('''<script>alert("REJECTED");window.location="/view_fert_book"</script>''')





def disease_edit(request,id):
    a=Diease.objects.get(id=id)
    return render(request,'admin/disease edit.html',{'data':a})
def disease_edit_post(request):
    id = request.POST['id']
    diseasename=request.POST['textfield']
    details=request.POST['textarea']
    if 'file' in request.FILES:
        photo = request.FILES['file']

        fs = FileSystemStorage()
        fsave = fs.save(photo.name, photo)

        obj = Diease.objects.get(id=id)
        obj.dieasename = diseasename
        obj.details = details
        obj.photo=fsave
        obj.save()
    else:
        obj = Diease.objects.get(id=id)
        obj.dieasename = diseasename
        obj.details = details
        obj.save()
    return HttpResponse('''<script>alert(" Updated ... ");window.location='/disease_view'</script>''')


def disease_view(request):
    res=Diease.objects.all()
    return render(request,'admin/disease view.html',{'data':res})
def disease_delete(request,id):
    res=Diease.objects.get(id=id)
    res.delete()
    return HttpResponse('''<script>alert(" Deleted ");window.location='/disease_view'</script>''')


def disease_view_post(request):

    diseasename=request.POST['textfield']
    res=Diease.objects.filter(dieasename__icontains=diseasename)
    return render(request,'admin/disease view.html',{'data':res})

def disease(request):

    return render(request,'admin/disease.html')

def disease_post(request):

    diseasename = request.POST['textfield']
    details = request.POST['textarea']
    # symptoms = request.POST['textfield2']


    photo = request.FILES['file']
    fs = FileSystemStorage()
    fsave = fs.save(photo.name, photo)
    obj=Diease()
    obj. dieasename=diseasename
    obj.details=details
    obj.photo=fsave

    obj.save()

    return HttpResponse('''<script>alert(" successfully added");window.location='/disease'</script>''')

def remedies(request,id):
    request.session["did"]=id
    data=Remedy.objects.filter(DISEASE_id=id)

    return render(request,"admin/remedies view.html",{"data":data})

def add_remedies(request):
    return render(request, "admin/remedies.html")

def add_remedies_post(request):
    details = request.POST['textarea']
    obj = Remedy()
    obj.description = details
    obj.remedy=request.POST["textfield"]
    obj.DISEASE_id = request.session["did"]
    obj.save()
    return remedies(request,request.session["did"])

def remedy_delete(request,id):
    res=Remedy.objects.get(id=id)
    res.delete()
    return remedies(request,request.session["did"])


def remedy_edit(request,id):
    a=Remedy.objects.get(id=id)
    return render(request,'admin/remedyedit.html',{'data':a})
def remedy_edit_post(request):
    id = request.POST['id']
    diseasename=request.POST['textfield']
    details=request.POST['textarea']

    obj = Remedy.objects.get(id=id)
    obj.remedy = diseasename
    obj.description=details
    obj.save()
    return remedies(request, request.session["did"])


def viewdoubts (request):
    ob = doubt_table.objects.all()
    return render(request,'admin/viewdoubts.html',{'val':ob})


def search_doubt(request):
    dt = request.POST['textfield']
    ob=doubt_table.objects.filter(date=dt)
    return render(request,'admin/viewdoubts.html',{'val':ob})


def replysend(request,id):
    request.session['did']=id
    return render(request,'admin/replysend.html')


def replysend_post(request):
    rply=request.POST['textarea']
    ob=doubt_table.objects.get(id=request.session['did'])
    ob.reply=rply
    ob.save()
    return HttpResponse('''<script>alert("Reply Sended");window.location="/viewdoubts"</script>''')




#______________________________ANDROID_____________________________


import json


def and_login(request):
    un = request.POST['name']
    psw = request.POST['password']

    try:
        ob = login_table.objects.get(username=un, password=psw)
        if ob.type == "user":
            if user_table.objects.filter(LOGIN__id=ob.id).exists():
                ob1=user_table.objects.get(LOGIN__id=ob.id)
                return JsonResponse({"status": "ok", "type": ob.type, "lid": ob.id, "image": ob1.photo, 'uid': ob1.id})
            else:
                return JsonResponse({"status":"no"})
        else:
            if farmer_table.objects.filter(LOGIN__id=ob.id,status='approved').exists():
                ob1 = farmer_table.objects.get(LOGIN__id=ob.id,status='approved')
                return JsonResponse({"status": "ok", "type": ob.type, "lid": ob.id, "image": ob1.photo, 'uid': ob1.id})
            else:
                return JsonResponse({"status":"no"})

    except Exception as e:
        print(e)
        return JsonResponse({"status":"no"})


def farmerviewprofile(request):
    lid=request.POST['lid']
    res=farmer_table.objects.get(LOGIN__id=lid)
    return JsonResponse({"status":"ok","uname":res.LOGIN.username,"name":res.name,"place":res.place,
                         "pin":res.pin,"post":res.post,"district":res.place,"phone":res.phone,
                         "email":res.email,"age":res.photo,"photo":res.photo})


def farmer_editprofile_post(request):
    uname=request.POST['username']

    name=request.POST['name']
    place=request.POST['place']
    pin=request.POST['pin']
    post=request.POST['post']

    phone=request.POST['phone']
    email=request.POST['email']

    photo=request.POST['photo']
    lid=request.POST['lid']
    f = farmer_table.objects.get(LOGIN__id=lid)
    if photo !="no":
        import datetime
        import base64
        date=datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
        a=base64.b64decode(photo)
        fh=open("C:\\Users\\Hp\\Documents\\Project\\Pure_Harvest\\media\\"+date+".jpg","wb")
        path=date+".jpg"
        fh.write(a)
        fh.close()
        f.photo = path


    lobj=login_table.objects.get(id=lid)
    lobj.username=uname

    lobj.save()
    f.name=name
    f.place=place
    f.pin=pin
    f.post=post

    f.phone=phone
    f.email=email

    f.save()

    return JsonResponse({"status":"ok"})



def farmer_update_stock(request):
    q=request.POST['quantity']
    lid=request.POST['lid']
    pid=request.POST['opid']
    
    x=product_table.objects.get(id=pid)
    x.quantity=q
    x.save()
    return JsonResponse({"status":"ok"})

    



def user_editprofile_post(request):
    uname=request.POST['username']

    name=request.POST['name']
    place=request.POST['place']
    pin=request.POST['pin']
    post=request.POST['post']

    phone=request.POST['phone']
    email=request.POST['email']

    photo=request.POST['photo']
    lid=request.POST['lid']
    f = user_table.objects.get(LOGIN__id=lid)
    if photo !="no":
        import datetime
        import base64
        date=datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
        a=base64.b64decode(photo)
        fh=open("media/"+date+".jpg","wb")
        path=date+".jpg"
        fh.write(a)
        fh.close()
        f.photo = path


    lobj=login_table.objects.get(id=lid)
    lobj.username=uname

    lobj.save()
    f.name=name
    f.place=place
    f.pin=pin
    f.post=post

    f.phone=phone
    f.email=email

    f.save()

    return JsonResponse({"status":"ok"})


def farmerviewnotifications(request):
    res=notification_table.objects.all()
    l=[]
    for i in res:
        l.append({'id':i.id,'date':i.date,'notification':i.notification})
    return JsonResponse({"status": "ok","data": l})


def  farmer_view(request):
    res=fertilizer_table.objects.all()
    l=[]
    for i in res:
        l.append({"id":i.id,"item":i.name,"availability":i.description,"usage":i.usage,"price":i.price,"quantity":i.usage,"photo":i.photo.url.replace("/media",""),"company":i.company,"type":i.type,"stock":i.current_stock})
    return JsonResponse({"status":"ok","data":l})


def farmersendrequest(request):
    lid=request.POST["lid"]
    pid=request.POST['pid']
    a=fertbooking_table()
    a.FARMER=farmer_table.objects.get(LOGIN__id=lid)
    a.FERTILIZER_id=pid
    a.date = datetime.now().today().date()
    a.status="pending"
    a.qty=1
    a.save()

    b=fertilizer_table.objects.get(id=pid)
    b.current_stock =int(b.current_stock)-1
    b.save()
    return JsonResponse({"status": "ok"})



def farmerviewrequeststatus(request):
    id=request.POST['lid']
    ld=farmer_table.objects.get(LOGIN__id=id)
    res = fertbooking_table.objects.filter(FARMER=ld)
    l = []
    for i in res:
        l.append({"id": i.id, "qty": i.qty, "name": i.FERTILIZER.name,"photo":i.FERTILIZER.photo.url.replace("/media",""), "date": i.date,"status":i.status})
    return JsonResponse({"status": "ok", "data": l})


def farmeraddproductmanagement(request):
    lid=request.POST["lid"]
    product=request.POST["Product"]
    price=request.POST["price"]
    availability=request.POST["availability"]
    photo = request.POST['photo']
    des = request.POST['description']
    

    import datetime
    import base64
    date = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    a = base64.b64decode(photo)
    fh = open("media/products/" + date + ".jpg", "wb")
    path = "products/"+date + ".jpg"
    fh.write(a)
    fh.close()

    a=product_table()
    a.FARMER=farmer_table.objects.get(LOGIN__id=lid)
    a.name= product
    a.price= price
    a.image=path
    a.description=des
    a.quantity= availability
    a.save()
    return JsonResponse({"status": "ok"})

def farmerviewproductmanagement(request):
    lid=request.POST["lid"]
    ld=farmer_table.objects.get(LOGIN__id=lid)
    res = product_table.objects.filter(FARMER=ld)
    l = []
    for i in res:
        l.append({"id":i.id,"name": i.name,"description": i.description, "price": i.price, "availability": i.quantity,"image":i.image})
    return JsonResponse({"status": "ok", "data": l})



def farmer_delete_product(request):
    pid=request.POST["pid"]
    product_table.objects.filter(id=pid).delete()

    return JsonResponse({"status": "ok"})

def PredictDisease(request):
    photo = request.POST['photo']
    import datetime
    import base64
    import tensorflow as tf
    import sys
    import os

    # Save the uploaded image
    date = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    a = base64.b64decode(photo)
    fh = open("media/a.jpg", "wb")
    fh.write(a)
    fh.close()

    # Disable tensorflow compilation warnings
    os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

    # Read the image data using TF 2.x compatible method
    with open("media/a.jpg", "rb") as f:
        image_data = f.read()

    # Load label file
    with open("Myapp\\logsold\\output_labels.txt", "r") as label_file:
        label_lines = [line.strip() for line in label_file]

    # Load graph
    graph_def = tf.compat.v1.GraphDef()
    with open("Myapp\\logsold\\output_graph.pb", "rb") as f:
        graph_def.ParseFromString(f.read())
        _ = tf.import_graph_def(graph_def, name='')

    df = []

    with tf.compat.v1.Session() as sess:
        softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')

        predictions = sess.run(softmax_tensor, {
            'DecodeJpeg/contents:0': image_data
        })

        top_k = predictions[0].argsort()[-len(predictions[0]):][::-1]

        for node_id in top_k:
            human_string = label_lines[node_id]
            score = predictions[0][node_id]
            print('%s (score = %.5f)' % (human_string, score))
            df.append(human_string)

    result = df[0]
    return JsonResponse({"status": "ok", "result": result})


# def PredictDisease(request):
#     photo=request.POST['photo']
#     import datetime
#     import base64
#     date=datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
#     a=base64.b64decode(photo)
#     # fh=open("C:\\Users\\Hp\\Documents\\Project\\Pure_Harvest\\media\\a.jpg","wb")
#     fh=open("media/a.jpg","wb")
#     fh.write(a)
#     fh.close()
#     import tensorflow as tf
#     import sys
#     import os

#     # Disable tensorflow compilation warnings
#     os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
#     import tensorflow as tf

#     # image_path = sys.argv[1]
#     # image_path="C:\\Users\\ELCOT-Lenovo\\Documents\\images\\sign_dataset\\test\\A\\color_0_0016"
#     # Read the image_data
#     image_data = tf.gfile.FastGFile(
#         "media/a.jpg",
#         'rb').read()
#     # Loads label file, strips off carriage return
#     label_lines = [line.rstrip() for line
#                    in tf.gfile.GFile("Pure_Harvest\\Pure_Harvest\\Myapp\\logsold\\output_labels.txt")]

#     # Unpersists graph from file
#     with tf.gfile.FastGFile("Pure_Harvest\\Pure_Harvest\\Myapp\\logsold\\output_graph.pb", 'rb') as f:
#         graph_def = tf.GraphDef()
#         graph_def.ParseFromString(f.read())
#         _ = tf.import_graph_def(graph_def, name='')
#     df = []
#     with tf.Session() as sess:
#         # Feed the image_data as input to the graph and get first prediction
#         softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')

#         predictions = sess.run(softmax_tensor, \
#                                {'DecodeJpeg/contents:0': image_data})

#         # Sort to show labels of first prediction in order of confidence
#         top_k = predictions[0].argsort()[-len(predictions[0]):][::-1]

#         for node_id in top_k:
#             human_string = label_lines[node_id]
#             score = predictions[0][node_id]
#             print('%s (score = %.5f)' % (human_string, score))
#             df.append(human_string)
#     result =  df[0]
#     return JsonResponse({"status":"ok","result":'Result:\n'+result})



def farmersenddoubt(request):
    lid=request.POST["lid"]
    doubts=request.POST["feedback"]
    a=doubt_table()
    a.FARMER=farmer_table.objects.get(LOGIN__id=lid)
    a.doubt=doubts
    a.date = datetime.now().today().date()
    a.reply="pending"
    a.save()
    return JsonResponse({"status": "ok"})


def farmerviewdoubtreply(request):
    lid=request.POST['lid']
    res = doubt_table.objects.filter(FARMER=farmer_table.objects.get(LOGIN__id=lid))
    l = []
    for i in res:
        l.append({"id": i.id,"FARMER": i.FARMER.name, "doubt": i.doubt, "date": i.date, "reply": i.reply, "stat": i.reply })
    return JsonResponse({"status": "ok", "data": l})




def farmer_signup_post(request):

    password=request.POST['password']
    name=request.POST['name']
    place=request.POST['place']
    pin=request.POST['pin']
    post=request.POST['post']
    type=request.POST['type']
    phone=request.POST['phone']
    email=request.POST['email']

    photo=request.POST['photo']
    import datetime
    import base64
    date=datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    a=base64.b64decode(photo)
   
    fh=open("media/"+date+".jpg","wb")
    
    path=date+".jpg"
    fh.write(a)
    fh.close()
    if type == "farmer":
        lobj=login_table()
        lobj.username=email
        lobj.password=password
        lobj.type='farmer'
        lobj.save()
        f=farmer_table()
        f.name=name
        f.place=place
        f.pin=pin
        f.post=post

        f.phone=phone
        f.email=email

        f.photo=path
        f.LOGIN=lobj
        f.save()
    else:
        lobj = login_table()
        lobj.username = email
        lobj.password = password
        lobj.type = 'user'
        lobj.save()
        f = user_table()
        f.name = name
        f.place = place
        f.pin = pin
        f.post = post
        f.phone = phone
        f.email = email
        f.photo = path
        f.LOGIN = lobj
        f.save()

    return JsonResponse({"status":"ok"})




def farmerviewdis(request):

    res = Diease.objects.all()
    l = []
    for i in res:
        l.append({"id": i.id,"dis": i.dieasename, "details": i.details, "photo": i.photo.url })
    
    return JsonResponse({"status": "ok", "data": l})


def farmerviewrem(request):
    lid=request.POST['did']
    res = Remedy.objects.filter(DISEASE_id=lid)
    l = []
    for i in res:
        l.append({"id": i.id,"dis": i.description, "remedy": i.remedy })
    print(l)
    return JsonResponse({"status": "ok", "data": l})


def farmerviewproductfromotherfarmers(request):
    res = product_table.objects.all()
    l = []
    for i in res:
        l.append({ "id": i.id, "name": i.name, "price": i.price,"description":i.description, "availability": i.quantity ,"photo":i.image})
        print(l)
    return JsonResponse({"status": "ok", "data": l})



def farmeraddquantity(request):
    lid=request.POST["lid"]
    opid=request.POST["opid"]
    print(lid,"lid")
    print(opid,"opid")


    quantity=request.POST["quantity"]


    a=Cart()
    a.USER=user_table.objects.get(LOGIN__id=lid)
    a.quantity=quantity
    a.PRODUCT_id=opid
    a.save()
    return JsonResponse({"status": "ok"})



def farmerviewquantity(request):
    lid = request.POST["lid"]
    res =Cart.objects.filter(USER=user_table.objects.get(LOGIN__id=lid))
    l = []

    print(res)
    for i in res:
        tamount=int(i.quantity)*int(i.PRODUCT.price)
        l.append({"id":i.id,"quantity": i.quantity,"tamount": str(tamount), "Product": i.PRODUCT.name,'image':i.PRODUCT.image})

    return JsonResponse({"status": "ok", "data": l})
# ---------------------

def userviewprofile(request):
    lid=request.POST['lid']
    res=user_table.objects.get(LOGIN__id=lid)
    return JsonResponse({"status":"ok","uname":res.LOGIN.username,"name":res.name,"place":res.place,
                         "pin":res.pin,"post":res.post,"district":res.place,"phone":res.phone,
                         "email":res.email,"age":res.photo,"photo":res.photo})



def user_view_complaints(request):
    lid=request.POST["lid"]
    res = complaint_table.objects.filter(LOGIN_id=lid)
    l = []
    for i in res:
        l.append({"id": i.id,"complaint": i.complaint, "date": i.date, "reply": i.reply })
    print(l)
    return JsonResponse({"status": "ok", "data": l})


def farmer_makepayment(request):
    lid=request.POST['lid']
    from django.db.models import Count

    distinct_farmers = farmer_table.objects.filter(
        product_table__cart__USER__LOGIN_id=lid
    ).annotate(
        num_products=Count('product_table', distinct=True)
    ).filter(
        num_products__gt=0
    )
    for i in distinct_farmers:
        print(i.id,"dddd")
        mytotal = 0
        farmer_id=i.id
        res2 = Cart.objects.filter(USER__LOGIN_id=lid,PRODUCT__FARMER_id=farmer_id)

        boj = order_table()
        boj.USER = user_table.objects.get(LOGIN_id=lid)
        boj.amount = 1
        import datetime
        boj.date = datetime.datetime.now().date().today()
        boj.FARMER = farmer_table.objects.get(id=farmer_id)
        boj.save()



        for j in res2:
            bs=orderdetails_table()
            bs.ORDER_id=boj.id
            bs.PRODUCT_id=j.PRODUCT.id
            bs.quantity=j.quantity
          
            bs.amount=(float(j.quantity)*float(j.PRODUCT.price))
            bs.save()

            mytotal+=(float(j.PRODUCT.price)*int(j.quantity))

        print(mytotal)


        boj=order_table.objects.get(id=boj.id)
        boj.amount=mytotal
        boj.save()

        Cart.objects.filter(USER__LOGIN_id=lid).delete()
            #
            # for i in
    return JsonResponse({'k':'0','status':"ok"})

def send_complaint(request):
    lid=request.POST['lid']
    complaint=request.POST['complaint']
    import  datetime
    c=complaint_table()
    c.date=datetime.datetime.now().date()
    c.complaint=complaint
    c.LOGIN_id=lid
    c.reply="pending"
    c.save()

    return JsonResponse({"status":"ok"})



def farmer_update_delivery(request):
    if request.method == 'POST':
        oid = request.POST.get('oid')
        try:
            order = order_table.objects.get(id=oid)
            if order.status != "Delivered":
                order.status = "Delivered"
                order.save()
                return JsonResponse({"status": "ok"})
            else:
                return JsonResponse({"status": "error", "message": "Order already delivered"})
        except Order.DoesNotExist:
            return JsonResponse({"status": "error", "message": "Order not found"})
        except Exception as e:
            return JsonResponse({"status": "error", "message": str(e)})
    return JsonResponse({"status": "error", "message": "Invalid request method"})

def farmervieworder(request):
    lid=request.POST["lid"]
    res = order_table.objects.filter(FARMER__LOGIN_id=lid)
    l = []
    for i in res:
        l.append({"id":i.id,"date": i.date, "amount": i.amount,"phone":i.USER.phone,"name":i.USER.name,"status":i.status})
    return JsonResponse({"status": "ok", "data": l})


def farmerviewordersub(request):
    oid=request.POST["oid"]
    res = orderdetails_table.objects.filter(ORDER_id=oid)
    l = []
    for i in res:
        l.append({"id":i.id,"quantity": i.quantity, "name": i.PRODUCT.name, "price": i.PRODUCT.price,'image':i.PRODUCT.image})
    print(l)
    return JsonResponse({"status": "ok", "data": l})

def uservieworder(request):
    lid=request.POST["lid"]
    res = order_table.objects.filter(USER__LOGIN_id=lid)
    l = []
    for i in res:
        l.append({"id":i.id,"date": i.date, "amount": i.amount,"phone":i.FARMER.phone,"name":i.FARMER.name,"status":i.status})
    return JsonResponse({"status": "ok", "data": l})


def userviewordersub(request):
    oid=request.POST["oid"]
    res = orderdetails_table.objects.filter(ORDER_id=oid)
    l = []
    for i in res:
        l.append({"id":i.id,"quantity": i.quantity, "name": i.PRODUCT.name,"description":i.PRODUCT.description, "price": i.PRODUCT.price,'image':i.PRODUCT.image})
    print(l)
    return JsonResponse({"status": "ok", "data": l})
