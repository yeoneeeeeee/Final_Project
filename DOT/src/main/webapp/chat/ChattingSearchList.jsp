<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${contextPath}/resources/css/Dot_Chatting.css" />

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
										<span>${msgList.enrollDate }</span>
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

<script>
$(".chat-list").find('.deleteCheck').hide();

$(".joinChatRoom").on("click", (e) => { // 클래스 선택자 사용
    const focus = $(e.currentTarget);
    const chatRoomNo = focus.find("[name=chatRoom]").val();

    console.log(chatRoomNo);

    $.ajax({
        url: "/dot/chat/joinChatRoom",
        data: { chatRoomNo: chatRoomNo },
        method: "post",
        success: (data) => {
        	
        	$(".chat-room-wrap").empty();
            $(".chat-room-wrap").html(data);
        },
        error: (error) => {
            console.error(error);
        }
    });
});
</script>
