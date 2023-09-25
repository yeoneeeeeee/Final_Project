<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyEdit</title>
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
        <!-- alert 스타일 변경-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="${contextPath}/resources/css/My_Edit.css" />	
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			if('${alertMsg}' == '회원정보 수정 실패!'){
				swal('${alertMsg}');
			}
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	<div class="wrap">
	    <jsp:include page="../common/Header.jsp" />    
	    <div class="contents">
	  		<jsp:include page="../common/Sidebar.jsp" />
	        <div class="main_content">
	        	<div class="my_edit_container">
	                <div class="my_edit_title">프로필 수정</div>
	                <div class="my_edit_form">
	                    <form class="edit_form" action="${contextPath}/update.me" method="post" enctype="multipart/form-data">
	                        <div class="my_edit_Id">
	                            <div>
	                            	<c:if test="${profileImg.fileNo == 0}">
	                                	<label for ="profile_img"><img src="${contextPath}/resources/images/—Pngtree—user icon_5097430.png"></label>
	                                </c:if>
	                                <c:if test="${profileImg.fileNo != 0}">
	                                	<label for ="profile_img"><img src="${contextPath}/${profileImg.filePath}/${profileImg.changeName}" /></label>
	                                </c:if>
	                            </div>
	                            <div>
	                                <div class="my_Id">${loginUser.userNick}</div><br>
	                                <input type="file" id="profileImg" name="proFileImg" class="my_change_img" />
	                                <label for="profileImg" class="labelProfile">
		                                <span class="material-symbols-outlined">
											photo_camera
										</span>
									</label>
	                            </div>
	                        </div>
	                        <div class="my_edit_section">
	                            <div class="field">
	                                <div class="field_name">이름</div>
	                                <input
	                                    type="text"
	                                    name="userName"
	                                    class="form-control"
	                                    id="userName"
	                                    placeholder="이름을 입력해주세요"
	                                    required
	                                    value="${loginUser.userName}"
	                                />
	                            </div>
	                            <div class="field">
	                                <div class="filed_nickname">별명</div>
	                                <input
	                                    type="text"
	                                    name="userNick"
	                                    class="form-control"
	                                    placeholder="별명을 입력해주세요"
	                                    required
	                                    value="${loginUser.userNick}"
	                                />
	                            </div>
	                            <!--  필드(생년월일) -->
	                            <div class="field birth">
	                                <div class="field_birth">생일</div>
	                                <input
	                                    type="date"
	                                    name="userBirthday"
	                                    class="form-control login-min"
	                                    required
	                                    value="${loginUser.userBirthday}"
	                                />
	                            </div>
	
	                            <!-- 필드(MBTI) -->
	                            <div class="field gender">
	                                <div>MBTI<span class="font-style"> (선택)</span></div>
	                                <br /><br />
	                                <div class="mbti_container2">
	                                    <table class="table-font">
	                                        <tr>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ISTJ" value="ISTJ"
	                                                    	${loginUser.userMbti == 'ISTJ'? "checked" : ""}
	                                                     />
	                                                    ISTJ
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ISTP" value="ISTP"
	                                                    	${loginUser.userMbti == 'ISTP'? "checked" : ""}
	                                                     />
	                                                    ISTP
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ISFJ" value="ISFJ"
	                                                    	${loginUser.userMbti == 'ISFJ'? "checked" : ""}
	                                                     />
	                                                    ISFJ
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ISFP" value="ISFP" 
	                                                    	${loginUser.userMbti == 'ISFP'? "checked" : ""}
	                                                    />
	                                                    ISFP
	                                                </label>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="INTJ" value="INTJ"
	                                                    	${loginUser.userMbti == 'INTJ'? "checked" : ""}
	                                                     />
	                                                    INTJ
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="INTP" value="INTP"
	                                                    	${loginUser.userMbti == 'INTP'? "checked" : ""}
	                                                     />
	                                                    INTP
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="INFJ" value="INFJ"
	                                                    	${loginUser.userMbti == 'INFJ'? "checked" : ""}
	                                                     />
	                                                    INFJ
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="INFP" value="INFP"
	                                                    	${loginUser.userMbti == 'INFP'? "checked" : ""}
	                                                     />
	                                                    INFP
	                                                </label>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ESTJ" value="ESTJ"
	                                                    	${loginUser.userMbti == 'ESTJ'? "checked" : ""}
	                                                     />
	                                                    ESTJ
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ESTP" value="ESTP"
	                                                    	${loginUser.userMbti == 'ESTP'? "checked" : ""}
	                                                     />
	                                                    ESTP
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ESFJ" value="ESFJ"
	                                                    	${loginUser.userMbti == 'ESFJ'? "checked" : ""}
	                                                     />
	                                                    ESFJ
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ESFP" value="ESFP"
	                                                    	${loginUser.userMbti == 'ESFP'? "checked" : ""}
	                                                     />
	                                                    ESFP
	                                                </label>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ENTJ" value="ENTJ"
	                                                    	${loginUser.userMbti == 'ENTJ'? "checked" : ""}
	                                                     />
	                                                    ENTJ
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ENTP" value="ENTP"
	                                                    	${loginUser.userMbti == 'ENTP'? "checked" : ""}
	                                                     />
	                                                    ENTP
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ENFJ" value="ENFJ"
	                                                    	${loginUser.userMbti == 'ENFJ'? "checked" : ""}
	                                                     />
	                                                    ENFJ
	                                                </label>
	                                            </td>
	                                            <td>
	                                                <label
	                                                    ><input type="radio" name="userMbti" id="ENFP" value="ENFP"
	                                                    	${loginUser.userMbti == 'ENFP'? "checked" : ""}
	                                                     />
	                                                    ENFP
	                                                </label>
	                                            </td>
	                                        </tr>
	                                    </table>
	                                </div>
	                            </div>
	                            <div class="chap3">
	                                <!-- 이메일_주소지 -->
	                                <div class="field">
	                                    <div>이메일</div>
	                                    <input
	                                        type="email"
	                                        class="form-control"
	                                        name="userEmail"
	                                        id="email-input"
	                                        placeholder="이메일 주소"
	                                        required
	                                        value="${loginUser.userEmail}"
	                                    />
	                                </div>
	                                <div class="field">
	                                    <div>휴대전화</div>
	                                    <input
	                                        type="text"
	                                        class="form-control input_checkform2"
	                                        name="userPhone"
	                                        placeholder="(-)을 포함해서 전화번호 입력"
	                                        required
	                                        value="${loginUser.userPhone}"
	                                    />
	                                </div>
	                            </div>
	                            <!-- 수정하기 버튼 -->
	                            <div class="btn-box">
	                                <button type="submit" class="btn btn2 btn-secondary btn-lg">
	                                    회원수정
	                                </button>
	                                &nbsp;&nbsp;
	                                <button
	                                    type="button"
	                                    class="btn btn2 btn-secondary btn-lg"
	                                    onclick="location.href='${contextPath}/deleteUser'"
	                                >
	                                    회원탈퇴
	                                </button>
	                                &nbsp;&nbsp;
	                                <button
	                                    type="button"
	                                    class="btn btn-secondary btn2 btn-lg"
	                                    onclick="toMyFeed()"
	                                >
	                                    취소하기
	                                </button>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	                <br />
	            </div>
	        </div>
	        <!-- 실시간 바 -->
	        <div class="sub-content">
	        </div>
	    </div>    
    </div>
    <script>
	    function toMyFeed() {
	        location.href = '${contextPath}/MyFeed.me';
	    }
    </script>
</body>
</html>