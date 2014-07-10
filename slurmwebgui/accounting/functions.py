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

"""SLURM class that interacts with sacctmgr:

Here we define functions for getting the list of clusters, accounts, users from sacctmgr
The main idea is to execute the proper command with Paramiko SSH library and proccess the output
to have a nice and ready-to-use object

"""
import paramiko
import re


def exec_command( command ):
	""" Initialize SSH connection with the SLURM master node.
		TODO: find a way of having a persistent connection
	"""
	try:
		ssh = paramiko.SSHClient()
		ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
		ssh.load_system_host_keys()
		ssh.connect('localhost', port=3022, username='clv', password='123456')
	except paramiko.AuthenticationException:
		return HttpResponse("wrong password")

	stdin, stdout, stderr = ssh.exec_command(command)
	output = stdout.read()
	ssh.close()
	return output


def get_accounts():
	""" Get list of all accounts in the cluster
		sacctmgr -n -p show accounts
		-n (--noheader) is for not showing headers in the ouput
		-p (--parsable) is for getting the output parsed with '|' 
	"""
	output = exec_command('sacctmgr -n -p show accounts')
	
	# We need to split the output into lines. Each account line has the following fields:
	# Account | Description | Organization
	lines = re.split('\\\n+', output);
	accounts = []
	for line in lines:
		fields = re.split('\\|+', line)
		if fields[0] != "":
			# We make a tuple of the form (Account, Description)
			accounts.append((fields[0], fields[1]))
	return accounts


def get_users():
	""" Get list of all users in the cluster
		sacctmgr -n -p show users
		-n (--noheader) is for not showing headers in the ouput
		-p (--parsable) is for getting the output parsed with '|' 
	"""
	output = exec_command('sacctmgr -n -p show users')
	
	# We need to split the output into lines. Each account line has the following fields:
	# User | Default account | Admin
	lines = re.split('\\\n+', output);
	users = []
	for line in lines:
		fields = re.split('\\|+', line)
		if fields[0] != "":
			# We make a tuple of the form (Account, Description)
			users.append((fields[0], fields[1]))
	return users


def get_clusters():
	""" Get list of all clusters
		sacctmgr -n -p show clusters
		-n (--noheader) is for not showing headers in the ouput
		-p (--parsable) is for getting the output parsed with '|' 
	"""
	output = exec_command('sacctmgr -n -p show clusters')
	
	# We need to split the output into lines. Each cluster line has the following fields:
	#  Cluster | ControlHost | ControlPort | RPC | Share | GrpJobs | GrpNodes | GrpSubmit | MaxJobs | MaxNodes | MaxSubmit | MaxWall | QOS | Def QOS 
	lines = re.split('\\\n+', output);
	clusters = []
	
	for line in lines:
		fields = re.split('\\|+', line)
		if fields[0] != "":
			# We make a tuple of the form (Cluster, Cluster)
			clusters.append((fields[0], fields[0]))
	return clusters


def get_num_accounts():
	""" Get the number of accounts in the cluster
		Just call get_accounts and count the number of elements in the list
	"""
	return len(get_accounts())


def get_num_users():
	""" Get the number of users in the cluster
		Just call get_users and count the number of elements in the list
	"""
	return len(get_users())
