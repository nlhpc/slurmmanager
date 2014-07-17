from django.conf.urls import patterns, url

from accounting import views

urlpatterns = patterns('',
	url(r'^account/add', views.create_account, name='account'),
	url(r'^account/view', views.view_account, name='account'),
	url(r'^account/edit/([a-zA-Z0-9]+)', views.edit_account, name='account'),
	url(r'^account/delete/([a-zA-Z0-9]+)', views.delete_account, name='account'),
	url(r'^account/delete_confirm/([a-zA-Z0-9]+)', views.delete_confirm_account, name='account'),
	url(r'^qos/add', views.create_qos, name='qos'),
	#url(r'^user/add', views.create_user, name='account'),
	#url(r'^Cluster', views.create_cluster, name='cluster'),
	url(r'^', views.index, name='index'),
)
