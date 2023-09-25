<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="stylesheet" href="${contextPath}/resources/css/Dot_Chatting.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- <script type="text/javascript" src="/resources/js/Dot_ChatSlick.js"></script> -->

<title>Dot.</title>
</head>

<body>
	<div class="wrap">
		<jsp:include page="../common/Header.jsp" />
		<div class="contents">
			<jsp:include page="../common/Sidebar.jsp" />
			<div class="chat-list-wrap">
				<div class="chat-wrap">
					<div class="chat-header">
						<span>Message</span> <input type="checkbox" id="chat-search" />
						<form>
							<label for="chat-search"> 
								<input id="input-search-chat" name="keyword" type="search" placeholder="검색할 항목을 입력해주세요." /> 
								<label for="input-search-chat"></label>
							</label>
						</form>
						<span class="material-symbols-outlined search_list"> search
						</span> <span class="material-symbols-outlined add_box toggle-button">
							add </span>
						<div class="more-options">
							<div>
								<dl>
									<dt id="addBtn" data-bs-toggle="modal"
										data-bs-target="#createChatRoom">
										<span class="material-symbols-outlined"> chat_add_on </span> <span>채팅방
											생성</span>
									</dt>
									<dt id="deleteBtn">
										<span class="material-symbols-outlined"> logout </span> <span>채팅방
											나가기</span>
									</dt>
								</dl>
							</div>
						</div>
					</div>
					<form action="${contextPath }/chat/exitChatRoom" method="post">
						<div class="chat-list">
							<c:choose>
								<c:when test="${empty chatRoomList }">
									<div class="empty-list-info">
										<div class="empty-list">
											<span>조회된 채팅방이 없습니다.</span>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<dl>
										<c:forEach var="chatRoom" items="${chatRoomList }">
											<dt class="joinChatRoom joinChatRoom_${chatRoom.chatRoomNo }">
												<input type="hidden" name="chatRoom" value="${chatRoom.chatRoomNo }">
												<div class="list-info-wrap">
													<div class="list-info">
														<input type="checkbox" name="deleteRoom" value="${chatRoom.chatRoomNo }" class="deleteCheck"/>
														<div class="userCount">
														<c:forEach var="chatImage" items="${chatRoomImage }" varStatus="loop">
															<c:if test="${chatRoom.chatRoomNo == chatImage.chatRoomNo }">
																<c:if test="${loop.index == 0 }">
																	<img src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																</c:if>
																<c:if test="${loop.index == 1 }">
																	<img src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																</c:if>
																<c:if test="${loop.index >= 2 }">
																	<img src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																</c:if>
															</c:if>
														</c:forEach>
														</div>
														<div class="list-text">
															<div class="list-top">
																<div>
																	<span>${chatRoom.title }</span>
																	<span> ${chatRoom.cnt }</span>
																</div>
																<c:forEach var="msgList" items="${chatMessageList }">
																<c:if test="${chatRoom.chatRoomNo == msgList.chatRoomNo }">
																	<c:if test="${msgList.enrollDate eq null }">
																		<span></span>
																	</c:if>
																	<c:if test="${msgList.enrollDate ne null }">
																		<span>${msgList.enrollDate }</span>
																	</c:if>  
																</c:if>
																</c:forEach>
															</div>
															<div class="list-bot">
															<c:forEach var="msgList" items="${chatMessageList }">
																<c:if test="${chatRoom.chatRoomNo == msgList.chatRoomNo }">
																	<c:if test="${msgList.feedNo != 0 }">
																		<span>게시물을 공유했습니다.</span>
																	</c:if>
																	<c:if test="${msgList.feedNo == 0 }">
																		<span>${msgList.message }</span>
																	</c:if>
																</c:if>
															</c:forEach>
															</div>
														</div>
													</div>
												</div>
											</dt>
										</c:forEach>
									</dl>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>
			</div>
			<div class="chat-room-wrap">
				<div class="room-wrap">
				
				</div>
			</div>
			<div class="sub-content"></div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="createChatRoom" tabindex="-1"
		aria-labelledby="createChatRoomLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content create-room-content">
				<div class="modal-header create-room-header">
					<h5 class="modal-title" id="createChatRoomLabel">채팅방 생성하기</h5>
					<form>
						<input type="search" class="friends-search" id="friends-search"
							placeholder="검색할 팔로워를 입력하세요." />
					</form>
				</div>
				<form id="openChatRoomForm"
					action="${contextPath }/chat/openChatRoom" method="post">
					<div class="modal-body create-room-body">
						<span>팔로우</span>
						<div class="follower-list">
							<div>
								<c:if test="${empty follow }">
									<div class="empty-follow-info">
										<div class="empty-follow">
											<span>존재하는 팔로우가 없습니다.</span>
										</div>
									</div>
								</c:if>
								<dl class="output-list">
									<c:if test="${!empty follow }">
										<c:forEach var="f" items="${follow }">
											<dt>
												<div>
													<img src="${contextPath}/${f.filePath}/${f.changeName}" /> <label
														for="addFriend1">${f.userNick }</label>
												</div>
												<input type="checkbox" id="addFriend1" name="userNo" value="${f.userNo }" />
											</dt>
										</c:forEach>
									</c:if>
								</dl>
							</div>
						</div>
					</div>
					<div class="modal-footer create-room-body">
						<button type="button" class="create-close" data-bs-dismiss="modal">나가기</button>
						<button type="submit" class="create-add">생성하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	<script>
	let userNo;
	let userNick;
	let chatRoomNo;
	let contextPath;
	let feedNo;
	let chatRoomStompClient;
	
	const socketChatMessage = new SockJS('http://localhost:8083${contextPath}/websocket');
	const stompClientChatMessage = Stomp.over(socketChatMessage);
	    
	stompClient.connect({}, frame => {
	    console.log('Connected: ' + frame);
	    //반복문돌리면서 채팅방모두 구독
	    
	    stompClient.subscribe('/topic/chatList', (message) => {
	    	
	    	console.log(message);
	    	console.log(chatRoomNo);
	    
	        const chatMessage = JSON.parse(message.body);
	        
	        const chatRoom = document.querySelector(".joinChatRoom_" + chatMessage.chatRoomNo);
	        
	        chatRoom.classList.add('scale-up-center');
	        
	        console.log(chatRoom);
	        
			const listBot = chatRoom.querySelector(".list-bot>span");
			
			console.log(chatMessage.feedNo)
			
			if(chatMessage.message.includes('/')) {
				if(chatMessage.feedNo == 0) {
					listBot.textContent = "사진을 보냈습니다.";
				} else {
					listBot.textContent = "게시물을 공유했습니다.";
				}
			} else {
				listBot.textContent = chatMessage.message;
			}
			
			const listDate = chatRoom.querySelector(".list-top>span");
			listDate.textContent = currentTime(); 
			
			
			function formatTime(date) {
			    const now = new Date();
			    const diff = now - date; // 현재 시간과 주어진 시간 사이의 차이 (밀리초 단위)

			    // 하루를 넘기지 않은 경우 "몇 시간 전"으로 표시
			    if (diff < 24 * 60 * 60 * 1000) {
			        const hours = Math.floor(diff / (60 * 60 * 1000));
			        return hours > 0 ? `${hours} 시간 전` : "방금 전";
			    } else {
			        // 하루 이상인 경우 "몇월 몇일"로 표시
			        const month = date.getMonth() + 1;
			        const day = date.getDate();
			        return `${month}월 ${day}일`;
			    }
			}

			function currentTime() {
			    const now = new Date();
			    return formatTime(now);
			}
			
	        
	        chatRoom.parentNode.insertBefore(chatRoom, chatRoom.parentNode.firstChild);
	    });
	    
	});
	</script>



<script src="${contextPath}/resources/js/Dot_Chatting.js"></script>

</body>

</html>