from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from accounting.forms import *


#Generic forms for qos, cluster, partition, limit and account creation

def index(request):
	if request.method == 'POST':
		form = QOS(request.POST)
		if form.is_valid():
			return HttpResponseRedirect('Wena')
	else:
		form = QOS()
		
	template = loader.get_template('forms/create.html')
	id = "QoS"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))


def create_cluster(request):
	if request.method == 'POST':
		form = Cluster(request.POST)
		if form.is_valid():
			return HttpResponseRedirect('Wena')
	else:
		form = Cluster()
		
	template = loader.get_template ('forms/create.html')
	form = Cluster()
	id = "Cluster"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))

def create_partition(request):
	if request.method == 'POST':
		form = Partition(request.POST)
		if form.is_valid():
			return HttpResponse('Wena')
	else:
		form = Partition()
		
	template = loader.get_template ('forms/create.html')
	form = Partition()
	id = "Partition"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))

def create_limit(request):
	if request.method == 'POST':
		form = Limits(request.POST)
		if form.is_valid():
			return HttpResponse('Wena')
	else:
		form = Limits()
		
	template = loader.get_template ('forms/create.html')
	form = Limits()
	id = "Limit"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))

def create_account(request):
	if request.method == 'POST':
		form = Account(request.POST)
		if form.is_valid():
			return HttpResponse('Wena')
	else:
		form = Account()
		
	template = loader.get_template ('forms/create.html')
	form = Account()
	id = "Account"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))