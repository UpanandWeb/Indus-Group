
    $(document).ready(function() {
      $(".owl-carousel").owlCarousel();
    });

    $(".owl-prev").html('<i class="fa fa-long-arrow-left"></i>');
    
    $(".owl-next").html('<i class="fa fa-long-arrow-right"></i>');

     $("#owl-demo2").owlCarousel({
      items : 8, //4 items above 1000px browser width
      itemsDesktop : [1000,8], //4 items between 1000px and 901px
      itemsDesktopSmall : [900,4], // betweem 900px and 601px
      itemsTablet: [600,4], //1 items between 600 and 0;
      itemsMobile : [500,1], // itemsMobile disabled - inherit from itemsTablet option
       pagination: false,
    navigation: false,
        autoPlay : 3000,
       stopOnHover : true,
   
     var interleaveOffset = 0.5;

                var swiperOptions = {
                  loop: true,
                  speed: 1000,
                  grabCursor: true,
                  autoplay: true,
                  watchSlidesProgress: true,
                  mousewheelControl: true,
                  keyboardControl: true,
                  navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev"
                  },
                  on: {
                    progress: function() {
                      var swiper = this;
                      for (var i = 0; i < swiper.slides.length; i++) {
                        var slideProgress = swiper.slides[i].progress;
                        var innerOffset = swiper.width * interleaveOffset;
                        var innerTranslate = slideProgress * innerOffset;
                        swiper.slides[i].querySelector(".slide-inner").style.transform =
                          "translate3d(" + innerTranslate + "px, 0, 0)";
                      }      
                    },
                    touchStart: function() {
                      var swiper = this;
                      for (var i = 0; i < swiper.slides.length; i++) {
                        swiper.slides[i].style.transition = "";
                      }
                    },
                    setTransition: function(speed) {
                      var swiper = this;
                      for (var i = 0; i < swiper.slides.length; i++) {
                        swiper.slides[i].style.transition = speed + "ms";
                        swiper.slides[i].querySelector(".slide-inner").style.transition =
                          speed + "ms";
                      }
                    }
                  }
                };
                
                var swiper = new Swiper(".swiper-container", swiperOptions);
 


      