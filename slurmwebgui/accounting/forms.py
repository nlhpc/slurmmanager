from django import forms

class Partition(forms.Form):
	name = forms.CharField(label="Partition name", max_length=30)
	description = forms.CharField(label="Partition description", max_length=200)
	
class Cluster(forms.Form):
	name = forms.CharField(label="Cluster name", max_length=30)
	#description = forms.CharField(label="Cluster description", max_length=200, required=False)

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
	name = forms.CharField(label="Account name", max_length=30)
	description = forms.CharField(label="Account description", max_length=200)
	organization = forms.CharField(label="Organization", max_length=30)
	cluster = forms.CharField(label="Cluster name", max_length=30)
	parent = forms.CharField(label="Parent", max_length=30)
	

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
