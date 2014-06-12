from django import forms

class Partition(forms.Form):
	name = forms.CharField(label="Partition name", max_length=30, widget=forms.TextInput(attrs={'class':'form-control'}))
	description = forms.CharField(label="Partition description", max_length=200, widget=forms.TextInput(attrs={'class':'form-control'}))
	
class Cluster(forms.Form):
	name = forms.CharField(label="Cluster name", max_length=30)
	description = forms.CharField(label="Cluster description", max_length=200)

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
	
class Account(forms.Form):
	name = forms.CharField(label="Account name", max_length=30, widget=forms.TextInput(attrs={'class':'form-control'}))
	description = forms.CharField(label="Account description", max_length=200, widget=forms.TextInput(attrs={'class':'form-control'}))
	organization = forms.CharField(label="Organization", max_length=30, widget=forms.TextInput(attrs={'class':'form-control'}))

class QOS(forms.Form):
	name = forms.CharField(label="QoS name", max_length=30, widget=forms.TextInput(attrs={'class':'form-control'}))
	description = forms.CharField(label="QoS description", max_length=200,widget=forms.TextInput(attrs={'class':'form-control'}))
	grpcpus = forms.IntegerField(label="Total CPU count able to use for job", help_text="Ayuda nombre",widget=forms.TextInput(attrs={'class':'form-control'}))
	grpcpumins = forms.IntegerField(label="Maximum CPU minutes per job", help_text="The total number of cpu minutes that can possibly be used by past, present and future jobs running from this association",widget=forms.TextInput(attrs={'class':'form-control'}))
	grpcpurunmins = forms.IntegerField(label="Total minutes CPU running",widget=forms.TextInput(attrs={'class':'form-control'}))
	grpjobs = forms.IntegerField(label="Maximum number of jobs running",widget=forms.TextInput(attrs={'class':'form-control'}))
	grpmemory = forms.IntegerField(label="Maximum group memory usage",widget=forms.TextInput(attrs={'class':'form-control'}))
	grpnodes = forms.IntegerField(label="Maximum total nodes running jobs",widget=forms.TextInput(attrs={'class':'form-control'}))
	grpsubmitjobs = forms.IntegerField(label="Maximum total submited jobs",widget=forms.TextInput(attrs={'class':'form-control'}))
	grpwall = forms.IntegerField(label="Total minutes CPU running",widget=forms.TextInput(attrs={'class':'form-control'}))
	maxcpusperjob = forms.IntegerField(label="Maximum CPU's per job",widget=forms.TextInput(attrs={'class':'form-control'}))
	maxnodesperjob = forms.IntegerField(label="Maximum total nodes per job",widget=forms.TextInput(attrs={'class':'form-control'}))
	maxwalldurationperjob = forms.IntegerField(label="Maximum time for running job",widget=forms.TextInput(attrs={'class':'form-control'}))
	maxcpusperuser = forms.IntegerField(label="Maximum number of running jobs for user",widget=forms.TextInput(attrs={'class':'form-control'}))
	maxjobsperuser = forms.IntegerField(label="Maximum number of jobs per user",widget=forms.TextInput(attrs={'class':'form-control'}))
	maxnodesperuser = forms.IntegerField(label="Maximum number of nodes per user",widget=forms.TextInput(attrs={'class':'form-control'}))
	maxsubmitjobsperuser = forms.IntegerField(label="Maximum jobs submited per user",widget=forms.TextInput(attrs={'class':'form-control'}))
