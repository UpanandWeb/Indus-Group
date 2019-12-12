//browser back button clearing input fields
var window_width = $(window).width();
var window_height = $(window).height();
var resize = false;
$(window).on('popstate', function() {
  //alert();
  $('#yash-event-start-date').val('');
  $('#yash-event-end-date').val('');
});


$(window).load(function() {
  //settingHeightOfFlipper();

  hideLoader();
  // middleContainerHeight();
  //carouselNormalization();
  function hideLoader() {
    setTimeout(function() {
      $('#page-loader-wrapper').hide();
      $('body').css('overflow-y', 'scroll');
    }, 10);

  }

  function settingHeightOfFlipper() {
    //fliping script git pull origin master

    var flipingwrapperHeight = $('.flip-container .front').height();
    // console.log();
    $('.flip-container .back,.fliping-image,.flipper').css({
      'height': flipingwrapperHeight
    });
    $('#sap-fliping').css({
      'min-height': flipingwrapperHeight
    });
  }

  function middleContainerHeight(){
   var headerHeight= $('.header').height();
   var bottomMenu= $('.more_links_wrapper').height();
   var footerHeight= $('.footer').height();
   var totalheight=headerHeight+bottomMenu+footerHeight+150;
   // console.log(totalheight);
   var windowHeight=$(window).height();
   $('.after-submit-inquiry-form').css('height', windowHeight-totalheight);
  }

  $(window).resize(function() {

    //settingHeightOfFlipper();

    //upcomingWebinar()
    submenuIcon();
    // middleContainerHeight();
  });

  $('p,li,strong').each(function() {
    if ($.trim($(this).text()).length == 0 || $(this).text() == ' ') {
      if (!$(this).parent().hasClass('carousel-indicators')) {
        if ($(this).find('img').length == 0) {
          if ($(this).find('input').length == 0) {
            if ($(this).find('textarea').length == 0) {
              $(this).remove()
            }
          }

        }

      }
    }
  })

  $('br').each(function() {
    if ($(this).parent('address').length == 0) {
      $(this).remove()
    }

  })
  $('.automative-text ul,.about-us-content ul, .AMS-description ul').each(function() {


    if ($(this).prev().find('strong').length != 0) {
      $(this).prev().css({
        'margin-top': '20px'

      })
    }


  })

  $('.cross-out').on('touchstart click', function() {
    $(this).closest('.flip-container').removeClass('hover');
  })

  $(document).on('click', '.flip-container .front', function() {

    if (window_width <= 1024) {
      $('.flip-container').removeClass('hover')
      $(this).closest('.flip-container').addClass('hover');
    }


  })

  $(window).bind('orientationchange', function(event) {
    $('.close-request-info-popup').trigger('click');
    $('#request-info-mobile button').trigger('click');
    var ori = window.orientation,
      screenWidth, screenHeight;
    if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) {
      screenWidth = (ori == 90 || ori == -90) ? screen.height : screen.width,
        screenHeight = (ori == 90 || ori == -90) ? screen.width : screen.height;
    } else {
      screenWidth = screen.width;
      screenHeight = screen.height;
    }
    BackgoudHieght(screenWidth, screenHeight);
    $('#services-info-popup-close').trigger('click')
  });

  //setting backgund height

  submenuIcon();
  BackgoudHieght(window_width, window_height)

  function BackgoudHieght(w, h) {

    $('.full-background, .section.slider').each(function() {
      if (w > 1027) {
        $(this).css('height', h - 120)
      } else {
        //alert(window_height)
        $(this).css('height', h - 80)
      }

    })



    $('.bg-small-height,.normal-page-container,#careers-why-yash .item, .yash-blog-author .slider').each(function() {

      $(this).css('height', h/2)

    })


  }

  function submenuIcon() {
    var smallHeight = $('.services-icon-text').height();
    $('.services-icon-text').each(function() {
      var this_height = $(this).height();
      var this_width = $(this).width();
      var parent_width = $(this).closest('.services-icon-info').width() - 65;
      if (smallHeight < this_height || this_width > parent_width) {
        $(this).addClass('submenuIcon-full')
      }

    })
  }
  //upcomingWebinar()
  function upcomingWebinar() {

    $('#upcoming-webinar .item').addClass('active-item')
    $('.upcoming-title').each(function() {
      var this_w = $(this).outerWidth(true) + 30;
      // console.log(this_w)
      $(this).parent().css({
        'width': this_w,
        'margin': '0 auto',
        'padding': 0,
        'float': 'none'
      })
      $(this).css('width', '100%')
    }, function() {
      $(this).removeClass('active-item');
    })


  }


  setCarouselHeight('#sap-third-slider');
});
$(window).resize(function() {
  setCarouselHeight('#sap-third-slider');
  //settingEmployeeSliderHeight('#employee-quote-slider');
});

