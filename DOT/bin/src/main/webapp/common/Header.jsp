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
    <title>Dot.</title>
</head>

<body>
    <div class="header">
        <div class="logo">
            <a>
                <img src="${contextPath}/resources/images/dot_logo.png" />
            </a>
        </div>
        <div class="header-tools">
            <div class="search-tool">
                <input type="checkbox" id="search" />
                <label for="search">
                    <form>
                        <input type="text" class="search-input" placeholder="검색할 항목을 입력하세요" />
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
                <p></p>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-body modal-backgound" style="height: 30%;">
                                <div class="modal-box">
                                    <div class="alarm-all-btn">
                                        <a>
                                            모두보기
                                        </a>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_Zzang_gu_da
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_Zzang_gu_da님이 회원님을 팔로우하기 시작했습니다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                i_want_to_be_a_Gamani
                                            </div>
                                            <div class="modal-alarm-content">
                                                i_want_to_be_a_Gamani님이 댓글을 남겼습니다 : "나는야 진정한 가마니가 될꺼야>_0!!"
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile3.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_Danbi
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_Danbi님이 회원님의 사진을 좋아요💗 눌렀습니다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile4.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_so_Sad
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_so_Sad님이 댓글을 남겼습니다 : "희미한 과거만 바라보다 선명한 현재를 놓치지 말자"
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile5.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_so_famous_spongeBob
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_so_famous_spongeBob님이 댓글을 남겼습니다 : "사실 집게리아 패티는 중국산이야 ㅠ.ㅠ"
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile6.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                im_so_4rory_ya
                                            </div>
                                            <div class="modal-alarm-content">
                                                im_so_4rory_ya님이 회원님을 팔로우하기 시작했습니다.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-profile-icon">
                                        <label>
                                            <a>
                                                <img src="${contextPath}/resources/images/profile7.jpg" />
                                            </a>
                                        </label>
                                        <div class="modal-alarm-contents">
                                            <div class="modal-alarm-user">
                                                Cute_cat
                                            </div>
                                            <div class="modal-alarm-content">
                                                Cute_cat님이 회원님의 사진을 좋아요💗 눌렀습니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 모달 끝 -->
            </div>
            <div class="dm-tool">
                <span class="material-symbols-outlined">
                    mail
                </span>
                <p></p>
            </div>

            <div class="profile">
                <div class="profile-img" onclick="location.href='MyFeed.me';">
                    <img src="${contextPath}${profileImg.filePath}/${profileImg.changeName}" />
                </div>
                <div class="profile-name" onclick="location.href='MyFeed.me';">
                    <p>${loginUser.userNick}</p>
                </div>
            </div>
        </div>
    </div>
</body>

</html>