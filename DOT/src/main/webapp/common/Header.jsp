<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="stylesheet" href="${contextPath}/resources/css/Dot_Headers.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    <script src="${contextPath}/resources/js/sidebar.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
   <!--  웹소켓 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <title>Dot.</title>
</head>

<body>
    <div class="header">
        <div class="logo">
            <a href="${contextPath}/mainFeed">
                <img src="${contextPath}/resources/images/dot_logo.png" />
            </a>
        </div>
        <div class="header-tools">
            <div class="search-tool">
                <input type="checkbox" id="search" />
                <label for="search">
                    <form action="${contextPath}/searchList.se" method="get">
                        <input type="text" class="search-input" name="keyword" placeholder="검색할 항목을 입력하세요" />
                        <input type="hidden" class="search-input" name="condition" value="feedHashtag" />
                        <button type="submit" style="display:none">Search</button>
                    </form>
                </label>
                <span class="material-symbols-outlined">
                    search
                </span>
            </div>

            <div class="alert-tool">
                <span class="material-symbols-outlined" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    notifications
                </span>
                <c:if test="${!alarmlist.isEmpty()}">
                	<p id="newAlarm1" style="background-color:red;"></p>
                </c:if>
                <c:if test="${alarmlist.isEmpty()}">
                	<p id="newAlarm2"></p>
                </c:if>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-xl" >
                        <div class="modal-content haeder-alarm follow-header main-header-alarm chat_alarm_modal">
                            <div class="modal-body modal-backgound" style="height: 30%; display:block">
                            	<div class="more-alarm23 more-alarm24"><a href="${contextPath}/Alarm.al">더 보기</a></div>
                                <div class="modal-box">
                                	<c:if test="${alarmlist.isEmpty()}">
                                		<div class="modal-profile-icon">
	                                        <div class="modal-alarm-contents">
	                                            <div class="modal-alarm-user">
	                                            	<span style="font-size:13px; color:gray; margin-left:28px; line-height:15;">현재 조회된 알람이 없습니다.</span>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:if>
                                	<c:if test="${!alarmlist.isEmpty()}">
	                                    <c:forEach var="alarm" items="${alarmlist}">
	                                    <div class="modal-profile-icon" onclick="alarm(event,${alarm.alarmNo},'${alarm.alarmType}');">
	                                        <label>
	                                            <a>
	                                                <img src="${contextPath}/${alarm.filePath}/${alarm.changeName}">
	                                            </a>
	                                        </label>
	                                        <div class="modal-alarm-contents">
	                                            <div class="modal-alarm-user">
	                                                ${alarm.userNick}
	                                                <span class="alarm-status">안읽음</span>
	                                            </div>
	                                            <div class="modal-alarm-content">
	                                                ${alarm.alarmContent}
	                                            </div>
	                                        </div>
	                                    </div>
	                                    </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
			    	function alarm(e,no,type){
			    		const type1 = type;
			    		const no1 = no;
			    		const p = $('#newAlarm');
			    		console.log(no1,type1);
			    		if(type1 == 'F'){
			    			location.href = '${contextPath}/otherperson.op?ano='+no1;
			    		}else if(type == 'L'){
			    			location.href = '${contextPath}/myperson.op?ano='+no1;
			    		}else{
			    			location.href = '${contextPath}/myMessage.ms?ano='+no1;	
			    		}
			    	}
			    </script>
                <!-- 모달 끝 -->
            </div>
            <div class="dm-tool">
                <span class="material-symbols-outlined" onclick="location.href='${contextPath}/chat/chatRoomList';">
                    mail
                </span>
            </div>

            <div class="profile">
            	<c:if test="${loginUser.userId ne 'admin'}">
	                <div class="profile-img" onclick="location.href='${contextPath}/MyFeed.me';">
	                    <img src="${contextPath}/${profileImg.filePath}/${profileImg.changeName}" />
	                </div>
	                <div class="profile-name" onclick="location.href='${contextPath}/MyFeed.me';">
	                    <p>${loginUser.userNick}</p>
	                </div>
                </c:if>
                <c:if test="${loginUser.userId eq 'admin'}">
                	<div class="profile-img" onclick="location.href='${contextPath}/adminMain';">
	                    <img src="${contextPath}/${profileImg.filePath}/${profileImg.changeName}" />
	                </div>
	                <div class="profile-name" onclick="location.href='${contextPath}/adminMain';">
	                    <p class="admin-header">${loginUser.userNick}</p>
	                </div>
                </c:if>
            </div>
        </div>
    </div>

    <script>
    const socketHeader = new SockJS("http://localhost:8083${contextPath}/websocket"); //URL에 대한 WebSocket 연결을 설정
    const stompAlram = Stomp.over(socketHeader); //WebSocket을 통해 Stomp 클라이언트를 생성
    stompAlram.connect( {} , () => {
        console.log('연결되었어요2');
        stompAlram.subscribe('/topic/updateFollowStatus', function(message) {
        	var message1 = JSON.parse(message.body);
        	const alarmlist1 = message1.alarmList;
        	const userNo = message1.userNo;
        	const loginUser = "${loginUser.userNo}";
        	const div = $('.modal-box');

        	let value = "";
        	if(loginUser == userNo){
        		console.log("WansChatIF문팔로우",loginUser,userNo);
        		div.empty();
	        	for (let i of alarmlist1) {
	      	       value += "<div class='modal-profile-icon' onclick=alarm(event,"+ i.alarmNo + "," + "'"+i.alarmType+"'"+")>"
	      	       value += "<label>"
	      	       value +=  "<a>"
	   	    	   value += "<img src=${contextPath}/"+i.filePath+"/"+i.changeName+">"
	   	    	   value += "</a>"
	    		   value += "</label>"
	   			   value += "<div class='modal-alarm-contents'>"
				   value += "<div class='modal-alarm-user'>"
				   value += i.userNick
				   value += "<span class='alarm-status'>안읽음</span>"
				   value += "</div>"
				   value += "<div class='modal-alarm-content'>"
				   value += i.alarmContent
				   value += "</div>"
				   value += "</div>"
				   value += "</div>"
	        	}
	        	div.append(value);
        		$('#newAlarm2').css('background-color','red');
        	}
        	
        	console.log('ajax',alarmlist1);
        	 $.ajax({
        	   type: "POST",
  	           url: '${contextPath}/upToDate',
	  	       data: {alarmlist1 : JSON.stringify(alarmlist1), loginUserNo : loginUser},
  	           success: function (result) {
  	        	   console.log(result);
  	        	}
        	 });
        });
        
         stompAlram.subscribe('/topic/updateLikeStatus', function(message) {
        	var message1 = JSON.parse(message.body);
        	var acceptUser = message1.userNo;
        	const loginUser = "${loginUser.userNo}";
        	const alarmlist1 = message1.alarmList;
        	const div = $('.modal-box');
        	let value = "";
        	if(loginUser == acceptUser){
        		console.log("WansChatIF문좋아요",loginUser,acceptUser);
        		div.empty();
	        	for (let i of alarmlist1) {
	      	       value += "<div class='modal-profile-icon' onclick=alarm(event,"+ i.alarmNo + "," + "'"+i.alarmType+"'"+")>"
	      	       value += "<label>"
	      	       value +=  "<a>"
	   	    	   value += "<img src=${contextPath}/"+i.filePath+"/"+i.changeName+">"
	   	    	   value += "</a>"
	    		   value += "</label>"
	   			   value += "<div class='modal-alarm-contents'>"
				   value += "<div class='modal-alarm-user'>"
				   value += i.userNick
				   value += "<span class='alarm-status'>안읽음</span>"
				   value += "</div>"
				   value += "<div class='modal-alarm-content'>"
				   value += i.alarmContent
				   value += "</div>"
				   value += "</div>"
				   value += "</div>"
	        	}
	        	div.append(value);
        		$('#newAlarm2').css('background-color','red');
        	}
        	
        	 $.ajax({
          	   type: "POST",
    	           url: '${contextPath}/upToDate',
  	  	       data: {alarmlist1 : JSON.stringify(alarmlist1), loginUserNo : loginUser},
    	           success: function (result) {
    	        	   console.log(result);
    	        	}
          	 });
         });
         
         stompAlram.subscribe('/topic/updateAlarm', function(message) {
        	 	var message1 = JSON.parse(message.body);
         		var acceptUser1 = message1.userNo;
         		const loginUser1 = "${loginUser.userNo}";
            	const alarmlist1 = message1.alarmList;
            	console.log("WansChat",acceptUser1);
            	console.log("WansChat",loginUser1);
            	console.log("WansChat",alarmlist1);
            	const div = $('.modal-box');
            	let value = "";
            	if(loginUser1 == acceptUser1){
            		console.log("WansChatIF문",loginUser1,acceptUser1);
            		div.empty();
    	        	for (let i of alarmlist1) {
    	      	       value += "<div class='modal-profile-icon' onclick=alarm(event,"+ i.alarmNo + "," + "'"+i.alarmType+"'"+")>"
    	      	       value += "<label>"
    	      	       value +=  "<a>"
    	   	    	   value += "<img src=${contextPath}/"+i.filePath+"/"+i.changeName+">"
    	   	    	   value += "</a>"
    	    		   value += "</label>"
    	   			   value += "<div class='modal-alarm-contents'>"
    				   value += "<div class='modal-alarm-user'>"
    				   value += i.userNick
    				   value += "<span class='alarm-status'>안읽음</span>"
    				   value += "</div>"
    				   value += "<div class='modal-alarm-content'>"
    				   value += i.alarmContent
    				   value += "</div>"
    				   value += "</div>"
    				   value += "</div>"
    	        	}
    	        	div.append(value);
            		$('#newAlarm2').css('background-color','red');
            	}
            	
            	 $.ajax({
                	   type: "POST",
          	           url: '${contextPath}/upToDate',
        	  	       data: {alarmlist1 : JSON.stringify(alarmlist1), loginUserNo : loginUser1},
          	           success: function (result) {
          	        	   console.log("WanCahtAlarm",result);
          	        	}
                	 });
         });
    });
    </script>
</body>

</html>