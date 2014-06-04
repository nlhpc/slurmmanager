from django.shortcuts import render
from django.http import HttpResponse
from django.template import RequestContext, loader
from accounting.forms import QOS

# Form for adding a QoS
def index(request):
	template = loader.get_template('forms/qos.html')
	form = QOS()
	context = RequestContext(request, {'form': form,})
	return HttpResponse(template.render(context))
