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

    <link rel="stylesheet" href="resources/css/Dot_StartPage.css" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="resources/js/Dot_StartPage.js"></script>



    <title>Dot.</title>
</head>

<body>
    <div class="wrap">
       <div class="start-wrap">
        </div> 
        <div class="header">
            <div class="logo">
                <a>
                    <img src="resources/images/DotLogo.png" />
                </a>
            </div>
            <div class="header-form">
                <a href="${contextPath}/login.me">Log in</a>
                <a href="${contextPath}/enrollForm.me">Sign in</a>
            </div>
        </div>
        <div class="section-container">
            <div class="section1-wrap">
                <div class="sec1-header">
                    <div class="sec1-t1">Digits connect us,</div>
                    <div class="sec1-t2">Online realm, endless and bright,</div>
                    <div class="sec1-t3">Together we thrive.</div>
                </div>
            </div>
            <div class="section2-wrap">
                <div class="sec2-header">
                    <div class="sec2-t">
                        Digits connect us, Online realm, endless and bright, Together we thrive.
                    </div>
                </div>
                <div class="sec2-body">
                    <div class="sec2-container">
                        <div class="left-description">
                            <div class="left-t1 hide-text">
                                <div class="t1-head">
                                	Explore What's New
                                </div>
                                <div class="t1-body">
                                	지속적으로 발전하는 기능을 통해 여러분은 <br> 새로운 방식으로 자신을 표현할 수 있습니다.
                                </div>
                                <div class="t1-foot">
                                	당신의 일상을 기록하세요!
                                </div>
                            </div>
                            <div class="left-t2 hide-text">
                                <div class="t2-head">
                                	Express Your Own Feelings
                                </div>
                                <div class="t2-body">
                                	여러분만의 독특한 세계를 만들어보고 표현할 수 있습니다. <br>자신만의 아름다운 이야기를 전달하고, 공유하세요.
                                </div>
                                <div class="t2-foot">
                                	나만의 공간을 꾸며보세요!
                                </div>
                            </div>
                            <div class="left-t3 hide-text">
                                <div class="t3-head">
                                	Have a Conversation
                                </div>
                                <div class="t3-body">
                                	친구와 특별한 그룹에게 감동적인 순간을 공유하세요. 메시지,<br>사진을 전송하며 자유롭게 소통의 즐거움을 만끽해보세요.
                                </div>
                                <div class="t3-foot">
                                	친구들과 대화를 즐겨보세요!
                                </div>
                            </div>
                        </div>
                        <div class="right-description">
                            <div class="right-img1">
                                <div class="img-box">
                                    <img src="${contextPath }/resources/images/startImg-1.png">
                                </div>
                            </div>
                            <div class="right-img2">
                                <div class="img-box">
                                    <img src="${contextPath }/resources/images/startImg-2.png">
                                </div>
                            </div>
                            <div class="right-img3">
                                <div class="img-box">
                                    <img src="${contextPath }/resources/images/startImg-3.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section3-wrap">
            	<div class="sec3-container">
            		<div class="sec3-top">
            			Developer
            		</div>
            		<div class="sec3-body">
            			<div class="profil-box">
            				<div class="img-box">
            					<img src="${contextPath }/resources/images/jungwanProfile.png"/>
            				</div>
            				<div class="name-box">
            					<span class="kor-name">이정완</span>
            					<span class="en-name">@ Lee Jung Wan</span>
            				</div>
            			</div>
            			<div class="profil-box box-dw">
            				<div class="img-box">
            					<img src="${contextPath }/resources/images/changjeongProfile.png"/>
            				</div>
            				<div class="name-box">
            					<span class="kor-name">오창정</span>
            					<span class="en-name">@ Oh Chang Jeung</span>
            				</div>
            			</div>
            			<div class="profil-box">
            				<div class="img-box">
            					<img src="${contextPath }/resources/images/junhoProfile.png"/>
            				</div>
            				<div class="name-box">
            					<span class="kor-name">이준호</span>
            					<span class="en-name">@ Lee Jun Ho</span>
            				</div>
            			</div>
            			<div class="profil-box box-dw">
            				<div class="img-box">
            					<img src="${contextPath }/resources/images/soyeonProfile.png"/>
            				</div>
            				<div class="name-box">
            					<span class="kor-name">김소연</span>
            					<span class="en-name">@ Kim So Yeon</span>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
            <div class="section4-wrap">
           		<img alt="" src="${contextPath }/resources/images/sns_image3.jpeg">
            	<div class="section4-container">
            		<div class="sec4-txt">
            			<div class="t4-top slide">
            				DOT는 연결성과 창의성을 높이며, 다양한 사람과의<br>전 세계적인 연결을 제공합니다.
            			</div>
            			<a class="slide" href="${contextPath }/login.me">시작하기</a>
            		</div>
            	</div>
            </div>
        </div>
    </div>
</body>


</html>