if ($("#ui-datepicker-div").is(':visible')) {
  $('#ui-datepicker-div').hide();
}




//$("#yash-event-start-date,#yash-event-end-date").on("blur", function(e) { alert();$(this).datepicker("hide"); });



function setCarouselHeight(id) {
  var slideHeight = [];
  $(id + ' .item').each(function() {
    // add all slide heights to an array
    slideHeight.push($(this).outerHeight(true));
  });

  // find the tallest item
  max = Math.max.apply(null, slideHeight);

  // set the slide's height
  $(id + ' .carousel-content').each(function() {
    $(this).css('height', max + 'px');
    $('#sap-third-slider').css('min-height', max);
  });
}

$(document).on('touchstart click', function(e) {
  var ele = $(e.toElement);
  //alert();
  if (!ele.hasClass(".datepicker-intialize") && !ele.hasClass("ui-datepicker") && !ele.hasClass("ui-icon") && !$(ele).parent().parents(".ui-datepicker").length)
    $("#ui-datepicker-div").datepicker("hide");
});
$(document).ready(function() {
  var ww = $(window).width();

  /*Trainee Registration form js*/
  $('#skills').change(function(){
       var skills=$(this).val();
        if(skills=='Oracle Apps Functional'){
          $('#oracleAppFunctional').show();
        }
        else{
          $('#oracleAppFunctional').hide();
        }
  });
  $('.frnd-radio').change(function() {
    var frndYes=$(this).val();
    if(frndYes=='yes'){
      $('#frnd-section').show();
    }
    else{
      $('#frnd-section').hide();
    }
  });
   $('.industry-experience').change(function() {
    var industryExperience=$(this).val();
    if(industryExperience=='yes'){
      $('#experience-section').show();
    }
    else{
      $('#experience-section').hide();
    }
  });
  /*Trainee Registration form js end*/
   

  $(document).on('click', '.AMS-dropdown', function() {
    var dropdown = $(this).attr('data-dropdown');
    var presentElement = $(this);

    if (dropdown == "true") {
      $(this).closest('.row').find('.ams-dropdown-options').slideDown('fast', function() {
        presentElement.attr('data-dropdown', 'false');
        $('.inner-AMS-dropdown img').animate({
          borderSpacing: -180
        }, {
          step: function(now, fx) {
            $(this).css('-webkit-transform', 'rotate(' + now + 'deg)');
            $(this).css('-moz-transform', 'rotate(' + now + 'deg)');
            $(this).css('transform', 'rotate(' + now + 'deg)');
          },
          duration: 100
        }, 'linear'); //animation ends here
      });
    }
    if (dropdown == "false") {
      $(this).closest('.row').find('.ams-dropdown-options').slideUp('fast', function() {
        presentElement.attr('data-dropdown', 'true');
        $('.inner-AMS-dropdown img').animate({
          borderSpacing: 0
        }, {
          step: function(now, fx) {
            $(this).css('-webkit-transform', 'rotate(' + now + 'deg)');
            $(this).css('-moz-transform', 'rotate(' + now + 'deg)');
            $(this).css('transform', 'rotate(' + now + 'deg)');
          },
          duration: 100
        }, 'linear'); //animation ends here
      });
    }
  });
  $('.ams-dropdown-close').click(function() {

      $('.ams-dropdown-options').slideUp('fast', function() {
        $('.AMS-dropdown').attr('data-dropdown', 'true');
        $('.inner-AMS-dropdown img').animate({
          borderSpacing: 0
        }, {
          step: function(now, fx) {
            $(this).css('-webkit-transform', 'rotate(' + now + 'deg)');
            $(this).css('-moz-transform', 'rotate(' + now + 'deg)');
            $(this).css('transform', 'rotate(' + now + 'deg)');
          },
          duration: 100
        }, 'linear'); //animation ends here
      });

    })
    //settingArrowsMiddle();
  function settingArrowsMiddle() {
    var firstsliderheight;
    var secondhomesliderheight;

    firstsliderheight = $('#myCarousel').outerHeight(true);
    secondhomesliderheight = $('#myCarousel1').outerHeight(true);


    $('.homepage_first_slider .left_arrow,.homepage_first_slider .right_arrow').css({
      'top': (firstsliderheight / 2) - 15
    });
    $('.homepagesecond_slider .left_arrow,.homepagesecond_slider .right_arrow').css({
      'top': (secondhomesliderheight / 2) - 15
    });

  }
  /*var secondhomesliderheight=$('#myCarousel1 .item.active img').height();
  $('.homepage_first_slider .table_layout').css({'height':firstsliderheight});
  $('#myCarousel1 .table_layout').css({'height':secondhomesliderheight});*/

  // $("#homePageSecondSlider").owlCarousel({
  //
  //     navigation : false, // Show next and prev buttons
  //     slideSpeed : 300,
  //     paginationSpeed : 400,
  //     singleItem:true,
  //     rewindNav : true,
  //     rewindSpeed:1000
  //
  //     // "singleItem:true" is a shortcut for:
  //     // items : 1,
  //     // itemsDesktop : false,
  //     // itemsDesktopSmall : false,
  //     // itemsTablet: false,
  //     // itemsMobile : false
  //
  //  });

  /*function close_accordion_section() {
    $('.accordion .accordion-section-title').removeClass('active');
    $('.accordion .accordion-section-content').slideUp(300).removeClass('open');
  }*/

  /*$('.accordion-section-title').click(function(e) {
    // Grab current anchor value
    var currentAttrValue = $(this).attr('href');

    if ($(e.target).is('.active')) {
      close_accordion_section();
    } else {
      close_accordion_section();

      // Add active class to section title
      $(this).addClass('active');
      // Open up the hidden content panel
      $('.accordion ' + currentAttrValue).slideDown(300).addClass('open');
    }

    e.preventDefault();


  });*/

  $(document).on('click', '.services-icon-info', function() {

    if ($(this).find('.services-icon').hasClass('services-icon-has-child')) {
      var this_Element = $(this)
      var this_obj = $(this).find('.services-icon');
      var pageid = $(this).attr("data-iconid");
      if (this_obj.hasClass('active') ) {
        this_obj.removeClass('adding-activeclass').removeClass('active');
        $('#service-icons-popup').remove();
        $('.services-icon-info').css({
          'opacity': '0.5'
        });
        $('.service-icons-wrapper').hide();
      } else {

        $('.services-icon-has-child').removeClass('adding-activeclass').removeClass('open');
        this_obj.addClass('adding-activeclass').addClass('active');
        $('#service-icons-popup').remove();
        var parentPosY = $(this).closest('.service-icons-container').offset().top;

        var childPosY = $(this).offset().top;

        var popUpHeight = parentPosY - childPosY;

        var thisElement = $(this);
        $.ajax({
          type: "GET",

          url: "http://"+location.hostname+"/get_childpage.php", //Relative or absolute path to response.php file
          // url: "http://localhost/yash/wordpress/get_childpage.php",

          data: 'pageid=' + pageid,
          success: function(data) {
              var data = JSON.parse(data);
              console.log(data.main.content);
              var template = '';
//alert(data.main.content);

              template = '<div id="service-icons-popup">';
              template += '<div class="service-popup-slider-header">';
              template += '<p> ' + data.main.content + ' <a href="' + data.main.link + '" class="anchor-tag-underline" title="Read More">Read More...</a> </p>';
              var serviceslinks = '<div class="service-popup-slider-links"><ul>';
              //var litemplate="";
              for (var i = 0; i < data.childpages.length; i++) {
                serviceslinks += '<li><a href="' + data.childpages[i].child_link + '"> ' + data.childpages[i].child_title + ' </a></li>';
              };
              serviceslinks += '</ul>'
              serviceslinks += '</div>';
              template += serviceslinks;


              $('#append-popup-conent').html(template);
              var popupHtml = $('#services-icons-information-popup');
              var itemHieght = this_obj.outerHeight(true);
              $('.services-icon-info').css({
                'opacity': '0.5'
              });
              console.log(this_Element.attr('class'))
              this_Element.css({
                'opacity': '1'
              });

              this_obj.addClass('active');

              $('.service-popup #services-icons-information-popup').hide();
              $('.service-popup').css({
                'height': 'auto'
              });
              $('.services-icon-info').css('height', itemHieght);
              $('#services-icons-information-popup').css({
                'display': 'block'
              });
              var divheight = $('.service-icons-wrapper').outerHeight(true);
              var totalHeight = divheight + itemHieght;

              //this_obj.closest('.service-popup').append(popupHtml);

              $('.service-icons-wrapper').css({
                'top': childPosY + itemHieght + 'px'
              }).slideDown('slow');
              //popupHtml.;


            } //ajax success ends here


        });

      }
    }

  });

  $(".services-icon-info")
    .mouseout(function() {
      if ($(this).find('.services-icon').hasClass('active')) {
        return;
      }
      $(this).find('.services-icon').removeClass('adding-activeclass');
      $(this).css('opacity', '.5')
    })
    .mouseover(function() {
      $(this).find('.services-icon').addClass('adding-activeclass');
      $(this).css('opacity', 1)

    });


  $(document).on('click', '#services-info-popup-close,.anchor-tag-underline', function() {
    $('.service-icons-wrapper').hide();
    $('.service-popup').css({
      'height': 'auto'
    });
    $(".services-icon").removeClass('adding-activeclass').removeClass('active');
    $(".services-icon-info").css({
      'opacity': '0.5'
    });
  });


  //menu animation
  var isAnimating=false;
  $('.menu-toggle').on('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      if(isAnimating==false){
        if ($(this).hasClass('open')) {
            isAnimating=true;
          $('#header .menu-wrapper').animate({
            left: '-999px'
          }, 800, function() {
            $('.menu-wrapper').css('z-index', '-1');
            $('.menu-toggle').removeClass('open');
            isAnimating=false;

          })

        } 
        else {
          $('.menu-wrapper').css('z-index', '999');
          isAnimating=true;
          $('#header .menu-wrapper').animate({
            left: '0'
          }, 800, function() {
            $('.menu-toggle').addClass('open');
            isAnimating=false;

          })

        }
      }

    })


  $('.search-wrap-inner').click(function() {

    $('#header .mob-search-wrap-form').animate({
      left: '0'
    }, 800, function() {
      $('.search-wrap-inner').addClass('open');

    })

  })

  $('.search-close').click(function() {
      $('#header .mob-search-wrap-form').animate({
        left: '-999px'
      }, 800, function() {
        $('.search-wrap-inner').removeClass('open');

      })
    })
    //Menu End Here


  $('.carousel').each(function() {
    if ($(this).find('.carousel-inner .item').length > 1) {
      $(this).carousel({
          interval: 10000
        })
        .hover(function() {
            $(this).carousel('pause')
          },
          function() {
            $(this).carousel('cycle')
          });

    } else {
      $(this).find('.carousel-control').hide();
      $(this).find('.carousel-indicators').hide();
    }
  });


  $('.subscribe-now').click(function() {
    $('.subscribe-form').show();
    $('.thanku-mesg').hide();
  })
  $('#subscribe .close-video').click(function() {

    $('.subscribe-form-digital').get(0).reset();


  });
  //Digital Center Sbscribe
  $.validate({

  });

  var subscribeValidated=false;
  var subscribeform=$.validate({
    form: '.rfi-form-desktop',
    onSuccess: function($form) {
      subscribeValidated=false;
    },
     onError : function($form) {
      subscribeValidated=true;
    }
  });
