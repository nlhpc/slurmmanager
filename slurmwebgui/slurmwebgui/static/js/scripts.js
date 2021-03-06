/* jQuery toggle layout */
$(document).ready(function() {
	
	$('#btnToggle').click(function(){
		if ($(this).hasClass('on')) {
			$('#main .col-md-6').addClass('col-md-4').removeClass('col-md-6');
			$(this).removeClass('on');
		}
		else {
			$('#main .col-md-4').addClass('col-md-6').removeClass('col-md-4');
			$(this).addClass('on');
		}
	});

	$('.help').popover({ trigger: 'hover', placement: 'top' });
	
	$('.multiselect').multiselect({
		enableFiltering: true,
		enableCaseInsensitiveFiltering: true,
		numberDisplayed: 1,
		maxHeight: 200
	});
	
	$('.multiselect-small').multiselect({
		numberDisplayed: 1
	});
	
	$('.multiselect-selectall').multiselect({
		enableFiltering: true,
		enableCaseInsensitiveFiltering: true,
		numberDisplayed: 1,
		maxHeight: 200,
		includeSelectAllOption: true
	});

});
