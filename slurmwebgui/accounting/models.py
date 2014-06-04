from django.db import models

class Partition(models.Model):
	name = models.CharField("Partition name", max_length=30)
	description = models.CharField("Partition description", max_length=200)
	parent = models.ForeignKey('self')
	
class Cluster(models.Model):
	name = models.CharField("Cluster name", max_length=30)
	description = models.CharField("Cluster description", max_length=200)

class Limits(models.Model):
	name = models.CharField("Limit name", max_length=30)
	fairshare = models.IntegerField("Fairshare value")
	grpcpumins = models.PositiveIntegerField("Maximum CPU minutes limits")
	grpcpurunmins = models.PositiveIntegerField("Maximum Combined CPU minutes limits")
	grpucpus = models.SmallIntegerField("Maximum CPU count")
	grpjobs = models.PositiveIntegerField("Maximum jobs able to run")
	grpmemory = models.PositiveIntegerField("Maximum total memory")
	grpnodes = models.PositiveIntegerField("Maximum number of nodes")
	grpsubmitjobs = PositiveIntegerField("Maximum Group submited jobs")
	grpwall = models.IntegerField("Maximum group wall time")
	maxcpuminsperjob = models.PositiveIntegerField("Maximum CPU minutes per job")
	maxcpusperjob = models.SmallIntegerField("Maximum CPU's per job")
	maxjobs = models.PositiveIntegerField("Maximum running jobs")
	maxnodesperjob = models.SmallIntegerField("Maximum nodes per job")
	maxsubmitjobs = models.PositiveIntegerField("Maximum submit jobs")
	maxwalldurationperjob = models.PositiveIntegerField("Maximum wall duration per job")
	qos = models.CharField("QOS's able to run", max_length=200)
	
class Account(models.Model):
	name = models.CharField("Account name", max_length=30)
	description = models.CharField("Account description", max_length=200)
	organization = models.CharField("Organization", max_length=30)
	parent = models.ForeignKey('self')
	cluster = models.ForeignKey('Cluster')
	limits = models.Foreignkey('limits')

class QOS(models.Model):
	name = models.CharField("QoS name", max_length=30)
	description = models.CharField("QoS description", max_length=200)
	grpcpus = models.SmallintegerField("Total CPU count able to use for job")
	grpcpumins = models.PositiveIntegerField("Maximum CPU minutes per job")
	grpcpurunmins = models.SmallIntegerField("Total minutes CPU running")
	grpjobs = models.SmallIntegerfield("Maximum number of jobs running")
	grpmemory = models.PositiveIntegerField("Maximum group memory usage")
	grpnodes = models.SmallIntegerField("Maximum total nodes running jobs")
	grpsubmitjobs = models.PositiveIntegerField("Maximum total submited jobs")
	grpwall = SmallIntegerField("Total minutes CPU running")
	maxcpusperjob = models.SmallIntegerField("Maximum CPU's per job")
	maxnodesperjob = SmallIntegerField("Maximum total nodes per job")
	maxwalldurationperjob = models.PositiveIntegerField("Maximum time for running job")
	maxcpusperuser = models.SmallIntegerField("Maximum number of running jobs for user")
	maxjobsperuser = models.PositiveIntegerField("Maximum number of jobs per user")
	maxnodesperuser = models.PositiveIntegerField("Maximum number of nodes per user")
	maxsubmitjobsperuser = models.PositiveIntegerField("Maximum jobs submited per user")