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
                        $(".start-wrap").css("display","none");
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
                sec1Header.css({'opacity': 0,'z-index': '-10'});
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
    
    
    // 스크롤 이벤트 핸들러
	$(window).on('scroll', debounce(function () {
	  const elements = document.querySelectorAll('.slide');
	
	  elements.forEach(element => {
	    if (element.classList.contains('ani-slide')) {
	      return; // 이미 애니메이션이 적용된 경우 스킵
	    }
	
	    if (isInView(element) && isAtOneThirdViewport(element)) {
	      element.classList.add('ani-slide');
	    }
	  });
	}, 1)); // 디바운싱 딜레이를 조절하여 성능 향상
	
	// 엘리먼트가 화면에 보이는지 여부를 확인하는 함수
	function isInView(element) {
	  const rect = element.getBoundingClientRect();
	  return (
	    rect.top >= 0 &&
	    rect.left >= 0 &&
	    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
	    rect.right <= (window.innerWidth || document.documentElement.clientWidth)
	  );
	}
	
	// 엘리먼트가 화면 아래에서 1/3 지점에 위치하는지 확인하는 함수
	function isAtOneThirdViewport(element) {
	  const rect = element.getBoundingClientRect();
	  return rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) * (5/3);
	}
	
	// 스크롤 이벤트를 제어하기 위한 디바운싱 함수
	function debounce(func, delay) {
	  let timer;
	  return function () {
	    clearTimeout(timer);
	    timer = setTimeout(func, delay);
	  };
	}
	    
    
    // 스크롤 이벤트를 처리하는 함수
  function handleScroll() {
    // sec3-body와 box-dw 요소를 가져옵니다.
    var sec3Body = document.querySelector(".sec3-body");
    var boxDwList = document.querySelectorAll(".box-dw");

    // sec3-body의 top 위치를 가져옵니다.
    var sec3BodyTop = sec3Body.getBoundingClientRect().top;

    // 원하는 거리 (가까워질 때와 멀어질 때의 거리)를 설정합니다.
    var desiredDistance = 400;

	boxDwList.forEach(function (boxDw) {
	
		var boxDwTop = boxDw.getBoundingClientRect().top;
	
		// box-dw의 top 위치를 조정합니다.
		if (sec3BodyTop <= desiredDistance) {
		  // 스크롤이 해당 영역과 가까워질 때
		  boxDw.style.top = "0"; // 원하는 위치 (예: 0)로 이동
		} else {
		  // 스크롤이 해당 영역에서 멀어질 때
		  boxDw.style.top = (sec3BodyTop - desiredDistance) + "px";
		}
	})
  }

  // 스크롤 이벤트를 등록하여 handleScroll 함수를 호출합니다.
  window.addEventListener("scroll", handleScroll);
    
    
    
    

});