$('.subscribe-form-digital').submit(function(e){
  if (subscribeValidated==false) {
    e.preventDefault();
     var name = $('.name-user').val();
      var email = $('.user-email-digi').val();
      // console.log(email);
      var phone = $('.user-phone').val();
      var company = $('.user-company').val();
      $('.thanku-mesg').hide();
      $.ajax({
        url: "http://"+location.hostname+"/subscribe.php",
        method: 'POST',
        data: {
          name: name,
          email: email,
          phone: phone,
          company: company
        },
        success: function(data) {
          if (data == 'notpresent') {
            $('.thanku-mesg').show().text('Thank you for subscribe').css('color', '#003d66');;
            
            $('.subscribe-form').hide();
            $('.subscribe-form-digital').get(0).reset();
          }
          if (data == 'present') {
            $('.thanku-mesg').show().text('Email address already exit').css('color', '#d53627');
           
            $('.subscribe-form').hide();
            $('.subscribe-form-digital').get(0).reset();

          }

        },
        dataType: ""
      });
  }
  else
  {
    e.preventDefault();
  }
});

/*RFI Button */

var rfiValidatedDesk=false;
  var rfiformdesk=$.validate({
    form: '.rfi-form-desktop',
    onSuccess: function($form) {
      rfiValidatedDesk=false;
    },
     onError : function($form) {
      rfiValidatedDesk=true;
    }
  });
  $('.rfi-form-desktop').submit(function(e){
    //validated
      if (rfiValidatedDesk==false) {
          e.preventDefault();
      var rfiname = $('#rfinamedesk').val();
      var rfiemail = $('#rfiemaildesk').val();
      var rfiphone = $('#rfiphonedesk').val();
      
      var rficompany = $('#rficompanydesk').val();
      var rficomment = $('#rficommentdesk').val();
	  var hidreferer = $('#hidlocation').val();
      //console.log(rficomment);
      $('.rfi-thanku-msg').hide();
      $.ajax({
        url: "http://"+location.hostname+"/rfi.php",
        method: 'POST',
        data: {
          name: rfiname,
          email: rfiemail,
          phone: rfiphone,
          company: rficompany,
          comment:rficomment,
		  referer:hidreferer
        },
        success: function(data) {
          //console.log(data);
        
            $('.rfi-thanku-msg').show();
            $('.rfi-form-desktop').get(0).reset();
           
                  },
        dataType: ""
      });
      }else{
          e.preventDefault();
          // console.log('true');
      }
  })
