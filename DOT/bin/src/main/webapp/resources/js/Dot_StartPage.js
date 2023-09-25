$(function() {
    
    $(".sec1-header").addClass("sec1-header-effect");
    
    setTimeout(() => {
        $(".sec1-t1").addClass("sec1-text");

        setTimeout(() => {
            $(".sec1-t2").addClass("sec1-text");

            setTimeout(() => {
                $(".sec1-t3").addClass("sec1-text");

                setTimeout(() => {
                    $(".start-wrap").addClass("end-wrap");

                    setTimeout(() => {
                        $(".start-wrap").removeClass("start-wrap");
                        $(".start-wrap").css("z-index","-1");
                    }, 1500);
    
                }, 1200);

            }, 900);

        }, 900);

    }, 1500);


    const prevTimestampRef = {};
    const isScrolling = {};
    const timerIdRef = {};
    const scrollHandler = (timestamp) => {

        if(prevTimestampRef.current === timestamp) return;


        if (isScrolling.current) {
            prevTimestampRef.current = timestamp;

        requestAnimationFrame(scrollHandler);
        }
    };

    const onScroll = () => {
        isScrolling.current = true;
        requestAnimationFrame(scrollHandler);
    
        if (timerIdRef.current) window.clearTimeout(timerIdRef.current);
    
        timerIdRef.current = window.setTimeout(() => {
            isScrolling.current = false;

            var sec1Header = $('.sec1-header');
            var section2Wrap = $('.section2-wrap');
            var sec1Bottom = sec1Header.offset().top + sec1Header.outerHeight();
            
            if (section2Wrap.offset().top <= sec1Bottom) {
                sec1Header.css({'opacity': 0}, {'z-index': -1}, {'position': 'absolute'});
            } else {
                sec1Header.css('opacity', 1);
            }




            var leftDescription = $('.left-description');
            var rightDescription = $('.right-description');

            var leftBottom = leftDescription.offset().top + leftDescription.outerHeight();
            var rightBottom = rightDescription.offset().top + rightDescription.outerHeight();

            var leftT1 = $('.left-t1');
            var leftT2 = $('.left-t2');
            var leftT3 = $('.left-t3');

            var leftT1Bot = leftT1.offset().top + leftT1.outerHeight();
            var leftT2Bot = leftT2.offset().top + leftT2.outerHeight();
            var leftT3Bot = leftT3.offset().top + leftT3.outerHeight();

            var rightI1 = $('.right-img1');
            var rightI2 = $('.right-img2');
            var rightI3 = $('.right-img3');

            var rightI1Bot = rightI1.offset().top + rightI1.outerHeight();
            var rightI2Bot = rightI2.offset().top + rightI2.outerHeight();
            var rightI3Bot = rightI3.offset().top + rightI3.outerHeight();

            var windowScroll = $(window).scrollTop();


            if(windowScroll >= rightDescription.offset().top && windowScroll <= rightBottom - leftDescription.outerHeight()) {
                leftDescription.addClass('fixed');
                leftDescription.css('transform', 'translateY(' + 0 + 'px)');
            } else {
                leftDescription.removeClass('fixed');
                leftDescription.addClass('sticky');
            }

            if(leftT1.offset().top >=  rightI1.offset().top && leftT1Bot <= rightI1Bot) { 
                leftT1.removeClass('hide-text');;
                leftT1.addClass('show-text');
            } else {
                leftT1.removeClass('show-text');
                leftT1.addClass('hide-text');;
            }

            
            if(leftT2.offset().top >=  rightI2.offset().top && leftT2Bot <= rightI2Bot) { 
                leftT2.removeClass('hide-text');;
                leftT2.addClass('show-text');
            } else {
                leftT2.removeClass('show-text');
                leftT2.addClass('hide-text');;
            }

            if(leftT3.offset().top >=  rightI3.offset().top && leftT3Bot <= rightI3Bot) { 
                leftT3.removeClass('hide-text');;
                leftT3.addClass('show-text');
            } else {
                leftT3.removeClass('show-text');
                leftT3.addClass('hide-text');;
            }
        }, 10);
    };
    window.addEventListener("scroll", onScroll, { passive: true });

});

document.addEventListener('DOMContentLoaded', function() {
    var parent = document.querySelector('.splitview'),
        topPanel = parent.querySelector('.top1'),
        handle = parent.querySelector('.handle1'),
        skewHack = 0,
        delta = 0;

    // If the parent has .skewed class, set the skewHack var.
    if (parent.className.indexOf('skewed') != -1) {
        skewHack = 1000;
    }

    parent.addEventListener('mousemove', function(event) {
        // Get the delta between the mouse position and center point.
        delta = (event.clientX - window.innerWidth / 2) * 0.5;

        // Move the handle.
        handle.style.left = event.clientX + delta + 'px';

        // Adjust the top panel width.
        topPanel.style.width = event.clientX + skewHack + delta + 'px';
    });
});