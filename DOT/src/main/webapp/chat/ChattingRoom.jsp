<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<div class="room-wrap">
	<div class="room-header">
		<div class="header-wrap">
			<div class="userCount">
				<c:forEach var="chatImage" items="${chatRoomImage }"
					varStatus="loop">
					<img
						src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
				</c:forEach>
			</div>
			<span class="user-id"> <a>${map.joinRoom[0].title}</a> <input
				type="hidden" name="chatRoomNo"
				value="${map.joinRoom[0].chatRoomNo }" />
			</span>
		</div>
	</div>
	<div class="room-body">
		<ul class="display-chatting">
			<c:if test="${empty map.msgList }">
				<span></span>
			</c:if>
			<c:forEach var="msg" items="${map.msgList }">
				<c:if test="${msg.userNo == loginUser.userNo }">
					<c:if test="${not fn:contains(msg.message, '/') }">
						<li class="myChat">
							<span class="chatDate">${msg.enrollDate }</span>
							<p class="chat">${msg.message }</p>
						</li>
					</c:if>
					<c:if test="${fn:contains(msg.message, '/') }">
						<li class="myChat">
							<span class="chatDate">${msg.enrollDate }</span> 
							<c:if test="${msg.feedNo != 0 }">
							<div>
								<p class="chat">${msg.userNick }님이 게시물을 공유했습니다.</p>
 									<!-- data-bs-toggle="modal" data-bs-target="#feedDetail" -->
								<img class="chatImg" 
									data-feedNo="${msg.feedNo }" 
									src="${contextPath }/${msg.message}" />
							</div>
							</c:if>
							<c:if test="${msg.feedNo == 0 }">
								<img class="chatImg" src="${contextPath }/${msg.message}" />
							</c:if>
						</li>
					</c:if>
				</c:if>
				<c:if test="${msg.userNo ne loginUser.userNo }">
					<c:if test="${not fn:contains(msg.message, '/') }">
						<li class="otherChat">
							<div>
								<img class="img" src="${contextPath}/${msg.filePath }/${msg.changeName}" /> 
								<b>${msg.userNick }</b>
							</div>
							<div>
								<p class="chat">${msg.message }</p>
								<span class="chatDate">${msg.enrollDate }</span>
							</div>
						</li>
					</c:if>
					<c:if test="${fn:contains(msg.message, '/') }">
						<li class="otherChat">
							<div>
								<img class="img" src="${contextPath}/${msg.filePath }/${msg.changeName}" /> 
								<b>${msg.userNick }</b>
							</div>
							<div>
								<div>
									<c:if test="${msg.feedNo != 0 }">
										<p class="chat">${msg.userNick }님이 게시물을 공유했습니다.</p>
										<img class="chatImg" 
											data-feedNo="${msg.feedNo }" 
											src="${contextPath }/${msg.message}" />
									</c:if>
									<c:if test="${msg.feedNo == 0 }">
										<img class="chatImg" src="${contextPath }/${msg.message}" />
									</c:if>
								</div>
								<span class="chatDate">${msg.enrollDate }</span>
							</div>
						</li>
					</c:if>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div class="room-footer">
		<div class="chat-input">
			<textarea id="inputChatting" placeholder="전송할 메세지를 입력하세요."></textarea>
		</div>
		<div class="chat-tool">
			<form id="sendImg" enctype="multipart/form-data">
				<input id="image" name="sendImg" type="file" class="upload-file" />
				<label for="image" class="material-symbols-outlined add_box">
					attach_file </label>
			</form>
			<button id="chatSend" value="${map.joinRoom[0].chatRoomNo }">전송</button>
		</div>
	</div>
</div>

	<!-- FeedDetail Modal -->
	<div class="modal fade" id="feedDetail" tabindex="-1"
		aria-bs-labelledby="feedDetailLabel" aria-bs-hidden="true">
		<jsp:include page="../chat/ChattingShareFeed.jsp" />
	</div>
 
