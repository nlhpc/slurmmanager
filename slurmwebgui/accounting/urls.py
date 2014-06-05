from django.conf.urls import patterns, url

from accounting import views

urlpatterns = patterns('',
	url(r'^QoS', views.index, name='index'),
	url(r'^Cluster', views.create_cluster, name='cluster'),
	url(r'^Partition', views.create_partition, name='partition'),
	url(r'^Limit', views.create_limit, name='limit'),
	url(r'^Account', views.create_account, name='account'),
)
