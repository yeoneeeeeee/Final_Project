<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePwd</title>
 	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="${contextPath}/resources/css/changePwd.css" rel="stylesheet"/> 	
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
		if('${alertMsg}' == '비밀번호가 일치하지 않습니다.'){
			swal('${alertMsg}');
		}else if('${alertMsg}' == '새비밀번호 변경에 실패했습니다.'){
			swal('${alertMsg}');
		}			
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	<script>
    	AOS.init();    
	</script>
	<div id="login-content-wrap" >
    <!-- 비밀번호 변경 컨텐츠 -->
    <!-- 로고 -->
    <div class="login_logo"  data-aos="fade-up" data-aos-delay="250">
        <img src="${contextPath}/resources/images/dot_logo.png">
    </div>
    <div id="login-content" >
        <h1><b>비밀번호 변경</b></h1>
        <div id="login-form">
            <br>
            <form action="${contextPath}/changePwd.me" method="post">
                <div id="login-width">
                    <h6 data-aos="fade-up" data-aos-delay="350">현재비밀번호</h6>
                    <div class="form-floating"  data-aos="fade-up" data-aos-delay="350">
                        <input name="userPwd" type="password" class="form-control login-min" placeholder="현재 비밀번호를 입력해주세요" required>
                    </div>
                    <h6  data-aos="fade-up" data-aos-delay="450">새로운 비밀번호</h6>
                    <div class="form-floating"  data-aos="fade-up" data-aos-delay="450">
                        <input type="password" name="userNewPwd" class="form-control login-min" placeholder="새로운 비밀번호를 입력해주세요" required>
                    </div>
                    <h6  data-aos="fade-up" data-aos-delay="450">새로운 비밀번호 확인</h6>
                    <div class="form-floating"  data-aos="fade-up" data-aos-delay="450">
                        <input type="password" name="userNewPwd1" class="form-control login-min" placeholder="새로운 비밀번호를 한번 더 입력해주세요" required>
                    </div>
                    <button class="w-100 btn btn-lg btn-primary login-min" type="submit"  data-aos="fade-up" data-aos-delay="550">비밀번호변경</button>
                    <br>
                    <button class="w-100 btn btn-lg btn-secondary login-min" type="submit"  data-aos="fade-up" data-aos-delay="550" onclick="tomain()">취소하기</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        function tomain(){
            location.href='${contextPath}/mainFeed';
        }
    </script>
	</div>
	
	 <span id="leaf01" class="leaf">
         <img src="resources/images/star3.png" alt="" />
     </span>
     <span id="leaf02" class="leaf">
         <img src="resources/images/star4.png" alt="" />
     </span>
     <span id="leaf03" class="leaf">
         <img src="resources/images/star2.png" alt="" />
     </span>
     <span id="leaf04" class="leaf">
         <img src="resources/images/star3.png" alt="" />
     </span>
     <span id="leaf05" class="leaf">
         <img src="resources/images/star2.png" alt="" />
     </span>
     <span id="leaf06" class="leaf">
         <img src="resources/images/star3.png" alt="" />
     </span>
     <span id="leaf07" class="leaf">
         <img src="resources/images/star2.png" alt="" />
     </span>
     <span id="leaf08" class="leaf">
         <img src="resources/images/star4.png" alt="" />
     </span>
     <span id="leaf09" class="leaf">
         <img src="resources/images/star2.png" alt="" />
     </span>
     <span id="leaf10" class="leaf">
         <img src="resources/images/star3.png" alt="" />
     </span>
     <span id="leaf11" class="leaf">
         <img src="resources/images/star4.png" alt="" />
     </span>
     <span id="leaf12" class="leaf">
         <img src="resources/images/star2.png" alt="" />
     </span>
     <span id="leaf13" class="leaf">
         <img src="resources/images/star2.png" alt="" />
     </span>
     <span id="leaf14" class="leaf">
         <img src="resources/images/star3.png" alt="" />
     </span>
</body>
</html>