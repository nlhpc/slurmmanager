from django.conf.urls import patterns, url

from accounting import views

urlpatterns = patterns('',
	url(r'^qos', views.index, name='index'),
	url(r'^cluster', views.create_cluster, name='cluster'),
	url(r'^partition', views.create_partition, name='partition'),
	url(r'^limit', views.create_limit, name='limit'),
	url(r'^account', views.create_account, name='account'),
)
