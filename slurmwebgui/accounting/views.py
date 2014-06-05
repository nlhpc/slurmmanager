from django.shortcuts import render
from django.http import HttpResponse
from django.template import RequestContext, loader
from accounting.forms import *

# Form for adding a QoS
def index(request):
	template = loader.get_template('forms/create.html')
	form = QOS()
	id = "QoS"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))

""" Form for adding a Cluster. it's assume that the cluster is defined in the configuration
file"""
def create_cluster(request):
	template = loader.get_template ('forms/create.html')
	form = Cluster()
	id = "Cluster"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))

def create_partition(request):
	template = loader.get_template ('forms/create.html')
	form = Partition()
	id = "Partition"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))

def create_limit(request):
	template = loader.get_template ('forms/create.html')
	form = Limits()
	id = "Limit"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))

def create_account(request):
	template = loader.get_template ('forms/create.html')
	form = Account()
	id = "Account"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))