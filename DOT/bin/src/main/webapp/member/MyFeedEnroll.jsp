<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyFeedEnroll</title>
 		<!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- alert 스타일 변경-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!-- font -->
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0"
        />
        <!--<script src="js/sidebar.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"
        />
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <!-- alert 스타일 변경 -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- Slick-->
        <link src="${contextPath}/resources/css/slick.css" type="text/css"></link>
        <link src="${contextPath}/resources/css/slick-theme.css" type="text/css"></link>
        <script src="${contextPath}/resources/js/slick.min.js" type="text/javascript" charset="utf-8"></script>
         <script type="text/javascript" src="${contextPath}/resources/js/MyFeed.js"></script>
        <link rel="stylesheet" href="${contextPath}/resources/css/My_Feed_Enroll.css" />
</head>
<body>
	<div class="wrap">
            <jsp:include page="../common/Header.jsp" />    
            <div class="contents">
          		<jsp:include page="../common/Sidebar.jsp" />
                <div class="main_content">
                    <div class="main_container">
                        <div class="slide_wrap">
                            <div class="slide_container">
                                <div class="add-remove">
                                </div>
                                <div class="buttons">
                                    <label class="button add-slide">
                                        <span class="material-symbols-outlined add">
                                            add_circle
                                        </span>
                                        <input type="file" class="file-input" accept="image/*" style="display: none;">
                                    </label>
                                </div>
                            </div>
                            <div class="slide_list_wrap">
                                <div class="slide_list">
                                </div>
                            </div>
                        </div>
                        <div class="update_container">
                            <div class="id_container">
                                <div class="userid_img">
                                    <img src ="img/IU.jfif">
                                </div>
                                <div class="user_id">
                                    <h5>xeesoohee</h5>
                                </div>
                            </div>
                            <div class="feed_container">
                                <textarea class="text" placeholder="문구 입력...."></textarea>
                            </div>
                            <div class="hash_container">
                                <input type="text" class="hashtag" placeholder="태그 입력...."/>
                            </div>
                            <div class="confirm_container">
                                <div class="cancle_btn"></div>
                                <div class="confirm_btn"><button class="cancle" onclick="toMyFeed()">취소</button><button class="confirm">등록</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<script>
		  function toMyFeed() {
		        location.href = '${contextPath}/MyFeed.me';
		  }
		  jb1(function () {
		    var slideContainer = jb1('.add-remove');
		    var slideList = jb1('.slide_list');
		    var slideIndex = 0;
		
		    jb1('.slide_list').slick({
		        slidesToShow: 1,
		        slidesToScroll: 1
		    });
		
		    jb1('.file-input').on('change', function (e) {
		        var files = e.target.files;
		        if (files && files.length > 0) {
		            var imgUrl = URL.createObjectURL(files[0]);
		            slideIndex++;
		
		            var newSlide = '<div class="add_img"><img src="' + imgUrl + '"></div>';
		            jb1('.add-remove').slick('slickAdd', newSlide);
		
		            var newSlideThumbnail = '<div class="thumbnail"><img src="' + imgUrl + '">' +
		                                    '<a href="javascript:void(0)" class="remove-slide">' +
		                                    '<span class="material-symbols-outlined remove">delete_forever</span></a></div>';
		            slideList.append(newSlideThumbnail);
		
		            jb1('.remove-slide').show(); // 사진 추가되면 지우는 버튼 보이게 함
		        }
		    });
		
		    slideList.on('click', '.remove-slide', function () {
		        var clickedIndex = jb1(this).parent().index();
		        jb1('.slide_list').slick('slickRemove', clickedIndex);
		        jb1(this).parent().remove();
		        slideIndex--;
		
		        if (slideIndex === 0) {
		            jb1('.remove-slide').hide(); // 모든 사진이 삭제되면 지우는 버튼 숨김
		        }
		    });
		
		    jb1('.add-slide').on('click', function () {
		        jb1('.file-input').click();
		    });
		});
		
		
		
		
		</script>
</body>
</html>