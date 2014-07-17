from django import forms
from functions import get_accounts_choices, get_clusters_choices, get_qos_choices
	
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
					help_text="Cuenta padre a la que pertenece",
					choices=get_accounts_choices(),
					widget=forms.Select(attrs={'class':'multiselect'}))
	qos = forms.ChoiceField(
					label="QoS",
					help_text="QoS para esta cuenta",
					choices=get_qos_choices(),
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
	name = forms.CharField(
					label="Nombre",
					help_text="No debe superar los 30 caracteres",
					max_length=30,
					widget=forms.TextInput(attrs={'class':'form-control'}))
	description = forms.CharField(
					label="Descripcion",
					help_text="No debe superar los 200 caracteres",
					max_length=200,
					widget=forms.TextInput(attrs={'class':'form-control'}))
	flags = forms.ChoiceField(
					label="Flags",
					help_text="Lista de flags para este QOS",
					choices=get_qos_choices(),
					widget=forms.Select(attrs={'class':'multiselect'}))
	grpcpurunmins = forms.IntegerField(
					label="GrpCPURunMins",
					help_text="Maximo de minutos de CPU que los trabajos corriendo al mismo tiempo pueden utilizar",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	grpcpus = forms.IntegerField(
					label="GrpCPUs",
					help_text="Maximo de CPUs que pueden ser asignados para cada trabajo",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	grpcpumins = forms.IntegerField(
					label="GrpCPUMins",
					help_text="Maximo de minutos de CPU que los trabajos pueden utilizar",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	grpjobs = forms.IntegerField(
					label="GrpJobs",
					help_text="Maximo de trabajos que pueden ejecutarse en este QOS",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	grpnodes = forms.IntegerField(
					label="GrpNodes",
					help_text="Maximo de nodos que pueden ser ocupados por este QOS",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	grpmemory = forms.IntegerField(
					label="GrpMemory",
					help_text="Maximo total de memoria que puede ser ocupado por este QOS",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	grpsubmitjobs = forms.IntegerField(
					label="GrpSubmitJobs", 
					help_text="Maximo de trabajos en este QOS que pueden estar en el sistema (independiente del estado)",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	grpwall = forms.IntegerField(
					label="GrpWall",
					help_text="Wall clock limit para todos los trabajos ejecutandose en este QOS",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	preempt = forms.ChoiceField(
					label="Preempt",
					help_text="Lista de QOS sobre las cuales este QOS tendra preferencia (puede ser mas de una)",
					choices=get_qos_choices(),
					widget=forms.Select(attrs={'class':'multiselect'}))
	preemptmode = forms.ChoiceField(
					label="PreemptMode",
					help_text="Mecanismo usado para adelantarse a otros trabajos de este QOS (PreemptType debe estar configurado a preempt/qos)",
					choices=get_qos_choices(),
					widget=forms.Select(attrs={'class':'multiselect'}))
	gracetime = forms.IntegerField(
					label="GraceTime",
					help_text="Tiempo de gracia para ser extendido a trabajos preferentes (en segundos)",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	priority = forms.IntegerField(
					label="Priority",
					help_text="Prioridad que se agregara a trabajos en este QOS",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	usagefactor = forms.IntegerField(
					label="UsageFactor",
					help_text="Factor para aumentar/disminuir la cuenta de tiempo de este QOS. Por defecto es 1.0 (flotante)",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	usagethreshold = forms.IntegerField(
					label="UsageThreshold",
					help_text="Limite que representa el minimo fairshare que necesita un trabajo para ejecutarse en este QOS (flotante)",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	maxcpusperjob = forms.IntegerField(
					label="Maximum CPU's per job",
					help_text="some desc",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	maxnodesperjob = forms.IntegerField(
					label="Maximum total nodes per job",
					help_text="some desc",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	maxwalldurationperjob = forms.IntegerField(
					label="Maximum time for running job",
					help_text="some desc",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	maxcpusperuser = forms.IntegerField(
					label="Maximum number of running jobs for user",
					help_text="some desc",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	maxjobsperuser = forms.IntegerField(
					label="Maximum number of jobs per user",
					help_text="some desc",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	maxnodesperuser = forms.IntegerField(
					label="Maximum number of nodes per user",
					help_text="some desc",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	maxsubmitjobsperuser = forms.IntegerField(
					label="Maximum jobs submited per user",
					help_text="some desc",
					widget=forms.TextInput(attrs={'class':'form-control'}))
	
#class Partition(forms.Form):
	#name = forms.CharField(label="Partition name", max_length=30)
	#description = forms.CharField(label="Partition description", max_length=200)
