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
from django.contrib import messages
from django.shortcuts import redirect
from accounting.forms import *
from accounting.functions import *


def index(request):
	""" 
	Admin dashboard
	"""
	template = loader.get_template('base.html')
	context = RequestContext(request, {'num_accounts': get_num_accounts(), 'num_users': get_num_users()})
	return HttpResponse(template.render(context))
	
	
def create_account(request):
	"""
	Create an account
	"""
	if request.method == 'POST':
		form = Account(request.POST)
		if form.is_valid():
			name 			= form.cleaned_data['name']
			description 	= form.cleaned_data['description']
			organization 	= form.cleaned_data['organization']
			cluster 		= form.cleaned_data['cluster']
			parent 			= form.cleaned_data['parent']
			qos				= form.cleaned_data['qos']
			# Everything is OK, let's add the account
			add_acount(name, description, organization, cluster, parent, qos)
			messages.add_message(request, messages.SUCCESS, 'Cuenta agregada con exito!')
			form = Account()
	else:
		form = Account()
	template = loader.get_template('forms/add.html')
	context = RequestContext(request, {'form': form, 'id' : 'cuenta', 'small': 0})
	return HttpResponse(template.render(context))
	

def view_account(request):
	"""
	View all accounts
	"""
	template = loader.get_template('view/accounts.html')
	context = RequestContext(request, {'id' : 'cuentas', 'accounts': get_accounts()})
	return HttpResponse(template.render(context))
	
	
def edit_account(request, account_name):
	"""
		Modify an account
	"""
	if request.method == 'POST':
		form = Account(request.POST)
		if form.is_valid():
			#name 			= form.cleaned_data['name']
			description 	= form.cleaned_data['description']
			organization 	= form.cleaned_data['organization']
			cluster 		= form.cleaned_data['cluster']
			parent 			= form.cleaned_data['parent']
			qos				= form.cleaned_data['qos']
			
			# Everything is OK, let's modify the account
			edit_acount(account_name, description, organization, parent, qos)
			messages.add_message(request, messages.SUCCESS, 'Cuenta modificada con exito!')
			return redirect('accounting.views.view_account')
	else:
		# Populate the form object with the account information
		account = get_accounts(name=account_name)
		account_dict = {}
		for name, desc, org, cluster, parent, qos in account:
			account_dict = {'name': name, 'description': desc, 'organization': org, 'cluster': cluster, 'parent': parent, 'qos': qos}
		form = Account(account_dict)
	
	template = loader.get_template('forms/edit.html')
	context = RequestContext(request, {'form': form, 'id' : 'cuenta', 'small': 0})
	return HttpResponse(template.render(context))
	
	
def delete_account(request, account_name):
	"""
		Ask if the user really wants to delete an account
	"""
	# Get account data
	account = get_accounts(name=account_name)
	template = loader.get_template('forms/delete.html')
	context = RequestContext(request, {'id' : 'cuentas', 'name': account[0][0]})
	return HttpResponse(template.render(context))


def delete_confirm_account(request, account_name):
	"""
		Delete an account
	"""
	# Get account data and delete
	account = get_accounts(name=account_name)
	for name, desc, org, cluster, parent in account:
		delete_account(name, cluster)
		messages.add_message(request, messages.SUCCESS, 'Cuenta eliminada con exito!')
		return redirect('accounting.views.view_account')


def create_qos(request):
	"""
	Create a QOS
	"""
	if request.method == 'POST':
		form = QOS(request.POST)
		if form.is_valid():
			name 			= form.cleaned_data['name']
			description 	= form.cleaned_data['description']
			flags 			= form.cleaned_data['flags']
			grpcpurunmins 	= form.cleaned_data['grpcpurunmins']
			grpcpus 		= form.cleaned_data['grpcpus']
			grpcpumins		= form.cleaned_data['grpcpumins']
			grpjobs			= form.cleaned_data['grpjobs']
			grpnodes		= form.cleaned_data['grpnodes']
			grpmemory		= form.cleaned_data['grpmemory']
			grpsubmitjobs	= form.cleaned_data['grpsubmitjobs']
			grpwall			= form.cleaned_data['grpwall']
			preempt			= form.cleaned_data['preempt']
			preemptmode		= form.cleaned_data['preemptmode']
			gracetime		= form.cleaned_data['gracetime']
			priority		= form.cleaned_data['priority']
			usagefactor		= form.cleaned_data['usagefactor']
			usagethreshold	= form.cleaned_data['usagethreshold']
			maxcpumins		= form.cleaned_data['maxcpumins']
			maxcpus			= form.cleaned_data['maxcpus']
			maxcpusperuser	= form.cleaned_data['maxcpusperuser']
			maxjobs			= form.cleaned_data['maxjobs']
			maxnodes		= form.cleaned_data['maxnodes']
			maxnodesperuser	= form.cleaned_data['maxnodesperuser']
			maxsubmitjobs	= form.cleaned_data['maxsubmitjobs']
			maxwall			= form.cleaned_data['maxwall']
			# Everything is OK, let's add the account
			add_qos(name, description, flags, grpcpurunmins, grpcpus, grpcpumins, grpjobs, grpnodes, grpmemory, grpsubmitjobs,
					grpwall, preempt, preemptmode, gracetime, priority, usagefactor, usagethreshold, maxcpumins, maxcpus, 
					maxcpusperuser, maxjobs, maxnodes, maxnodesperuser, maxsubmitjobs, maxwall)
			messages.add_message(request, messages.SUCCESS, 'QOS agregada con exito!')
			form = QOS()
	else:
		form = QOS()
	template = loader.get_template('forms/add.html')
	context = RequestContext(request, {'form': form, 'id' : 'QOS', 'small': 0})
	return HttpResponse(template.render(context))