var rfiValidatedMobile=false;
  var rfiformmobile=$.validate({
    form: '.rfi-form-mobile',
    onSuccess: function($form) {
      rfiValidatedMobile=false;
    },
     onError : function($form) {
      rfiValidatedMobile=true;
    }
  });

$('.rfi-form-mobile').submit(function(e){
  if (rfiValidatedMobile==false) {
    e.preventDefault();
    var rfiname = $('#rfinamemobile').val();
    var rfiemail = $('#rfiemailmobile').val();
    var rfiphone = $('#rfiphonemobile').val();
    
    var rficompany = $('#rficompanymobile').val();
    var rficomment = $('#rficommentmobile').val();
    var hidreferer = $('#hidlocation').val();
    // console.log(rficomment);
    $('.rfi-thanku-msg').hide();
    $.ajax({
      url: "http://"+location.hostname+"/rfi.php",
      method: 'POST',
      data: {
        name: rfiname,
        email: rfiemail,
        phone: rfiphone,
        company: rficompany,
        comment:rficomment,
		referer:hidreferer
      },
      success: function(data) {
        // console.log(data);
      
           $('.rfi-thanku-msg').show();
          $('.rfi-form-mobile').get(0).reset();
         
                },
      dataType: ""
    });
  }
  else
  {
    e.preventDefault();
  }
});
  //Digital Center Sbscribe End


  //Add Other Details
  var formRepeat = $('.repeat-form');
  var repeatedValue = 0;



  $('.add-another-member').click(function() {

    formRepeat.eq(repeatedValue).show();
    repeatedValue++;
    if (repeatedValue == 2) {
      $(this).hide();
    }

  });
  $('.remove-repeat-form').click(function() {
    repeatedValue--;
    $(this).parent($('.repeat-form')).hide();
    if (repeatedValue == 0) {
      $('.add-another-member').show();
    }
  })

  $('.technology-select').on('change', function() {
    var selectValue = $(this).val();

    // $('.chosen-container').hide();
    var template = '';
    $('#Certification').html('');
    $.ajax({
      type: "POST",
      url: "http://"+location.hostname+"/technologyRegistration.php",
      // url: "http://localhost/yash/wordpress/technologyRegistration.php",
      data: 'selectValue=' + selectValue,

      success: function(data) {
        //console.log(data);
        var data = JSON.parse(data);
        var dataLength = data.length;
        // console.log(dataLength);
        for (var i = 0; i < dataLength; i++) {
          template += '<option value="' + data[i] + '">' + data[i] + '</option>';
        }
        $('#Certification').html(template);
        $('#Certification, .after-select').show();
        $("#Certification").chosen("destroy");
        $("#Certification").chosen({
          no_results_text: "Oops, nothing found!"
        });



      },
      dataType: ""



    });
  });
  //mobile and desktop issue
  $('#desktop-req-button').click(function(e) {
    var slider = $('.animation-wrapper');
    $(this).fadeOut();
    slider.animate({
      "right": 0
    }, 600);
  });

