<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %> <!-- Stomp="sockjs-client" -->
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
        
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
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
				                    <span>ACTIVITY</span>
				                </div>
				                <div class="alarm-content-box">
				                	<c:forEach var="alarm" items="${alarmlist}">
				                    <div class="profile-icon" onclick="location.href='${contextPath}/YourFeed.me?uno=${alarm.userNo}'">
				                    	 <label>
				                            <a>
				                                <img src="${contextPath}/${alarm.filePath}/${alarm.changeName}">
				                            </a>
				                        </label>
				                        <div class="alarm-contents">
				                            <div class="alarm-user">
				                            	${alarm.userNick}
				                            </div>
				                            <div class="alarm-content">
				                                ${alarm.alarmContent}
				                            </div>
				                        </div> 
				                    </div>
				                    </c:forEach>
				                </div>               
				            </div>
				        </div>
				    </div>
            </div>
                
                
                <div class="sub-content">
                    <div class="sub-wrap">
                        <div class="sub-container">
                            <div class="sub-recommand">
                                
                            </div>
                        </div>
                    </div>
                </div>
   	</div>
		
</body>

</html>