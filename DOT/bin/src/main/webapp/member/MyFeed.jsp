<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyFeed</title>
   		<link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
        />
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <!-- alert 스타일 변경-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0"
        />
        <!--<script src="js/sidebar.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="${contextPath}/resources/css/MyFeed.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"
        />
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick-theme.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick.css" />
        <script type="text/javascript" src="${contextPath}/resources/js/MyFeed.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			if('${alertMsg}' == '회원정보수정성공'){
				swal('${alertMsg}');
			}
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	<div class="wrap">
	   <jsp:include page="../common/Header.jsp" />
       <div class="contents">
          <jsp:include page="../common/Sidebar.jsp" />
           <!-- 메인 컨텐츠 마이페이지 -->
           <div class="main-content">
               <!-- 상단프로필 -->
               <div class="mypage-profile-container">
                   <div class="profile-imgs">
                       <img src="${contextPath}${profileImg.filePath}/${profileImg.changeName}" />
                   </div>
                   <div class="mypage-setbox">
                       <div class="setbox-header">
                           <div class="user_Id">
                               <span><h6>${loginUser.userNick}</h6>
                               		<c:if test="${loginUser.wbStatus == 'W'}">
                               			<img src="${contextPath}/resources/images/goodIcon.jfif" />
                               		</c:if>
                               </span><br /><br/>
                               <div class="user_name">@${loginUser.userName}</div>
                               <div class="empty">
                               </div>
                           </div>
                           <div class="update_profile">
                               <button class="btn" onclick="myEdit()">
                                   <span class="icon2"><h6>프로필 수정</h6></span>
                               </button>
                               <button class="btn"  onclick="myFeedEdit()">
                                   <span class="icon2"><h6>피드 등록</h6></span>
                               </button>
                           </div>
                       </div>
                       <div class="mypage-follower">
                           <div class="follows" onclick="follow()" style="cursor: pointer"><h5>팔로우  32명</h5></div>
                           <div class="follows" onclick="follow()" style="cursor: pointer"><h5>팔로워  1320명<h5></h5></div>
                           <div class="follows" ><h5>게시물  ${myImglist.size()}개</h5></div>
                       </div>
                   </div>
               </div>
               <!-- 선택 버튼 -->
               <div class="mypage-selectbox">
                   <div class="selectbox">
                       <div class="selectbox-btn" id="pro-btn3" onclick="selected1();">
                           <span class="material-symbols-outlined">
                               grid_on
                               </span>
                           <h5 id="h5-1">게시물</h5>
                       </div>
                   </div>
                   <div class="selectbox" id="selectbox">
                       <div class="selectbox-btn" id="pro-btn4" onclick="selected2();">
                           <span class="material-symbols-outlined">
                               bookmarks
                               </span>
                           <h5 id="h5-2">스토어</h5>
                       </div>
                   </div>
               </div>
               <!-- 하단 선택 박스1-->
               <div class="choice1 list1">
                   <div class="myimage">
                   		<c:forEach var="m" items="${myImglist}">
	                       <div class="myimage-section" data-bs-toggle="modal" data-bs-target="#MyDetailFeed" onclick="feedNo(event , ${m.fileNo})">
	                           <img class="img-size" src="${contextPath}${m.filePath}/${m.changeName}" />
	                           <div class="like">
	                               <svg
	                                   xmlns="http://www.w3.org/2000/svg"
	                                   width="16"
	                                   height="16"
	                                   fill="currentColor"
	                                   class="bi bi-heart-fill"
	                                   viewBox="0 0 16 16"
	                               >
	                                   <path
	                                       fill-rule="evenodd"
	                                       d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
	                                   />
	                               </svg>
	                               <span class="bi">444</span>
	                               <svg
	                                   xmlns="http://www.w3.org/2000/svg"
	                                   width="16"
	                                   height="16"
	                                   fill="currentColor"
	                                   class="bi bi-chat-left-fill"
	                                   viewBox="0 0 16 16"
	                               >
	                                   <path
	                                       d="M2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
	                                   />
	                               </svg>
	                               <span class="bi">44</span>
	                           </div>
	                       </div>
	                    </c:forEach>
                    </div>  
               </div>
                <!-- Modal1 -->
			   <div class="modal fade" id="MyDetailFeed" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			       <div class="modal-dialog modal-xl">
			           <div class="modal-content">
			               <div class="modal-header modal-backgound">
			                   <div class="modal-title" id="exampleModalLabel">
			                       <div class="feed-header modal-feed-header">
			                           <div class="modal-user-profile">
			                               <img src="${contextPath}${profileImg.filePath}/${profileImg.changeName}" />
			                               <span>${loginUser.userNick}</span>
			                               <div class="line-div">
			                                   <span class="material-symbols-outlined modal-toggle-button"> more_horiz </span>
			                                   <div class="modal-more-options">
			                                       <div>
			                                           <dl>
			                                               <dt onclick="location.href='My_Feed_Edit.html'">
			                                                   <span class="material-symbols-outlined"> edit </span>
			                                                   <a>수정하기</a>
			                                               </dt>
			                                               <dt>
			                                                   <span class="material-symbols-outlined"> add_box </span>
			                                                   <a>저장하기</a>
			                                               </dt>
			                                               <dt>
			                                                   <span class="material-symbols-outlined"> person_remove </span>
			                                                   <a>팔로우 취소</a>
			                                               </dt>
			                                               <dt>
			                                                   <span class="material-symbols-outlined"> report </span>
			                                                   <a>신고하기</a>
			                                               </dt>
			                                           </dl>
			                                       </div>
			                                   </div>
			                               </div>
			                           </div>
			                       </div>
			                   </div>
			                   <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">Ⅹ</button>
			               </div>
			               <div class="modal-body modal-backgound">
			                   <div class="modal-feed-body">
			                       <div class="feed-img" id="feed-img">
			                        <%--  <div>
			                         	<img src="${contextPath}/resources/images/dog1.gif">
			                         </div>
			                         <div>
			                         	<img src="${contextPath}/resources/images/dog2.gif">
			                         </div> --%>
			                       </div>
			                       <div class="body-bottom">
			                           <div class="feed-tools">
			                               <div class="clickable-svg">
			                                   <svg
			                                       xmlns="http://www.w3.org/2000/svg"
			                                       width="20"
			                                       height="20"
			                                       fill="currentColor"
			                                       class="bi bi-heart"
			                                       viewBox="0 0 16 16"
			                                   >
			                                       <path
			                                           d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
			                                       />
			                                   </svg>
			                               </div>
			                               <div class="clickable-svg">
			                                   <svg
			                                       xmlns="http://www.w3.org/2000/svg"
			                                       width="25"
			                                       height="25"
			                                       fill="currentColor"
			                                       class="bi bi-share"
			                                       viewBox="0 0 16 16"
			                                   >
			                                       <path
			                                           d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"
			                                       />
			                                   </svg>
			                               </div>
			                               <div class="clickable-svg">
			                                   <svg
			                                       xmlns="http://www.w3.org/2000/svg"
			                                       width="28"
			                                       height="28"
			                                       fill="currentColor"
			                                       class="bi bi-plus-square"
			                                       viewBox="0 0 16 16"
			                                   >
			                                       <path
			                                           d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
			                                       />
			                                       <path
			                                           d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
			                                       />
			                                   </svg>
			                               </div>
			                           </div>
			                           <div class="feed-text">
			                               <span> 회원님의 게시글을 1,024명이 좋아합니다. </span>
			                               <br />
			                               <span>
			                                   <b>dasdas</b>
			                                   다 여러분들 덕분에 제가 이렇게 되었습니다 ㅎㅎ 여러분 만나서 반갑숩니다 ㅎㅎ껄껄
			                               </span>
			                           </div>
			                       </div>
			                   </div>
			                   <div class="modal-feed-footer">
			                       <div class="reply-wrap">
			                           <div class="reply-middle">
			                               <dl>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                                   <dt>
			                                       <img src="img/parksujun.jpg" />
			                                       <div class="reply-list">
			                                           <span>dasdasda</span>
			                                           <span>와 오창정 폼 미쳐따이</span>
			                                       </div>
			                                   </dt>
			                               </dl>
			                           </div>
			                           <div class="reply-bottom">
			                               <input type="text" placeholder="댓글을 입력하세요." />
			                               <button>답글</button>
			                           </div>
			                       </div>
			                   </div>
			               </div>
			           </div>
			       </div>
			   </div>
               <!-- 하단 선택 박스2-->
               <div class="choice2 list2">
                   <div class="myimage">
                   		<c:forEach var="n" items="${myImglist}" begin="0" end="0">
	                       <div class="myimage-section"  data-bs-toggle="modal" data-bs-target="#MyDetailFeed2" onclick="feedNo2(event , ${n.fileNo})">
	                           <img class="img-size" src="${contextPath}${n.filePath}/${n.changeName}" />
	                           <div class="like">
	                               <svg
	                                   xmlns="http://www.w3.org/2000/svg"
	                                   width="16"
	                                   height="16"
	                                   fill="currentColor"
	                                   class="bi bi-heart-fill"
	                                   viewBox="0 0 16 16"
	                               >
	                                   <path
	                                       fill-rule="evenodd"
	                                       d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
	                                   />
	                               </svg>
	                               <span class="bi">444</span>
	                               <svg
	                                   xmlns="http://www.w3.org/2000/svg"
	                                   width="16"
	                                   height="16"
	                                   fill="currentColor"
	                                   class="bi bi-chat-left-fill"
	                                   viewBox="0 0 16 16"
	                               >
	                                   <path
	                                       d="M2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
	                                   />
	                               </svg>
	                               <span class="bi">44</span>
	                           </div>
	                       </div>
	                    </c:forEach>
                   </div>
               </div>
           </div>
           <!-- Modal2 -->
		   <div class="modal fade" id="MyDetailFeed2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		       <div class="modal-dialog modal-xl">
		           <div class="modal-content">
		               <div class="modal-header modal-backgound">
		                   <div class="modal-title" id="exampleModalLabel">
		                       <div class="feed-header modal-feed-header">
		                           <div class="modal-user-profile">
		                               <img src="${contextPath}${profileImg.filePath}/${profileImg.changeName}" />
		                               <span>${loginUser.userNick}</span>
		                               <div class="line-div">
		                                   <span class="material-symbols-outlined modal-toggle-button"> more_horiz </span>
		                                   <div class="modal-more-options">
		                                       <div>
		                                           <dl>
		                                               <dt onclick="location.href='My_Feed_Edit.html'">
		                                                   <span class="material-symbols-outlined"> edit </span>
		                                                   <a>수정하기</a>
		                                               </dt>
		                                               <dt>
		                                                   <span class="material-symbols-outlined"> add_box </span>
		                                                   <a>저장하기</a>
		                                               </dt>
		                                               <dt>
		                                                   <span class="material-symbols-outlined"> person_remove </span>
		                                                   <a>팔로우 취소</a>
		                                               </dt>
		                                               <dt>
		                                                   <span class="material-symbols-outlined"> report </span>
		                                                   <a>신고하기</a>
		                                               </dt>
		                                           </dl>
		                                       </div>
		                                   </div>
		                               </div>
		                           </div>
		                       </div>
		                   </div>
		                   <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">Ⅹ</button>
		               </div>
		               <div class="modal-body modal-backgound">
		                   <div class="modal-feed-body">
		                       <div class="feed-img2" id="feed-img">
		                        <%--  <div>
		                         	<img src="${contextPath}/resources/images/dog1.gif">
		                         </div>
		                         <div>
		                         	<img src="${contextPath}/resources/images/dog2.gif">
		                         </div> --%>
		                       </div>
		                       <div class="body-bottom">
		                           <div class="feed-tools">
		                               <div class="clickable-svg">
		                                   <svg
		                                       xmlns="http://www.w3.org/2000/svg"
		                                       width="20"
		                                       height="20"
		                                       fill="currentColor"
		                                       class="bi bi-heart"
		                                       viewBox="0 0 16 16"
		                                   >
		                                       <path
		                                           d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
		                                       />
		                                   </svg>
		                               </div>
		                               <div class="clickable-svg">
		                                   <svg
		                                       xmlns="http://www.w3.org/2000/svg"
		                                       width="25"
		                                       height="25"
		                                       fill="currentColor"
		                                       class="bi bi-share"
		                                       viewBox="0 0 16 16"
		                                   >
		                                       <path
		                                           d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"
		                                       />
		                                   </svg>
		                               </div>
		                               <div class="clickable-svg">
		                                   <svg
		                                       xmlns="http://www.w3.org/2000/svg"
		                                       width="28"
		                                       height="28"
		                                       fill="currentColor"
		                                       class="bi bi-plus-square"
		                                       viewBox="0 0 16 16"
		                                   >
		                                       <path
		                                           d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
		                                       />
		                                       <path
		                                           d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
		                                       />
		                                   </svg>
		                               </div>
		                           </div>
		                           <div class="feed-text">
		                               <span> 회원님의 게시글을 1,024명이 좋아합니다. </span>
		                               <br />
		                               <span>
		                                   <b>dasdas</b>
		                                   다 여러분들 덕분에 제가 이렇게 되었습니다 ㅎㅎ 여러분 만나서 반갑숩니다 ㅎㅎ껄껄
		                               </span>
		                           </div>
		                       </div>
		                   </div>
		                   <div class="modal-feed-footer">
		                       <div class="reply-wrap">
		                           <div class="reply-middle">
		                               <dl>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                                   <dt>
		                                       <img src="img/parksujun.jpg" />
		                                       <div class="reply-list">
		                                           <span>dasdasda</span>
		                                           <span>와 오창정 폼 미쳐따이</span>
		                                       </div>
		                                   </dt>
		                               </dl>
		                           </div>
		                           <div class="reply-bottom">
		                               <input type="text" placeholder="댓글을 입력하세요." />
		                               <button>답글</button>
		                           </div>
		                       </div>
		                   </div>
		               </div>
		           </div>
		       </div>
		   </div>
           <!-- 실시간 바 -->
           <div class="sub-content">
               <div class="sub-wrap">
                   <div class="sub-container">
                       <div>
                           <div class="Ranking">
                               <h1
                                   class="Rangking_Title"
                                   data-aos="fade-left"
                                   data-aos-anchor="top-top"
                                   data-aos-delay="150"
                               >
                                   실시간 랭킹
                               </h1>
                               <br />
                               <div class="Ranking_Article">
                                   <div
                                       class="Ranking_Content"
                                       data-aos="fade-left"
                                       data-aos-anchor="top-top"
                                       data-aos-delay="250"
                                   >
                                       <div class="num">1위</div>
                                       <div class="Ranking_Text">
                                           <div class="Ranking_Num"><b>수진님 담주에는 오나?</b></div>
                                       </div>
                                   </div>
                               </div>
                               <br />

                               <div class="Ranking_Article">
                                   <div
                                       class="Ranking_Content"
                                       data-aos="fade-left"
                                       data-aos-anchor="top-top"
                                       data-aos-delay="350"
                                   >
                                       <div class="num">2위</div>
                                       <div class="Ranking_Text">
                                           <div class="Ranking_Num"><b>서현역 칼부림</b></div>
                                       </div>
                                   </div>
                               </div>
                               <br />

                               <div class="Ranking_Article">
                                   <div
                                       class="Ranking_Content"
                                       data-aos="fade-left"
                                       data-aos-anchor="top-top"
                                       data-aos-delay="450"
                                   >
                                       <div class="num">3위</div>
                                       <div class="Ranking_Text">
                                           <div class="Ranking_Num"><b>유토피아 콘크리트</b></div>
                                       </div>
                                   </div>
                               </div>
                               <br />

                               <div class="Ranking_Article">
                                   <div
                                       class="Ranking_Content"
                                       data-aos="fade-left"
                                       data-aos-anchor="top-top"
                                       data-aos-delay="550"
                                   >
                                       <div class="num">4위</div>
                                       <div class="Ranking_Text">
                                           <div class="Ranking_Num"><b>김소연 다리 그만떨어</b></div>
                                       </div>
                                   </div>
                               </div>
                               <br />

                               <div class="Ranking_Article">
                                   <div
                                       class="Ranking_Content"
                                       data-aos="fade-left"
                                       data-aos-anchor="top-top"
                                       data-aos-delay="650"
                                   >
                                       <div class="num">5위</div>
                                       <div class="Ranking_Text">
                                           <div class="Ranking_Num"><b>집에 가고싶다..</b></div>
                                       </div>
                                   </div>
                               </div>
                               <br />

                               <div class="Ranking_Article">
                                   <div
                                       class="Ranking_Content"
                                       data-aos="fade-left"
                                       data-aos-anchor="top-top"
                                       data-aos-delay="750"
                                   >
                                       <div class="num">6위</div>
                                       <div class="Ranking_Text">
                                           <div class="Ranking_Num"><b>박보영 졸귀</b></div>
                                       </div>
                                   </div>
                               </div>
                               <br />

                               <div class="Ranking_Article">
                                   <div
                                       class="Ranking_Content"
                                       data-aos="fade-left"
                                       data-aos-anchor="top-top"
                                       data-aos-delay="850"
                                   >
                                       <div class="num">7위</div>
                                       <div class="Ranking_Text">
                                           <div class="Ranking_Num"><b>마이페이지</b></div>
                                       </div>
                                   </div>
                               </div>
                               <br />

                               <div class="Ranking_Article">
                                   <div
                                       class="Ranking_Content"
                                       data-aos="fade-left"
                                       data-aos-anchor="top-top"
                                       data-aos-delay="950"
                                   >
                                       <div class="num">8위</div>
                                       <div class="Ranking_Text">
                                           <div class="Ranking_Num"><b>오창정 프신..</b></div>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>

  
   <script>
       function toLogin() {
           location.href = '${contextPath}/logout.me';
       }
       function follow() {
           location.href = 'following.html';
       }
       function myEdit() {
           location.href = '${contextPath}/MyEdit.me';
       }
       function myFeedEdit() {
           location.href = '${contextPath}/MyFeedEnroll.me';
       }
       AOS.init();
       $(document).ready(function () {
           const choice1 = $('.list1');
           const choice2 = $('.list2');
           const btn1 = $('#pro-btn3');
           choice1.removeClass('choice1');
           choice2.addClass('choice2');
           btn1.addClass('change');
       });
       
       function selected1() {
            const btn1 = $('#pro-btn3');
            const btn2 = $('#pro-btn4');
            const choice1 = $('.list1');
            const choice2 = $('.list2');

            btn1.addClass('change');
            btn2.removeClass('change');
            choice1.removeClass('choice1');
            choice2.addClass('choice2');
       }
       function selected2() {
            const btn1 = $('#pro-btn3');
            const btn2 = $('#pro-btn4');
            const choice1 = $('.list1');
            const choice2 = $('.list2');

            btn2.addClass('change');
            btn1.removeClass('change');
            choice1.addClass('choice1');
            choice2.removeClass('choice2');
       }
      

   </script>
   <script>
		const  slick2 = () => {
   	    	jb1("#MyDetailFeed .slick-dots li").eq(0).click();
   		}    
	   function feedNo(e , no){
		   //e.stopPropagation();
		   console.log(no);
	       const imgNo = no;
	       jb1.ajax({
	           url: '${contextPath}/detail.myfeed',
	           data: { imgNo : imgNo },
	           success: function (result) {
	        	   console.log(result);
	               let html = "<div id='slick_feed'>";
	               
	           	   for(let img of result){
		           		html += "<div>"
							html += "<img src=${contextPath}"+img.filePath+"/"+img.changeName+">"
						html += "</div>"
	               }
	           		html += "</div>"
	           		
	           	   	jb1(".feed-img").html(html);
			       jb1('#slick_feed').slick({
			    	   	// Slick configuration options
			    	   	slidesToShow: 1,
			    	   	slidesToScroll: 1,
			    	   	arrows : true,
			    	   	dots:true
			    	   	// Add more options as needed
			    	 });
			       	 slick2();
	       	   }
	        });
	   }
   </script>
	<script>
		const  slick3 = () => {
   	    	jb1("#MyDetailFeed2 .slick-dots li").eq(0).click();
   		}    
	   function feedNo2(e , no){
		   //e.stopPropagation();
		   console.log(no);
	       const imgNo = no;
	       jb1.ajax({
	           url: '${contextPath}/detail.myfeed',
	           data: { imgNo : imgNo },
	           success: function (result) {
	        	   console.log(result);
	               let html = "<div id='slick_feed2'>";
	               
	           	   for(let img of result){
		           		html += "<div>"
							html += "<img src=${contextPath}"+img.filePath+"/"+img.changeName+">"
						html += "</div>"
	               }
	           		html += "</div>"
	           		
	           	   	jb1(".feed-img2").html(html);
			       jb1('#slick_feed2').slick({
			    	   	// Slick configuration options
			    	   	slidesToShow: 1,
			    	   	slidesToScroll: 1,
			    	   	arrows : true,
			    	   	dots:true
			    	   	// Add more options as needed
			    	 });
			       	 slick3();
	       	   }
	        });
	   }
   </script>
</body>
</html>