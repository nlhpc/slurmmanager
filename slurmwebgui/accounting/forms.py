from django import forms
from functions import get_accounts_choices, get_clusters_choices
	
class Cluster(forms.Form):
	name = forms.CharField(label="Nombre del cluster", max_length=30)
	
class Account(forms.Form):
	name = forms.CharField(
					label="Nombre de la cuenta",
					help_text="No debe superar los 30 caracteres",
					max_length=30,
					widget=forms.TextInput(attrs={'class':'form-control'})
					)
	description = forms.CharField(
					label="Descripcion",
					help_text="No debe superar los 200 caracteres",
					max_length=200,
					widget=forms.TextInput(attrs={'class':'form-control'}))
	organization = forms.CharField(
					label="Organizacion a la que pertenece",
					help_text="No debe superar los 30 caracteres",
					max_length=30,
					widget=forms.TextInput(attrs={'class':'form-control'}))
	cluster = forms.ChoiceField(
					label="Cluster",
					help_text="Cluster al que pertenecera esta cuenta",
					choices=get_clusters_choices(),
					widget=forms.Select(attrs={'class':'multiselect'}))
	parent = forms.ChoiceField(
					label="Cuenta padre",
					help_text="Cuenta padre a la que pertenece y heredara limites y QoS",
					choices=get_accounts_choices(),
					widget=forms.Select(attrs={'class':'multiselect'}))

class Limits(forms.Form):
	name = forms.CharField(label="Limit name", max_length=30)
	fairshare = forms.IntegerField(label="Fairshare value")
	grpcpumins = forms.IntegerField(label="Maximum CPU minutes limits")
	grpcpurunmins = forms.IntegerField(label="Maximum Combined CPU minutes limits")
	grpucpus = forms.IntegerField(label="Maximum CPU count")
	grpjobs = forms.IntegerField(label="Maximum jobs able to run")
	grpmemory = forms.IntegerField(label="Maximum total memory")
	grpnodes = forms.IntegerField(label="Maximum number of nodes")
	grpsubmitjobs = forms.IntegerField(label="Maximum Group submited jobs")
	grpwall = forms.IntegerField(label="Maximum group wall time")
	maxcpuminsperjob = forms.IntegerField(label="Maximum CPU minutes per job")
	maxcpusperjob = forms.IntegerField(label="Maximum CPU's per job")
	maxjobs = forms.IntegerField(label="Maximum running jobs")
	maxnodesperjob = forms.IntegerField(label="Maximum nodes per job")
	maxsubmitjobs = forms.IntegerField(label="Maximum submit jobs")
	maxwalldurationperjob = forms.IntegerField(label="Maximum wall duration per job")
	qos = forms.CharField(label="QOS's able to run", max_length=200)

class QOS(forms.Form):
	name = forms.CharField(label="QoS name", max_length=30)
	description = forms.CharField(label="QoS description", max_length=200)
	grpcpus = forms.IntegerField(label="Total CPU count able to use for job")
	grpcpumins = forms.IntegerField(label="Maximum CPU minutes per job")
	grpcpurunmins = forms.IntegerField(label="Total minutes CPU running")
	grpjobs = forms.IntegerField(label="Maximum number of jobs running")
	grpmemory = forms.IntegerField(label="Maximum group memory usage")
	grpnodes = forms.IntegerField(label="Maximum total nodes running jobs")
	grpsubmitjobs = forms.IntegerField(label="Maximum total submited jobs")
	grpwall = forms.IntegerField(label="Total minutes CPU running")
	maxcpusperjob = forms.IntegerField(label="Maximum CPU's per job")
	maxnodesperjob = forms.IntegerField(label="Maximum total nodes per job")
	maxwalldurationperjob = forms.IntegerField(label="Maximum time for running job")
	maxcpusperuser = forms.IntegerField(label="Maximum number of running jobs for user")
	maxjobsperuser = forms.IntegerField(label="Maximum number of jobs per user")
	maxnodesperuser = forms.IntegerField(label="Maximum number of nodes per user")
	maxsubmitjobsperuser = forms.IntegerField(label="Maximum jobs submited per user")
	
#class Partition(forms.Form):
	#name = forms.CharField(label="Partition name", max_length=30)
	#description = forms.CharField(label="Partition description", max_length=200)
