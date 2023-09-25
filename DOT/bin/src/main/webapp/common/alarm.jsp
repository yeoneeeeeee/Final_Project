<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %><%-- Stomp="sockjs-client" --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/Dot_Alarm.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/sidebar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <!-- <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/app.js"></script> -->
    <title>alarm</title>
</head>

<body>
    <div class="wrap">
    	<jsp:include page="/common/Header.jsp" />
	        <div class="main-content">
	        	<jsp:include page="/common/Sidebar.jsp" />
	        		<div class="main-content">
				        <!-- Dot_Alarm -->
				        <div class="alarm-content-wrap">
				            <div class="alarm-title-wrap">
				                <div class="alarm-top">
				                    <a>
				                        <img class="back-icon" src="${contextPath}/resources/images/back-icon.png" >
				                    </a>
				                    <span>ACTIVITY</span>
				                </div>   
				                <div class="alarm-content-box">
				                    <div class="profile-icon">
				                        <label>
				                            <a>
				                                <img src="${contextPath}/resources/images/profile1.jpg">
				                            </a>
				                        </label>
				                        <div class="alarm-contents">
				                            <div class="alarm-user">
				                                im_Zzang_gu_da
				                            </div>
				                            <div class="alarm-content">
				                                울라울라 나는 울라춤을 좋아해 ♡
				                            </div>
				                        </div> 
				                    </div>
				                    <div class="profile-icon">
				                        <label>
				                            <a>
				                                <img src="${contextPath}/resources/images/profile2.jpg">
				                            </a>
				                        </label>
				                        <div class="alarm-contents">
				                            <div class="alarm-user">
				                                i_want_to_be_a_Gamani
				                            </div>
				                            <div class="alarm-content">
				                                나는야 진정한 가마니가 될꺼야!!
				                            </div>
				                        </div> 
				                    </div>
				                    <div class="profile-icon">
				                        <label>
				                            <a>
				                                <img src="${contextPath}/resources/images/profile3.jpg">
				                            </a>
				                        </label>
				                        <div class="alarm-contents">
				                            <div class="alarm-user">
				                                im_Danbi
				                            </div>
				                            <div class="alarm-content">
				                                단비는 내 맘대로 안되면 땡깡부릴거야>_0!!
				                            </div>
				                        </div> 
				                    </div>
				                    <div class="profile-icon">
				                        <label>
				                            <a>
				                                <img src="${contextPath}/resources/images/profile4.jpg">
				                            </a>
				                        </label>
				                        <div class="alarm-contents">
				                            <div class="alarm-user">
				                                im_so_Sad
				                            </div>
				                            <div class="alarm-content">
				                                희미한 과거만 바라보다 선명한 현재를 놓치지 말자
				                            </div>
				                        </div> 
				                    </div>
				                    <div class="profile-icon">
				                        <label>
				                            <a>
				                                <img src="${contextPath}/resources/images/profile5.jpg">
				                            </a>
				                        </label>
				                        <div class="alarm-contents">
				                            <div class="alarm-user">
				                                im_so_famous_sspongeBob
				                            </div>
				                            <div class="alarm-content">
				                                사실 집게리아 패티는 중국산이야 ㅠ.ㅠ
				                            </div>
				                        </div> 
				                    </div>
				                </div>               
				            </div>
				        </div>
				    </div>
                </div>
                
                <script>
             	// JavaScript 예시 (웹 브라우저에서 실행)
                /* const socket = new WebSocket("https://localhost:8083/websocket");
                const stompClient = Stomp.over(socket);

                stompClient.connect({}, () => {
                    stompClient.subscribe("/topic/notifications", (notification) => {
                        const message = JSON.parse(notification.body);
                        // 알림 처리 로직 구현
                    });
                });

                // 알림 전송 예시
                const notification = {
                    content: "새로운 알림이 도착했습니다!"
                };
                stompClient.send("/app/sendNotification", {}, JSON.stringify(notification)); */

                </script>
                
                <div class="sub-content">
                    <div class="sub-wrap">
                        <div class="sub-container">
                            <div class="sub-recommand">
                                <div class="sub-title">
                                    <span>회원님을 위한 추천</span>
                                </div>
                                <div class="result-content-area">
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/profile1.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                            <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/profile2.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/profile3.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/profile4.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/profile5.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/profile6.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/profile7.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/knotted-logo2.png">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/knotted_image.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                    <div class="result-content">
                                        <dl class="follow-list">
                                            <dt class="follow-img">      
                                                <img src="${contextPath}/resources/images/profile8.jpg">
                                            </dt> 
                                            <dt class="follow-id">
                                                <div class="user-id">
                                                    <span>xeesoxee
                                                    </span>
                                                </div>
                                                <div class="user-nickname">
                                                    <span>회원님을 팔로우합니다</span>
                                                </div>
                                            </dt>
                                            <dt class="follow-btn">
                                                <button>팔로우</button> 
                                            </dt>
                                        </dl>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
        	</div>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-body modal-backgound" style="height: 30%;">
                                <div class="modal-box">
                                    <div class="alarm-all-btn">
                                        <a>
                                            모두보기
                                        </a>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_Zzang_gu_da
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_Zzang_gu_da님이 회원님을 팔로우하기 시작했습니다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                i_want_to_be_a_Gamani
                                            </div>
                                            <div class="modal-alarm-content">
                                                i_want_to_be_a_Gamani님이 댓글을 남겼습니다 : "나는야 진정한 가마니가 될꺼야>_0!!"
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile3.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_Danbi
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_Danbi님이 회원님의 사진을 좋아요💗 눌렀습니다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile4.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_so_Sad
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_so_Sad님이 댓글을 남겼습니다 : "희미한 과거만 바라보다 선명한 현재를 놓치지 말자"
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile5.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_so_famous_spongeBob
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_so_famous_spongeBob님이 댓글을 남겼습니다 : "사실 집게리아 패티는 중국산이야 ㅠ.ㅠ"
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile6.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_so_4rory_ya
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_so_4rory_ya님이 회원님을 팔로우하기 시작했습니다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile7.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                Cute_cat
                                            </div>
                                            <div class="modal-alarm-content">
                                                Cute_cat님이 회원님의 사진을 좋아요💗 눌렀습니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 모달 끝 -->

</body>

</html>