$('#request-info-mobile .close').click(function(){
   $('.rfi-form-mobile').get(0).reset();
   $('.rfi-thanku-msg').hide();
});

  $('.close-request-info-popup').click(function() {
    var slider = $('.animation-wrapper');
    $('#desktop-req-button').fadeIn();
    slider.animate({
      "right": -360
    }, 600);
    $('.rfi-form-desktop').get(0).reset();
    $('.rfi-thanku-msg').hide();
  });
  //setting employee-quote-slider height depending on content height
  //  settingEmployeeSliderHeight('#employee-quote-slider');

  function settingEmployeeSliderHeight(id) {
    var slideHeight = [];
    $(id + ' .item').each(function() {
      // add all slide heights to an array
      slideHeight.push($(this).outerHeight(true));
    });
    // find the tallest item
    max = Math.max.apply(null, slideHeight);
    // set the slide's height
    $(id + ' .carousel-inner').each(function() {
      $(this).css('height', max + 'px');
    });
  }

  //Webinar Validation
  $('.yash-event-search').click(function() {

  });
});

$(window).load(function() {

    $('.yash-insighsts').each(function(){

        $(this).insightcarouselHeights();

    });
    $('#upcoming-webinar').each(function(){

        $(this).upComingWebCarouselHeights();

    });

});