<script>
	userNo = "${loginUser.userNo}";
	userNick = "${loginUser.userNick}";
	chatRoomNo = "${map.joinRoom[0].chatRoomNo}";
	contextPath = "${contextPath}";
	feedNo = 0;
	
	console.log(userNo, userNick, chatRoomNo);
	
	$(function(e) {
		if(chatRoomStompClient){
			chatRoomStompClient.disconnect();	
		}
	    const socketChatRoom = new SockJS('http://localhost:8083${contextPath}/websocket');
	    chatRoomStompClient = Stomp.over(socketChatRoom);
		
	    
	    chatRoomStompClient.connect({}, () => {
	        // 한 번만 구독을 설정합니다.
	        chatRoomStompClient.subscribe('/topic/chat', (message) => {
	            const chatMessage = JSON.parse(message.body);

	            console.log(chatMessage.feedNo);
	            
	            console.log("웹소켓 갔다옴" + chatMessage);
	            
	            
	            function handleChatMessage(chatMessage) {
	    	
			        const li = document.createElement("li");
			        const p = document.createElement("p");
			        const div = document.createElement("div");
			        const div1 = document.createElement("div");
			        const div2 = document.createElement("div");
			        const img = document.createElement("img");
			        const img1 = document.createElement("img");
			        const b = document.createElement("b");
			        const span = document.createElement("span");
			        
			        p.classList.add("chat");
			        p.innerHTML = chatMessage.message.replace(/\\n/gm, "<br/>");
			        
			        span.classList.add("chatDate");
			        span.innerText = currentTime();
		
			        
			        if(chatMessage.message.includes("/")) {
			        	
			        	if(chatMessage.userNo == userNo) {
			        		li.classList.add("myChat");
				            li.append(span);
				            img.classList.add("chatImg");
				        	img.src = contextPath + "/" + chatMessage.message; // 이미지 경로 설정
				        	if(feedNo != 0) {
				        		img.setAttribute('name', 'feedNo');
				        		img.setAttribute('data-feedNo', chatMessage.feedNo);
				        		p.innerText = chatMessage.userNick + "님이 게시물을 공유했습니다.";
				        		div1.append(img, p)
								li.append(span, div1)				        		
				        	} else {
					            li.append(span, img);
				        	}
				        	
			        	} else {
			        		
							li.classList.add("otherChat");
				        	
				        	img1.classList.add("img");
				        	img1.src = contextPath + "/" + chatMessage.filePath + "/" + chatMessage.changeName; // 이미지 경로 설정
				        	b.textContent = chatMessage.userNick; // 사용자 닉네임 설정
				        	div1.append(img1, b);
				        	
				        	// 두 번째 div 엘리먼트 생성 및 추가
				        	img.classList.add("chatImg");
				        	img.setAttribute("data-feedNo", chatMessage.feedNo);
				        	img.src = contextPath + "/" + chatMessage.message; // 이미지 경로 설정
				        	//span.classList.add("chatDate");
				        	//span.textContent = chatMessage.enrollDate; // 날짜 설정\
				        	p.innerText = chatMessage.userNick + "님이 게시물을 공유했습니다.";
				        	div.append(p, img);
				        	div2.append(div, span);
	
				        	// li 엘리먼트에 div1과 div2 추가
				        	li.appendChild(div1);
				        	li.appendChild(div2);
			        		
			        	}
			        	
			        } else {
			        	
				        if (chatMessage.userNo == userNo) {
				            li.classList.add("myChat");
				            li.append(div1);
				            li.append(span, p);
				            
				        } else {
				        	li.classList.add("otherChat");
				        	
				        	img.classList.add("img");
				        	img.src = contextPath + "/" + chatMessage.filePath + "/" + chatMessage.changeName; // 이미지 경로 설정
				        	b.textContent = chatMessage.userNick; // 사용자 닉네임 설정
				        	div1.append(img, b);
	
				        	// 두 번째 div 엘리먼트 생성 및 추가
				        	p.classList.add("chat");
				        	p.textContent = chatMessage.message; // 메시지 설정
				        	//span.classList.add("chatDate");
				        	//span.textContent = chatMessage.enrollDate; // 날짜 설정
				        	div2.append(p, span);
	
				        	// li 엘리먼트에 div1과 div2 추가
				        	li.appendChild(div1);
				        	li.appendChild(div2);
				        }
			        }
		
			        const display = document.getElementsByClassName("display-chatting")[0];
			        
			        display.append(li);
			        display.scrollTop = display.scrollHeight;
			        inputChatting.value = "";
			    }
		
			    function currentTime() {
			        const now = new Date();
			        const hour = now.getHours();
			        const minute = now.getMinutes();
			        const ampm = hour < 12 ? '오전' : '오후';
			        
			        const formattedHour = hour % 12 === 0 ? 12 : hour % 12; // 0시는 12시로 표시
			        const formattedMinute = addZero(minute);

			        return `\${ampm} \${formattedHour}시 \${formattedMinute}분`;
			    }
			    
		
			    function addZero(time) {
			        return time < 10 ? "0" + time : time;
			    }
			    
			    if(chatRoomNo == chatMessage.chatRoomNo) {
				    handleChatMessage(chatMessage);
			    }
			    
			    $(".chatImg").on('click',(e) => {
			    	
			    	const fd = $(e.currentTarget);
					let feedNo = fd[0].dataset.feedno;

					if(feedNo != undefined) {
						console.log(feedNo);
						
						$.ajax({
							url : '/dot/chat/shareFeed',
							data : {feedNo : feedNo},
							method : 'post',
							success : (data) => {
								$("#feedDetail").empty();
								$("#feedDetail").html(data);
								
								if($("#feedDetail").find('.feed-img').children().length != 1) {
									
									$("#feedDetail").find('.feed-img').slick({
									    slidesToShow: 1,
									    slidesToScroll: 1,
									    arrows : true,
									    dots:true
									  });
									$("#feedDetail").find('.slick-dots').children()[0].click();
								}
								
								$("#feedDetail").modal('show');
							},
							error : console.log
						})
					}
				})
			    
			    
	        });
	        

	        document.getElementById("chatSend").addEventListener('click', sendMessage);

	        document.getElementById("inputChatting").addEventListener('keydown', event => {
	            if (event.keyCode === 13) {
	                event.preventDefault();
	                sendMessage();
	            }
	        });
	        
			$("#image").on("change", function () {
		        sendData();
		    });

	        function sendMessage() {
	            const inputChatting = document.getElementById("inputChatting");

	            if (inputChatting.value.trim().length == 0) {
	                alert("입력하신 채팅이 없습니다.");
	                inputChatting.value = "";
	                inputChatrring.focus();
	            } else {
	                const chatMessage = {
	                    "userNo" : userNo,
	                    "userNick" : userNick,
	                    "chatRoomNo" : chatRoomNo,
	                    "message" : inputChatting.value
	                }
	                // 메시지 보내기
	                chatRoomStompClient.send('/app/chatRoomList/' + chatRoomNo, {}, JSON.stringify(chatMessage));
	            }
	        }
	        
		    function sendData() {
		        let formData = new FormData($("#sendImg")[0]);
		        
				formData.append("chatRoomNo" , chatRoomNo)
				formData.append("sendImg" , $("#image")[0].files[0]);
		        
		        console.log(formData.get("chatRoomNo") , $("#image")[0].files[0])
		        
		        let filePath = $("#image")[0].files[0].name;
		        
		        console.log(filePath)
		        
		        const chatMessage = {
	                    "userNo" : userNo,
	                    "userNick" : userNick,
	                    "chatRoomNo" : chatRoomNo,
	                    "message" : inputChatting.value,
	                    "filePath" : filePath,
	                    "feedNo" : 0
	                }
		        
		        console.log(chatMessage);
		        
		       $.ajax({
		            type: "POST",
		            url: "/dot/chat/sendImgFile",
		            data: formData,
		            processData: false,
		            contentType: false,
		            success : () => {
			           	chatRoomStompClient.send('/app/chatRoomList/' + chatRoomNo, {}, JSON.stringify(chatMessage));
		            }
		        });
		    }
	    });
	    
	    $(".chatImg").on('click',(e) => {
	    	
	    	const fd = $(e.currentTarget);
			let feedNo = fd[0].dataset.feedno;

			if(feedNo != undefined) {
				console.log(feedNo);
				
				$.ajax({
					url : '/dot/chat/shareFeed',
					data : {feedNo : feedNo},
					method : 'post',
					success : (data) => {
						$("#feedDetail").empty();
						$("#feedDetail").html(data);
						
						if($("#feedDetail").find('.feed-img').children().length != 1) {
							
							$("#feedDetail").find('.feed-img').slick({
							    slidesToShow: 1,
							    slidesToScroll: 1,
							    arrows : true,
							    dots:true
							  });
							$("#feedDetail").find('.slick-dots').children()[0].click();
						}
						
						$("#feedDetail").modal('show');
					},
					error : console.log
				})
			}
		})
	});
</script>


<script src="${contextPath}/resources/js/Dot_SendChat.js"></script>




