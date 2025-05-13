from django.urls import path

from Myapp import views
urlpatterns = [
    path('',views.login,name="login"),
    path('login_post',views.login_post,name="login_post"),
    path('add_fertilizer',views.add_fertilizer,name="add_fertilizer"),
    path('add_fertilizer_post',views.add_fertilizer_post,name="add_fertilizer_post"),
    path('admin_home',views.admin_home,name="admin_home"),
    path('feedback',views.feedback,name="feedback"),
    path('managefert',views.managefert,name="manageofficer"),
    path('editfertilizer/<int:id>',views.editfertilizer,name="editfertilizer"),
    path('editfertilizerpost',views.editfertilizerpost,name="editfertilizerpost"),
    path('sendreply/<int:id>', views.sendreply, name="sendreply"),
    path('view_complaint', views.view_complaint, name="view_complaint"),
    path('sendreplypost', views.sendreplypost, name="sendreplypost"),
    path('viewfarmer', views.viewfarmer, name="viewfarmer"),
    path('replysend',views.replysend, name="replysend"),
    path('viewfarmer', views.viewfarmer, name="viewfarmer"),
    path('search_fert', views.search_fert, name="search_officer"),
    path('replysend', views.replysend, name="replysend"),

    path('viewdoubts', views.viewdoubts, name="viewdoubts"),
    path('searchcomplaint', views.searchcomplaint, name="searchcomplaint"),
    path('search_farmer', views.search_farmer, name="search_farmer"),
    path('search_feed', views.search_feed, name="search_feed"),
    path('block/<int:id>', views.block, name="block"),
    path('unblock/<int:id>', views.unblock, name="unblock"),
    path('delete_fertilizer/<int:id>', views.delete_fertilizer, name="delete_fertilizer"),
    path('view_users', views.view_users, name="view_users"),
    path('search_user', views.search_user, name="search_user"),
    path('search_doubt', views.search_doubt, name="search_doubt"),
    path('search_noti', views.search_noti, name="search_noti"),
    path('replysend/<int:id>', views.replysend, name="replysend"),
    path('replysend_post', views.replysend_post, name="replysend_post"),
    path('send_notification', views.send_notification, name="send_notification"),
    path('send_not', views.send_not, name="send_not"),
    path("view_notification",views.view_notification,name="view_notification"),
    path('delete_noti/<int:id>', views.delete_noti, name="delete_noti"),

    path("view_fert_book", views.view_fert_book, name="view_fert_book"),
    path("app_fert/<id>",views.app_fert,name="app_fert"),
    path("rej_fert/<id>",views.rej_fert,name="rej_fert"),
    path("disease",views.disease,name="disease"),
    path("disease_post",views.disease_post,name="disease_post"),
    path("disease_view",views.disease_view,name="disease_view"),
    path("disease_view_post", views.disease_view_post, name="disease_view_post"),
    path("disease_delete/<id>",views.disease_delete,name="disease_delete"),
    path("disease_edit/<id>",views.disease_edit,name="disease_edit"),
    path("disease_edit_post",views.disease_edit_post,name="disease_edit_post"),
    path("remedies/<id>",views.remedies,name="remedies"),
    path("add_remedies",views.add_remedies,name="add_remedies"),
    path("add_remedies_post",views.add_remedies_post,name="add_remedies_post"),

    path("remedy_delete/<id>",views.remedy_delete,name="remedy_delete"),
    path("remedy_edit/<id>",views.remedy_edit,name="remedy_edit"),
    path("remedy_edit_post",views.remedy_edit_post,name="remedy_edit_post"),

#     Android=================================
    path("and_login",views.and_login,name="and_login"),
    path("farmerviewprofile",views.farmerviewprofile),
    path("farmer_editprofile_post",views.farmer_editprofile_post),
    path("farmer_viewnotifications",views.farmerviewnotifications),
    path("farmer_view",views.farmer_view),
    path("farmer_sendrequest",views.farmersendrequest),
    path('farmer_viewrequeststatus', views.farmerviewrequeststatus),
    path('farmeradd_productmanagement', views.farmeraddproductmanagement),
    path('farmer_update_stock', views.farmer_update_stock),
    
    path('farmer_viewproductmanagement', views.farmerviewproductmanagement),
    path("farmer_delete_product",views.farmer_delete_product),
    path('PredictDisease', views.PredictDisease),
    path('farmer_sendfeedback', views.farmersenddoubt),
    path('farmer_viewdoubtreply', views.farmerviewdoubtreply),
    path('farmer_signup_post', views.farmer_signup_post),
    path('farmerviewdis',views.farmerviewdis),
    path('farmerviewrem',views.farmerviewrem),


    path('farmer_viewproductfromotherfarmers', views.farmerviewproductfromotherfarmers),
    path('farmeradd_quantity', views.farmeraddquantity),
    path('farmerview_quantity', views.farmerviewquantity),

    path("userviewprofile",views.userviewprofile),
    path("user_editprofile_post",views.user_editprofile_post),
    
    path("user_view_complaints",views.user_view_complaints),
    path("farmer_makepayment",views.farmer_makepayment),
    path("send_complaint",views.send_complaint),

    path("farmerview_order",views.farmervieworder),
    path("farmer_update_delivery",views.farmer_update_delivery),
    path("farmerview_ordersub",views.farmerviewordersub),

    path("userview_order", views.uservieworder),
    path("userview_ordersub", views.userviewordersub)





    # path("and_user_reg",views.and_user_reg,name="and_user_reg"),
    # path("sendfeedback",views.sendfeedback,name="sendfeedback"),
    # path("send_complaint",views.send_complaint,name="send_complaint"),
    # path("reply",views.reply,name="reply"),
    # path("chatwithfarmer",views.chatwithfarmer,name="chatwithfarmer"),
    # path("order",views.order,name="order"),
    # path("vieworders",views.vieworders,name="vieworders"),
    # path("view_product",views.view_product,name="view_product"),
    # path("view_message2",views.view_message2,name="view_message2"),
    # path("in_message2",views.in_message2,name="in_message2"),
    # path("paymentfinish",views.paymentfinish,name="paymentfinish"),
    #
    #
    #
    # path("add_product",views.add_product,name="add_product"),
    # path("manageproduct",views.manageproduct,name="manageproduct"),
    # path("deleteproduct",views.deleteproduct,name="deleteproduct"),
    # path("editproduct",views.editproduct,name="editproduct"),
    # path("edit_product_code",views.edit_product_code,name="edit_product_code"),
    # path("vieworders_farmer",views.vieworders_farmer,name="vieworders_farmer"),
    #
    # path("view_eqp_orders_farmer",views.view_eqp_orders_farmer,name="view_eqp_orders_farmer"),
    # path("accept_eqp_booking",views.accept_eqp_booking,name="accept_eqp_booking"),
    # path("reject_eqp_booking",views.reject_eqp_booking,name="reject_eqp_booking"),
    # path("send_doubt",views.send_doubt,name="send_doubt"),
    # path("doubtreply",views.doubtreply,name="doubtreply"),
    # path("viewnotification_farmer",views.viewnotification_farmer,name="viewnotification_farmer"),
    # path("officerviewfarmer",views.officerviewfarmer,name="officerviewfarmer"),
    # path("updateproductimage",views.updateproductimage,name="updateproductimage"),
    #
    # path('uploadleaf',views.uploadleaf,name='uploadleaf'),
    # path('userchatwithfarmer',views.userchatwithfarmer,name='userchatwithfarmer'),
    # path('logout',views.logout,name='logout'),
    # path('and_fp',views.and_fp,name='and_fp'),
    # path('userprofileupdate',views.userprofileupdate,name='userprofileupdate'),
    # path('farmerprofileupdate',views.farmerprofileupdate,name='farmerprofileupdate'),
    # path('userviewpofile',views.userviewpofile,name='userviewpofile'),
    # path('farmerviewpofile',views.farmerviewpofile,name='farmerviewpofile'),

]

