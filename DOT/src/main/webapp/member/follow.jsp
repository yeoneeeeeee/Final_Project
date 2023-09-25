<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- alert 스타일 변경-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />

        <link rel="stylesheet" href="../resources/css/Following.css" />
	   <!--  웹소켓 -->
	   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <title>MyFeed</title>
        <style></style>
    </head>
    <body>
        <div class="wrap">
			<jsp:include page="../common/Header.jsp" />    
	    	<div class="contents">
	  		<jsp:include page="../common/Sidebar.jsp" />
                <!-- 메인 컨텐츠 마이페이지 -->
                <div class="main-content">
                    <div class="choice1 list1">
                        <div class="mypage-selectbox">
                        	<input type="hidden" value="${loginUser.userNo }" id="myUserNo"/>
                            <div class="selectbox">
                                <div class="follow-content">
                                    <div class="follow">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-person-heart"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"
                                            />
                                        </svg>
                                        <h6>팔로우</h6>
                                    </div>
                                    <div class="follower">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-person-hearts"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                fill-rule="evenodd"
                                                d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566ZM9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"
                                            />
                                        </svg>
                                        <h6>팔로워</h6>
                                    </div>
                                    <div class="follwer"></div>
                                </div>
                            </div>
                        </div>
                        <div class="follow-box">
                        <c:if test="${fw ne null }">
                        <c:forEach var ="i" items="${fw}">
                            <div class="result-content-area">
                                <div class="result-content">
                                    <dl class="follow-list">
                                        <div class="follow-img" onclick="location.href='${contextPath}/YourFeed.me?uno=${i.userNo}'">
                                            <img src='${contextPath}/${i.filePath}/${i.changeName}' onclick="location.href='${contextPath}/YourFeed.me?uno=${i.userNo}'"/>
                                        </div>
                                        <div class="follow-id" onclick="location.href='${contextPath}/YourFeed.me?uno=${i.userNo}'">
                                            <div class="user-id">
                                                <span>${i.userId}</span>
                                            </div>
                                            <div class="user-nickname">${i.userNick }</div>
                                        </div>
                                        <div class="follow-btn-box">
                                            <button class="follow-btn delete-follow" name ="userNo" value="${i.userNo }"><h6>삭제</h6></button>
                                        </div>
                                    </dl>
                                </div>
                            </div>
						</c:forEach>
						</c:if>
                        </div>
                    </div>
                    <script>
						$('.delete-follow').click(function() {
						    const clickedButton = $(this);
						    const userNo = clickedButton.val(); // 버튼의 value 값 가져오기
						    
						    $.ajax({
						        url: '${contextPath}/follow/followlist/unfollow',
						        data: { userNo: userNo },
						        method: 'post',
						        success(result) {
						            // AJAX 요청 성공 처리
						            console.log(result);
						
						            clickedButton.css("background-color", "white");
						            clickedButton.css("color", "black");
						
						            // 삭제 작업이 완료되면 페이지를 새로고침
						            location.reload();
						        },
						        error() {
						            console.log("AJAX error");
						        }
						    });
						});
                    </script>
                    <!-- 하단 선택 박스2-->
                    <div class="choice2 list2">
                        <div class="mypage-selectbox">
                            <div class="selectbox">
                                <div class="follow-content">
                                    <div class="follow">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-person-heart"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"
                                            />
                                        </svg>
                                        <h6>팔로우</h6>
                                    </div>
                                    <div class="follower">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-person-hearts"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                fill-rule="evenodd"
                                                d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566ZM9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"
                                            />
                                        </svg>
                                        <h6>팔로워</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="follow-box">
							<c:if test="${fr  ne null}">
							<c:forEach var ="c" items="${fr}">
	                            <div class="result-content-area">
	                                <div class="result-content">
	                                    <dl class="follow-list">
	                                        <div class="follow-img" onclick="location.href='${contextPath}/YourFeed.me?uno=${c.userNo}'">
	                                            <img src='${contextPath}/${c.filePath}/${c.changeName}'  onclick="location.href='${contextPath}/YourFeed.me?uno=${c.userNo}'"/>
	                                        </div>
	                                        <div class="follow-id" onclick="location.href='${contextPath}/YourFeed.me?uno=${c.userNo}'">
	                                            <div class="user-id">
	                                                <span>
			                                        	<div>${c.userNick}</div>	
													 </span>
	                                            </div>
	                                            <div class="user-nickname">
	                                                <span>회원님을 팔로우합니다</span>
	                                            </div>
	                                        </div>
	                                        <div class="follow-btn-box" id="follow-btn-box_${c.userNo}">
	                                        	<c:set var="checkf" value="0"/>
	                                        	<c:set var="loop_flag" value="false" />
												<c:forEach var ="j" items="${fw}">
													 <c:if test="${not loop_flag }">
														<c:if test="${j.userNo eq c.userNo}">
															<input type="hidden" value="${checkf = 1}"/>
															<c:set var="loop_flag" value="true" />
									                    </c:if>
			                            			    <c:if test="${j.userNo ne c.userNo}">
			                            			    	<input type="hidden" value="${checkf = 2}"/>
							                        	</c:if>
							                        </c:if>
		                            			</c:forEach>
		                            			<c:if test="${checkf == 1}">
								                     <button type="button" 
								                     		 class="follow-btn follower-btn2"
								                     		 id="f-bbtn1_${c.userNo}" 
								                     		 onclick="following(event,${c.userNo})"
								                     		 value="${c.userNo}">
								                     		 <h6>팔로잉</h6>
								                     </button>
								                </c:if>
								                <c:if test="${checkf == 2 || checkf == 0}">
						                        	<button type="button"
						                        			class="follow-btn follower-btn"
						                        			id="f-bbtn2_${c.userNo}"
						                        			onclick="follow2(event,${c.userNo})"
						                        			value="${c.userNo}">
						                        			<h6>팔로우</h6>
						                        	</button>
						                       	</c:if>
	                                        </div>
	                                    </dl>
	                                </div>
	                            </div>
                            </c:forEach>
	                       	</c:if>
                        </div>
                    </div>
                </div>
               <script>
               		function following(e,no){
               			console.log(no);
               			const clickedbtn = $('#f-bbtn1_'+no);
					    const userNo = clickedbtn.val();
					    const btn = $('#follow-btn-box_'+no);
					    $.ajax({
					        url: '${contextPath}/follow/followlist/unfollow',
					        data: { userNo: userNo },
					        method: 'post',
					        success(result) {
					            // AJAX 요청 성공 처리
					            value = "";
					            btn.empty();
					            //clickedbtn.css("display", "none");
					            console.log(result);
					            value += "<button type='button'	class='follow-btn follower-btn' id=f-bbtn2_"+no+" onclick=follow2(event,"+no+"); value="+no+">"
					            value += "<h6>팔로우</h6>"
					            value += "</button>"
					            btn.append(value)
               				}
					    });
               		}
               	 const socketFollow2 = new SockJS("http://localhost:8083${contextPath}/websocket"); //URL에 대한 WebSocket 연결을 설정
                 const stompFollow2 = Stomp.over(socketFollow2); //WebSocket을 통해 Stomp 클라이언트를 생성
                /*  stompFollow2.connect( {} , () => {
                     console.log('연결되었어요4');
                     
                 });	 */
                 function follow2(e,no){
            			const clickedbtn = $('#f-bbtn2_'+no);
					    const userNo = clickedbtn.val();
					    const btn = $('#follow-btn-box_'+no);
					    $.ajax({
					        url: '${contextPath}/follow/followlist/addfollow',
					        data: { userNo: userNo },
					        method: 'post',
					        success(result) {
					            // AJAX 요청 성공 처리
					            value = "";
					            console.log(result);
					            btn.empty();
					            //clickedbtn.css("display", "none");
					            value += "<button type='button'	class='follow-btn follower-btn2' id=f-bbtn1_"+no+" onclick=following(event,"+no+"); value="+no+">"
					            value += "<h6>팔로잉</h6>"
					            value += "</button>"
					            btn.append(value)
            				}
					    });
                     	const myNo = $('#myUserNo').val();
                     	console.log(userNo);
                     	console.log(myNo);
         		       stompClient.send("/app/updateFollowStatus", {}, JSON.stringify({
         		        	userNo: userNo,
         		        	userNo2 : myNo
         		        }));
            		}
				</script>
                <!-- 실시간 바 -->
                <div class="sub-content">
                    <div class="sub-wrap">
                        <div class="sub-container">
                            <div class="sub-recommand">
                                <div class="sub-title">
                                    <span>회원님을 위한 추천</span>
                                </div>
	                                <div class="result-content-area">
	                                  <c:if test="${rf ne null }">
                             		  <c:forEach var ="i" items="${rf}">
	                                    <div class="result-content" >
	                                        <dl class="follow-list">
	                                            <dt class="follow-img" onclick="location.href='${contextPath}/YourFeed.me?uno=${i.userNo}'">
	                                                <img src='${contextPath}/${i.filePath}/${i.changeName}' /> 
	                                            </dt>
	                                            <dt class="follow-id" onclick="location.href='${contextPath}/YourFeed.me?uno=${i.userNo}'">
	                                                <div class="user-id">
	                                                    <span>${i.userNick }</span>
	                                                </div>
	                                                <div class="user-nickname">
	                                                    <span>${i.userName }</span>
	                                                </div>
	                                            </dt>
	                                            <dt class="follow-btn1">
	                                                <button class="follow-btn10 follower-btn" id="f-btn1_${i.userNo}" onclick="follow(event,${i.userNo})" value="${i.userNo}"><h6>팔로우</h6></button>
	                                                <button class="follow-btn10 follower-btn" id="f-btn2_${i.userNo}" onclick="unfollow(event,${i.userNo})" value="${i.userNo}" style="display:none; color:white;"><h6>팔로잉</h6></button>
	                                            </dt>
	                                        </dl>
	                                    </div>
                              		  </c:forEach> 
                              		  </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
        
        $(".follow").click(()  => {
            $(".list1").css("display","block");
            $(".list2").css("display","none");
            location.reload();
        })
        $(".follower").click(() =>  {
            $(".list2").css("display","block");
            $(".list1").css("display","none");
        });
        
        //사이드바 친구추천
        function unfollow(e,no){
        	console.log(e,no);
        	const userNo = $('#f-btn2_'+no).val();
 			const clickbtn = $('#f-btn1_'+no);
 			const clickbtn2 = $('#f-btn2_'+no);
		    $.ajax({
		        url: '${contextPath}/follow/followlist/unfollow',
		        data: { userNo: userNo },
		        method: 'post',
		        success(result) {
		            // AJAX 요청 성공 처리
		        	clickbtn.css("display", "block");
                    clickbtn2.css("display","none");
		        }
		    });
        }
        </script>
        <script>
            function toMyFeed() {
                location.href = 'My_Feed.html';
            }
            $(document).ready(function () {
                const choice1 = $('.list1');
                const choice2 = $('.list2');
                const span1 = $('#pro-span3');
                choice1.removeClass('choice1');
                choice2.addClass('choice2');
                span1.css('color', 'black');
                
            });
            /* 선택 */
            function toggleFollow() {}
        </script>
        <script>
        const socketFollow = new SockJS("http://192.168.30.165:8083${contextPath}/websocket"); //URL에 대한 WebSocket 연결을 설정
        const stompFollow = Stomp.over(socketFollow); //WebSocket을 통해 Stomp 클라이언트를 생성
     /*    stompFollow.connect( {} , () => {
            console.log('연결되었어요3');
            
        }); */
            function follow(e,no){
            	const myNo = $('#myUserNo').val();
            	const userNo = $('#f-btn2_'+no).val();
     			const clickbtn = $('#f-btn1_'+no);
     			const clickbtn2 = $('#f-btn2_'+no);
   			    $.ajax({
   	                url: '${contextPath}/follow/followlist/addfollow',
   	                data: { userNo: userNo },
   	                method: 'post',
   	                success(result) {
   	                    // 처리 로직
   	                    clickbtn.css("display", "none");
   	                    clickbtn2.css("display","block");
   	                }
   	            });
     			console.log(userNo);
		        stompClient.send("/app/updateFollowStatus", {}, JSON.stringify({
		        	userNo: userNo,
		        	userNo2 : myNo
		        }));
		    };
        </script>
    </body>
</html>