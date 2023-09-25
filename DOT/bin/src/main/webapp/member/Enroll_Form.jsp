<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/EnrollForm.css">
</head>
<body>
     <div class="member">
         <!--  로고 -->
         <div class="logo-box">
             <img class="logo" id="login-logo" src="resources/images/dot_logo.png" />
         </div>

         <form id="enroll-form" action="${contextPath}/insert.me" method="post">
             <!-- 필드 -->
             <div class="chap1">
                 <div class="field">
                     <b>아이디<span class="font-style"> *</span></b>
                     <input
                         name="userId"
                         type="text"
                         class="form-control login-min input_checkform"
                         placeholder="아이디를 입력해주세요"
                         required
                     />
                     <button type="button" class="btn btn-primary btn2 btn3" onclick="idCheck();">중복확인</button>
                 </div>
                 <br />
                 <div class="field">
                     <b>비밀번호 <span class="font-style"> *</span></b>
                     <input
                         class="form-control login-min"
                         name="userPwd"
                         id="userPwd"
                         type="password"
                         placeholder="8~16자 이내의 영문,숫자로 지어주세요"
                         required
                     />
                 </div>
                 <br />
                 <div class="field">
                     <b>비밀번호 재확인 <span class="font-style"> *</span></b>
                     <input
                         class="form-control login-min"
                         id="userPwd2"
                         type="password"
                         placeholder="8~16자 이내의 영문,숫자로 지어주세요"
                         onblur="myPwd();"
                         required
                     />
                     <label id="checkPwd"></label> <br /><br />
                 </div>
                 <br /><br />
                 <!-- 가입하기 버튼 -->
                 <div class="btn-box">
                     <button type="button" class="btn btn-secondary btn2 btn-lg" onclick="tomain()">취소하기</button>
                     &nbsp;&nbsp;
                     <button type="button" class="btn btn-primary btn2 btn-lg" onclick="next();">다음 단계</button>
                 </div>
             </div>
             <script>
                 function idCheck() {
                     const userId = $('input[name=userId]');
                     $.ajax({
                         url: '${contextPath}/idCheck.me',
                         data: { userId: userId.val() },
                         success: function (result) {
                             console.log(result);
                             if (result == 1) {
                             		swal('이미 존재하는 아이디입니다.');
                             		userId.focus();
                             } else if(result == 2){
                          	 	swal('빈칸은 사용하실수 없습니다.');
                          	 	userId.focus();
                             } else {
                          	   swal({
                          		   title: "사용가능한 아이디",
                          		   text: "사용가능한 아이디입니다. 사용하시겠습니까?",
                          		   buttons: true
                          		 })
                          		 .then((willDelete) => {
                           		   if (willDelete) {
                           		     	swal("아이디를 사용합니다.");
                                      	 	userId.attr('readonly', true);
                                      	 	console.log(userId.val());
                           		   } else {
                           		     	swal("아이디를 사용하지 않습니다.");
                                      	 	userId.focus();
                           		   }
                          		 });
                             }
                         },
                     });
                 }
                 function myPwd() {
                     const userPwd = $('#userPwd').val();
                     const userPwd2 = $('#userPwd2').val();
                     const checkPwd = document.querySelector('#checkPwd');
                     if (userPwd != userPwd2) {
                         checkPwd.innerHTML = '비밀번호가 일치하지 않습니다.';
                         checkPwd.style.color = 'red';
                     } else {
                         checkPwd.innerHTML = '비밀번호가 일치합니다.';
                         checkPwd.style.color = 'green';
                     }
                 }
                 function next() {
                     const chap1 = $('.chap1');
                     const chap2 = $('.chap2');
                     const chap3 = $('.chap3');
                     const chap2_1 = $('#chap2-1');
                     const chap2_2 = $('#chap2-2');
                     const chap2_3 = $('#chap2-3');

                     chap1.css('display', 'none');
                     chap2.css('display', 'block');
                 }
             </script>

             <div class="chap2">
                 <div class="field">
                     <b>이름 <span class="font-style"> *</span></b>
                     <input
                         type="text"
                         name="userName"
                         class="form-control login-min"
                         id="userName"
                         placeholder="이름을 입력해주세요"
                         required
                     />
                 </div>
                 <br />
                 <div class="field">
                     <b>별명 <span class="font-style"> *</span></b>
                     <input
                         type="text"
                         name="userNick"
                         class="form-control login-min"
                         placeholder="별명을 입력해주세요.최대 12자"
                         required
                     />
                 </div>
                 <br />
                 <!--  필드(생년월일) -->
                 <div class="field birth">
                     <b>생년월일 <span class="font-style"> *</span></b>
                     <div>
                         <input type="date" name="userBirthday" class="form-control login-min" required />
                     </div>
                 </div>
                 <br />
                 <!-- 필드(MBTI) -->
                 <div class="field gender">
                     <b>MBTI<span class="font-style2"> (선택)</span></b>
                     <div class="mbti_container">
                         <table align="center" class="table-font login-min">
                             <tr>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ISTJ" value="ISTJ" /> ISTJ </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ISTP" value="ISTP" /> ISTP </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ISFJ" value="ISFJ" /> ISFJ </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ISFP" value="ISFP" /> ISFP </label>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="INTJ" value="INTJ" /> INTJ </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="INTP" value="INTP" /> INTP </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="INFJ" value="INFJ" /> INFJ </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="INFP" value="INFP" /> INFP </label>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ESTJ" value="ESTJ" /> ESTJ </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ESTP" value="ESTP" /> ESTP </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ESFJ" value="ESFJ" /> ESFJ </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ESFP" value="ESFP" /> ESFP </label>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ENTJ" value="ENTJ" /> ENTJ </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ENTP" value="ENTP" /> ENTP </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ENFJ" value="ENFJ" /> ENFJ </label>
                                 </td>
                                 <td>
                                     <label><input type="radio" name="userMbti" id="ENFP" value="ENFP" /> ENFP </label>
                                 </td>
                             </tr>
                         </table>
                     </div>
                 </div>
                 <br /><br />
                 <!-- 가입하기 버튼 -->
                 <div class="btn-box">
                     <button type="button" class="btn btn-secondary btn2 btn-lg" onclick="previous()">
                         이전단계
                     </button>
                     &nbsp;&nbsp;
                     <button type="button" class="btn btn-primary btn2 btn-lg" onclick="next2();">다음단계</button>
                 </div>
             </div>
             <script>
                 function next2() {
                     const chap1 = $('.chap1');
                     const chap2 = $('.chap2');
                     const chap3 = $('.chap3');

                     chap2.css('display', 'none');
                     chap3.css('display', 'block');
                 }
                 function previous() {
                     const chap1 = $('.chap1');
                     const chap2 = $('.chap2');
                     const chap3 = $('.chap3');

                     chap2.css('display', 'none');
                     chap1.css('display', 'block');
                 }
             </script>

             <div class="chap3">
                 <!-- 이메일_주소지 -->
                 <div class="field">
                 </br>
                     <b>이메일 <span class="font-style"> *</span></b>
                     <input
                         type="email"
                         class="form-control login-min"
                         name="userEmail"
                         id="email-input"
                         placeholder="이메일 주소"
                         required
                     />
                 </div>
                 <br />
                 <div class="field">
                     <b>휴대전화 <span class="font-style"> *</span></b>
                     <input
                         type="text"
                         class="form-control login-min input_checkform2"
                         name="userPhone"
                         placeholder="(-)을 포함해서 전화번호 입력"
                         required
                     />
                     <button id="sendPhoneNumber" class="btn btn-primary btn2 btn3" type="button">인증 요청</button>
                 </div>
                 <br />
                 <div class="field">
                     <b>인증코드확인 <span class="font-style"> *</span></b>
                     <input
                         type="text"
                         class="form-control login-min input_checkform2"
                         id="verification-code-input"
                         placeholder="인증 코드"
                     />
                     <button id="verification-submit-btn" class="btn btn-primary btn2 btn3" type="button">코드 확인</button>
                 </div>
                 <br /><br /><br /><br />
                 <!-- 가입하기 버튼 -->
                 <div class="btn-box">
                     <button type="button" class="btn btn-secondary btn2 btn-lg" onclick="tomain()">취소하기</button>
                     &nbsp;&nbsp;
                     <button type="submit" class="btn btn-primary btn2 btn-lg">
                         가입하기
                     </button>
                 </div>
             </div>
         </form>
     </div>

     <script>
         function tomain() {
             location.href = 'login.me';
         }

         
         $('#sendPhoneNumber').click(function(){
         		const userPhone = $('input[name=userPhone]');
		$.ajax({
			type : "GET",
		    url: '${contextPath}/sendSMS.me',
		    data: { userPhone: userPhone.val() },
		    success: function (result) {
		        console.log(result);
		       
		    }
		});
         });
         
       
     </script>

     
    <!-- ---------------------------------------------------------------------------------------------------------- -->
    <span id="leaf01" class="leaf">
        <img src="resources/images/star3.png" alt="">
    </span>
    <span id="leaf02" class="leaf">
        <img src="resources/images/star4.png" alt="">
    </span>
    <span id="leaf03" class="leaf">
        <img src="resources/images/star2.png" alt="">
    </span>
    <span id="leaf04" class="leaf">
        <img src="resources/images/star3.png" alt="">
    </span>
    <span id="leaf05" class="leaf">
        <img src="resources/images/star2.png" alt="">
    </span>
    <span id="leaf06" class="leaf">
        <img src="resources/images/star3.png" alt="">
    </span>
    <span id="leaf07" class="leaf">
        <img src="resources/images/star2.png" alt="">
    </span>
    <span id="leaf08" class="leaf">
        <img src="resources/images/star4.png" alt="">
    </span>
    <span id="leaf09" class="leaf">
        <img src="resources/images/star2.png" alt="">
    </span>
    <span id="leaf10" class="leaf">
        <img src="resources/images/star3.png" alt="">
    </span>
    <span id="leaf11" class="leaf">
        <img src="resources/images/star4.png" alt="">
    </span>
    <span id="leaf12" class="leaf">
        <img src="resources/images/star2.png" alt="">
    </span>
    <span id="leaf13" class="leaf">
        <img src="resources/images/star2.png" alt="">
    </span>
    <span id="leaf14" class="leaf">
        <img src="resources/images/star3.png" alt="">
    </span>
</body>
</html>