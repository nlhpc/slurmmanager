# SLURM Web GUI
# Copyright 2014 Samuel Pizarro <samuel@nlhpc.cl>
# Copyright 2014 Cristobal Leiva <cristobal.leiva@usach.cl>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

"""Accounting views:

Generic forms for qos, cluster, partition, limit and account creation
Some extra documentation here

"""

from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from accounting.forms import *
from accounting.functions import *


def index(request):
	""" Admin dashboard
		
	"""
	template = loader.get_template('base.html')
	context = RequestContext(request, {'num_accounts': get_num_accounts(), 'num_users': get_num_users()})
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
		
	template = loader.get_template ('forms.html')
	id = "Cluster"
	context = RequestContext(request, {'form': form, 'id' : id, 'small': 1})
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
	context = RequestContext(request, {'form': form, 'id' : id, 'small': 1})
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
	id = "Account"
	
	# Process form
	if request.method == 'POST':
		form = Account(request.POST)
		if form.is_valid():
			print form
			name = form.cleaned_data['name']
			description = form.cleaned_data['description']
			organization = form.cleaned_data['organization']
			cluster = form.cleaned_data['cluster']
			parent = form.cleaned_data['parent']
			command = "sacctmgr add ccount " + name + " Cluster=" + cluster
			command += " Description=" + description + " Organization=" + organization
			if parent:
				command += " Parent=" + parent
			return HttpResponse(command)
			
	else:
		form = Account()
		
	template = loader.get_template ('forms.html')
	
	context = RequestContext(request, {'form': form, 'id' : id, 'small': 1})
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
