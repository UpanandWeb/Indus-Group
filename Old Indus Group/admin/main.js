$(function() {
	// GOOGLE TRACKING JS BEGIN
	// Add the domains you would like to have cross domain tracking (Example for more than 1 domain: 'synxis.com,example.com'
	DOMAIN_TRACKING = 'synxis.com'
		   
	if ( DOMAIN_TRACKING ) {
		var trackDomains = DOMAIN_TRACKING.split(',');
		for (var i=trackDomains.length-1;i>=0;i--) {
			$('a[href*="'+trackDomains[i]+'"], form[action*="'+trackDomains[i]+'"]').addClass('track-crossdomain');
		}
	}

	// Tracking phone links / set phone as the name
	$('a[href^="tel:"]').each(function(){
		$(this).attr('name',$(this).attr('href')).addClass('track');
	});

	// Tracking email links / set email as the name
	$('a[href^="mailto:"]').each(function(){
		$(this).attr('name',$(this).attr('href')).addClass('track');
	});
	
	$('.track, .track-crossdomain').each(function() {
		var tag = '';
		if ( this.name ) {
			tag = '/'+this.name.replace(/:/g,'/');
		}
		if($(this).is('form')) {
			var a = $(this).attr('action');
			$(this).submit(function() {
				pageTracker._trackEvent('form', 'submit', tag);
				if ( $(this).hasClass('track-crossdomain') ) {
					$(this).attr({action:a+'?'+$(this).serialize(), method:'post'});
					pageTracker._linkByPost(this);
				}
			});
		} else {
			$(this).click(function(e) {
				if (tag) { pageTracker._trackEvent('link','click', tag); }
				if ( $(this).hasClass('track-crossdomain') ) {
					e.preventDefault();
					var l = pageTracker._getLinkerUrl(this.href);
					$(this).attr('target')=='_blank'?window.open(l,''):window.location=l;
				}
			});
		}
	});
	// END OF GOOGLE TRACKING JS
	
	// Navigation JS
	$('.open-sec-nav').each(function(){
		var navItem = $(this);
		var secNav = this.id;
		$('#nav_sub .nav').addClass('hide');
		navItem.click(function(e){		
			e.preventDefault();
			//$('#nav_main').hide();
			$('#nav_main').addClass('hide');
			//$('#nav_sub .nav').hide();
			$('#nav_sub .nav').addClass('hide');
			//$('#sub_'+secNav).show();
			$('#sub_'+secNav).removeClass('hide');
		});
	});
	$('.back-main-menu').each(function(){
		$(this).click(function(e){
			e.preventDefault();
			//$('#nav_sub .nav').hide();
			$('#nav_sub .nav').addClass('hide');
			//$('#nav_main').show();
			$('#nav_main').removeClass('hide');
		});
	});
	
	// Form Validation
	$('form').formValidate();
	
	// Special Offers
	$('.package').each(function(){
		var p = $(this);
		$('.package-long').hide();
		$('.read-more a',p).toggle(function(){
			$(this).text('Hide Details');
			$('.package-long',p).slideDown();
		}, function(){
			$(this).text('View Details');
			$('.package-long',p).slideUp();
		});
	});
	
	//Homepage push marketing (jcycle)
	$('#push').each(function(){
 		var contents = $('#push').html();
		homePushInit(contents);
		$(window).resize(function () {
			homePushInit(contents);
		});
	});

	function homePushInit(contents){
		//Reset arrows
		$('#next').removeClass('disabled');
		$('#prev').addClass('disabled');
		
		//Reset push with original html
		$('#push').html('').html(contents).cycle({ 
			fx:     'scrollHorz', 
			speed:  500, 
			timeout: 0, 
			next:   '#next', 
			prev:   '#prev' ,
			nowrap: 1,
			prevNextClick: function (isNext, zeroBasedSlideIndex, slideElement) {
				numItems = document.getElementById('push').getElementsByTagName('article').length-1;
				document.getElementById('prev').className = (zeroBasedSlideIndex==0 ? 'cycle-prev disabled' : 'cycle-prev');
				document.getElementById('next').className = (zeroBasedSlideIndex==numItems ? 'cycle-next disabled' : 'cycle-next');
			}
		});			
	}
	

});

(function($) {	
	$.fn.formValidate = function(options) {
		var defaults = {
			errorStart: 'A valid ',
			errorEnd: ' is required.'
		},
		opts = $.extend(defaults, options);
		return this.each(function() {
			var form = $(this);
			$('.submit', form).click(function() {
				var _errors = '';
				//Removes validation errors from previous submit
				$('.form-error', form).removeClass('form-error');
				
				$('.required', form).each(function() {
					var valid = true;
					
					if($(this).is(':input')) {
						var o = $.trim($(this).val());
						
						if($(this).hasClass('email')) {
							// if it's an email address make sure the email is valid using both regular expressions
							valid = /^[a-z0-9_+.-]+\@(?:[a-z0-9-]+\.)+[a-z0-9]{2,4}$/i.test(o);
							if($(this).hasClass('confirm-email')&&valid) {
								var prev = $.trim($(this).parents('.field').prev().children('.email').val());
								if(o!=prev)
									valid=!valid;
							}
						} else if (o.replace(/(?:^\s+)|(?:\s+$)/g,'').length < 1) {
							// if not an email address take out funky characters and see if its still blank
							valid = !valid;
						}
					} else if($(this).is('ul')) {
						valid = false;
						
						$(':radio, :checkbox', this).each(function() {
							if($(this).is(':checked'))
								valid = true;
						});
					}
					
					if(!valid) {
						$(this).addClass('form-error');
						if(_errors == '')
							_errors = $(this).attr("id");
					}
				});
				if(_errors.length) {
					var lbl = $('#'+_errors).attr('placeholder');
					alert(lbl + opts.errorEnd);
					if ($('#'+_errors).is('ul'))
						$('#'+_errors, form).find('label:eq(0)').focus();
					else
						$('#'+_errors, form).focus();
					return false;			
				}
			});
		});
	};

	
})(jQuery);
