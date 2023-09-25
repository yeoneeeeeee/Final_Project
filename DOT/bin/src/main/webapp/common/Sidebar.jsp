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


    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/Dot_Sidebar.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/sidebar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <title>Dot.</title>
</head>

<body>
    <div class="sidebar-wrap">
        <input type="checkbox" id="menuicon">
        <label for="menuicon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <div class="sidebar">
            <div class="side-content">
                <div class="tools br-bottom">
                    <dl>
                        <dt>
                            <a class="material-symbols-outlined" href="${contextPath}/mainFeed">
                                home
                                <span>홈</span>
                            </a>
                        </dt>
                        <dt>
                            <a class="material-symbols-outlined">
                                search
                                <span>탐색</span>
                            </a>
                        </dt>
                        <dt>
                            <a class="material-symbols-outlined">
                                notifications
                                <span>알림</span>
                            </a>
                        </dt>
                        <dt>
                            <a class="material-symbols-outlined">
                                mail
                                <span>메세지</span>
                            </a>
                        </dt>
                        <dt>
                            <a class="material-symbols-outlined">
                                add_box
                                <span>스토어</span>
                            </a>
                        </dt>
                        <dt>
                            <a class="material-symbols-outlined">
                                group
                                <span>팔로워</span>
                            </a>
                        </dt>
                    </dl>
                </div>
                <div class="friends br-bottom">
                    <span>팔로우</span>
                    <div class="friends-list">
                    	<c:forEach var="f" items="${mlist}">
	                        <a class="friend-profile"  href="${contextPath}/YourFeed.me?uno=${f.userNo}">
	                            <div class="profile-img">
	                               <img src="${contextPath}${f.filePath}/${f.changeName}" />
	                            </div>
	                            <div class="profile-name">
	                                <span>${f.userNick}</span>
	                            </div>
	                            <label></label>
	                        </a>
                        </c:forEach>
                        <div class="friend-profile more-friends">
                            <span>더보기</span>
                            <span class="material-symbols-outlined">
                                add
                            </span>
                        </div>
                    </div>
                </div>
                <div class="tools br-bottom">
                    <dl>
                        <dt>
                            <a class="material-symbols-outlined" href="${contextPath}/changePwd">
                                password
                                <span>비밀번호변경</span>
                            </a>
                        </dt>
                        <dt>
                            <a class="material-symbols-outlined" href="${contextPath}/deleteUser">
                                person_remove
                                <span>회원탈퇴</span>
                            </a>
                        </dt>
                    </dl>
                </div>
                <div class="tools br-bottom">
                    <dl>
                        <dt>
                            <a class="material-symbols-outlined" href="${contextPath}/logout.me">
                                logout
                                <span>로그아웃</span>
                            </a>
                        </dt>
                    </dl>
                </div>
                <div class="footer">
                    <span>
                        회사소개 | 이용약관 | 개인정보처리방침 | 운영정책 | 청소년보호정책 | 권리침해신고안내 | 공지사항
                    </span>
                    <div>
                        <p>&copy; 2023 Dot. All rights reserved.</p>
                        <p>Connect with friends and share your moments with our SNS platform. Join us today!</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="sidebar-shortcuts">
            <div class="shortcuts-wrap">
                <dl>
                    <dt>
                        <a class="material-symbols-outlined" href="${contextPath}/mainFeed">
                            home
                        </a>
                        <h5>홈</h5>
                    </dt>
                    <dt>
                        <a class="material-symbols-outlined">
                            search
                        </a>
                        <h5>탐색하기</h5>
                    </dt>
                    <dt>
                        <a class="material-symbols-outlined">
                            add_box
                        </a>
                        <h5>스토어</h5>
                    </dt>
                    <dt>
                        <a class="material-symbols-outlined">
                            group
                        </a>
                        <h5>친구</h5>
                    </dt>
                </dl>
                <dl>
                    <dt>
                        <a class="material-symbols-outlined" href="${contextPath}/logout.me">
                            logout
                        </a>
                        <h5>로그아웃</h5>
                    </dt>
                </dl>
            </div>
        </div>
    </div>
   
</body>

</html>