def view_qos(request):
	"""
	View all QOS
	"""
	template = loader.get_template('view/qos.html')
	context = RequestContext(request, {'id' : 'QOS', 'qos': get_qos()})
	return HttpResponse(template.render(context))


def edit_qos(request, qos_name):
	"""
		Modify a QOS
	"""
	if request.method == 'POST':
		form = QOS(request.POST)
		if form.is_valid():
			#name 			= form.cleaned_data['name']
			description 	= form.cleaned_data['description']
			flags 			= form.cleaned_data['flags']
			grpcpurunmins 	= form.cleaned_data['grpcpurunmins']
			grpcpus 		= form.cleaned_data['grpcpus']
			grpcpumins		= form.cleaned_data['grpcpumins']
			grpjobs			= form.cleaned_data['grpjobs']
			grpnodes		= form.cleaned_data['grpnodes']
			grpmemory		= form.cleaned_data['grpmemory']
			grpsubmitjobs	= form.cleaned_data['grpsubmitjobs']
			grpwall			= form.cleaned_data['grpwall']
			preempt			= form.cleaned_data['preempt']
			preemptmode		= form.cleaned_data['preemptmode']
			gracetime		= form.cleaned_data['gracetime']
			priority		= form.cleaned_data['priority']
			usagefactor		= form.cleaned_data['usagefactor']
			usagethreshold	= form.cleaned_data['usagethreshold']
			maxcpumins		= form.cleaned_data['maxcpumins']
			maxcpus			= form.cleaned_data['maxcpus']
			maxcpusperuser	= form.cleaned_data['maxcpusperuser']
			maxjobs			= form.cleaned_data['maxjobs']
			maxnodes		= form.cleaned_data['maxnodes']
			maxnodesperuser	= form.cleaned_data['maxnodesperuser']
			maxsubmitjobs	= form.cleaned_data['maxsubmitjobs']
			maxwall			= form.cleaned_data['maxwall']
			
			# Everything is OK, let's modify the QOS
			edit_qos(qos_name, description, flags, grpcpurunmins, grpcpus, grpcpumins, grpjobs, grpnodes, grpmemory, grpsubmitjobs,
					grpwall, preempt, preemptmode, gracetime, priority, usagefactor, usagethreshold, maxcpumins, maxcpus, 
					maxcpusperuser, maxjobs, maxnodes, maxnodesperuser, maxsubmitjobs, maxwall)
			messages.add_message(request, messages.SUCCESS, 'QOS modificada con exito!')
			return redirect('accounting.views.view_qos')
	else:
		# Populate the form object with the account information
		qos = get_qos(name=qos_name)
		qos_dict = {}
	
		for name, description, flags, grpcpurunmins, grpcpus, grpcpumins, grpjobs, grpnodes, grpmemory, grpsubmitjobs,\
		grpwall, preempt, preemptmode, gracetime, priority, usagefactor, usagethreshold, maxcpumins, maxcpus,\
		maxcpusperuser, maxjobs, maxnodes, maxnodesperuser, maxsubmitjobs, maxwall in qos:
			qos_dict = {'name': name, 'description': description, 'flags': flags.split(','), 'grpcpurunmins': grpcpurunmins,
						'grpcpus': grpcpus, 'grpcpumins': grpcpumins, 'grpjobs': grpjobs, 'grpnodes': grpnodes, 'grpmemory': grpmemory,
						'grpsubmitjobs': grpsubmitjobs, 'grpwall': grpwall, 'preempt': preempt.split(','), 
						'preemptmode': preemptmode.split(','), 'gracetime': gracetime, 'priority': priority, 'usagefactor': usagefactor,
						'usagethreshold': usagethreshold, 'maxcpumins': maxcpumins, 'maxcpus': maxcpus, 'maxcpusperuser': maxcpusperuser,
						'maxjobs': maxjobs, 'maxnodes': maxnodes, 'maxnodesperuser': maxnodesperuser, 'maxsubmitjobs': maxsubmitjobs,
						'maxwall': maxwall}
		form = QOS(qos_dict)
	
	template = loader.get_template('forms/edit.html')
	context = RequestContext(request, {'form': form, 'id' : 'QOS', 'small': 0})
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