// Normalize Bootstrap Carousel Heights

$.fn.insightcarouselHeights = function() {

    var items = $(this).find('.item'), // grab all slides

        heights = [], // create empty array to store height values

        tallest, // create variable to make note of the tallest slide

        call;

    var normalizeHeights = function() {

        items.each(function() { // add heights to array

            heights.push($(this).outerHeight());

        });

        tallest = Math.max.apply(null, heights); // cache largest value

        items.css('height', tallest);

    };

    normalizeHeights();

    $(window).on('orientationchange', function() {

        // reset vars

        tallest = 0;

        heights.length = 0;

        items.css('height', ''); // reset height

        if(call){

            clearTimeout(call);

        };

        call = setTimeout(normalizeHeights, 100); // run it again

    });

};



$.fn.upComingWebCarouselHeights = function() {

    var items = $(this).find('.item'), // grab all slides

        heights = [], // create empty array to store height values

        tallest, // create variable to make note of the tallest slide

        call;

    var normalizeHeights = function() {

        items.each(function() { // add heights to array

            heights.push($(this).outerHeight());

        });

        tallest = Math.max.apply(null, heights); // cache largest value

        items.css('height', tallest);

    };

    normalizeHeights();

    $(window).on('orientationchange', function() {

        // reset vars

        tallest = 0;

        heights.length = 0;

        items.css('height', ''); // reset height

        if(call){

            clearTimeout(call);

        };

        call = setTimeout(normalizeHeights, 100); // run it again

    });





};
