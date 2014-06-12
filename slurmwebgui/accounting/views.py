from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from accounting.forms import *
import os
import paramiko

#Generic forms for qos, cluster, partition, limit and account creation

def index(request):
	template = loader.get_template('base.html')
	context = RequestContext(request, {})
	return HttpResponse(template.render(context))

def create_qos(request):
	if request.method == 'POST':
		form = QOS(request.POST)
		if form.is_valid():
			return HttpResponse('Wena')
	else:
		form = QOS()
		
	template = loader.get_template('forms.html')
	id = "QoS"
	context = RequestContext(request, {'form': form, 'id' : id})
	return HttpResponse(template.render(context))

	
def create_cluster(request):
	if request.method == 'POST':
		form = Cluster(request.POST)
		if form.is_valid():
			name = form.cleaned_data['name']
			command = "sacctmgr add cluster " + name 
			return HttpResponse(command)
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
		
	template = loader.get_template ('forms.html')
	form = Partition()
	id = "Partition"
	context = RequestContext(request, {'form': form, 'id' : id, small: 1})
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
		
	template = loader.get_template ('forms.html')
	form = Account()
	id = "Account"
	context = RequestContext(request, {'form': form, 'id' : id, small: 1})
	return HttpResponse(template.render(context))

def commands(request):
	#os.system("./testing.sh");
	try:
		ssh = paramiko.SSHClient()
		ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
		ssh.load_system_host_keys()
		ssh.connect('localhost', username='testing', password='123456')
	except paramiko.AuthenticationException:
		return HttpResponse("wrong password")
	
	stdin, stdout, stderr = ssh.exec_command('cd /var/tmp/;sudo ./sacctmgr.sh')
	output = stderr.read() + stdout.read()
	ssh.close()
	return HttpResponse(output)
