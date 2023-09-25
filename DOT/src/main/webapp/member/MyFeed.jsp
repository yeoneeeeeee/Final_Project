<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyFeed</title>
   		<link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
        />
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <!-- alert 스타일 변경-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0"
        />
        <!--<script src="js/sidebar.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="${contextPath}/resources/css/MyFeed.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"
        />
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick-theme.css" />
        <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick.css" />
        <script type="text/javascript" src="${contextPath}/resources/js/MyFeed.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />
        <style>
        *{
        color: white;
        }
        </style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			if('${alertMsg}' == '회원정보 수정 성공!'){
				swal('${alertMsg}');
			}else if('${alertMsg}' == '게시물 수정 성공!'){
				swal('${alertMsg}');
			}else if('${alertMsg}' == '게시물 작성 성공!'){
				swal('${alertMsg}');
			}
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	<div class="wrap">
	   <jsp:include page="../common/Header.jsp" />
       <div class="contents">
          <jsp:include page="../common/Sidebar.jsp" />
           <!-- 메인 컨텐츠 마이페이지 -->
           <div class="main-content">
               <!-- 상단프로필 -->
               <div class="mypage-profile-container">
                   <div class="profile-imgs">
                       <img src="${contextPath}/${profileImg.filePath}/${profileImg.changeName}" />
                   </div>
                   <div class="mypage-setbox">
                       <div class="setbox-header">
                           <div class="user_Id">
                               <span>${loginUser.userNick}
                               		<c:if test="${loginUser.wbStatus == 'W'}">
                               			<img src="${contextPath}/resources/images/goodIcon.jfif" />
                               		</c:if>
                               </span>
                               <div class="user_name">@${loginUser.userName}</div>
                           </div>
                           <div class="update_profile">
                               <button class="btn" onclick="myEdit()">
                                   <span class="icon2"><h6>프로필 수정</h6></span>
                               </button>
                               <button class="btn"  onclick="myFeedEnroll()">
                                   <span class="icon2"><h6>피드 등록</h6></span>
                               </button>
                           </div>
                       </div>
                       <div class="mypage-follower">
                           <div class="follows" onclick="follow()" style="cursor: pointer"><h5>팔로우  :  ${follow.size()}명</h5></div>
                           <div class="follows" onclick="follow()" style="cursor: pointer"><h5>팔로워  :  ${follower.size()}명<h5></h5></div>
                           <div class="follows" ><h5>게시물  :  ${myImglist.size()}개</h5></div>
                       </div>
                   </div>
               </div>
               <!-- 선택 버튼 -->
               <div class="mypage-selectbox">
                   <div class="selectbox">
                       <div class="selectbox-btn" id="pro-btn3" onclick="selected1();">
                           <span class="material-symbols-outlined">
                               grid_on
                               </span>
                           <h5 id="h5-1">게시물</h5>
                       </div>
                   </div>
                   <div class="selectbox" id="selectbox">
                       <div class="selectbox-btn" id="pro-btn4" onclick="selected2();">
                           <span class="material-symbols-outlined">
                               bookmarks
                               </span>
                           <h5 id="h5-2">스토어</h5>
                       </div>
                   </div>
               </div>
               <!-- 하단 선택 박스1-->
               <div class="choice1 list1">
                   <div class="myimage">
                   		<c:forEach var="m" items="${myImglist}">
	                       <div class="myimage-section" data-bs-toggle="modal" data-bs-target="#MyDetailFeed" onclick="feedNo(event , ${m.fileFno})">
	                           <img class="img-size" src="${contextPath}/${m.filePath}/${m.changeName}" />
	                           <div class="like">
	                               <svg
	                                   xmlns="http://www.w3.org/2000/svg"
	                                   width="16"
	                                   height="16"
	                                   fill="currentColor"
	                                   class="bi bi-heart-fill"
	                                   viewBox="0 0 16 16"
	                               >
	                                   <path
	                                       fill-rule="evenodd"
	                                       d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
	                                   />
	                               </svg>
	                               <span class="bi">${m.likeCount}</span>
	                           </div>
	                       </div>
	                    </c:forEach>
                    </div>  
               </div>
                <!-- Modal1 -->
			   <div class="modal fade" id="MyDetailFeed" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
			     <div class="modal-dialog modal-xl" style="margin-top:110px;">
		            <div class="modal-content">
		                <div class="modal-header modal-backgound">
		                    <div class="modal-title" id="feedDetail">
		                        <div class="feed-header modal-feed-header">
		                            <div class="modal-user-profile">
		                               <span><img src="${contextPath}/${profileImg.filePath}/${profileImg.changeName}" /></span>
				                        <span style="width:105px;">${loginUser.userNick}</span>
		                                <span class="material-symbols-outlined modal-toggle-button">
		                                    more_horiz
		                                </span>
		                                <div class="modal-more-options">
		                                    <div>
		                                        <dl>
		                                           <dt onclick="myFeedEdit()">
	                                                   <span class="material-symbols-outlined"> edit </span>
	                                                   <a>수정하기</a>
	                                               </dt>
	                                               <dt id="check-store" class="clickable-svg-store1">
	                                                  
	                                               </dt>
		                                        </dl>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <button type="button" onclick="closeModal2()" class="modal-close" data-bs-dismiss="modal" aria-label="Close">Ⅹ</button>
		                </div>
		                <div class="modal-body modal-backgound">
		                    <div class="modal-feed-body">
		                        <div class="feed-img" id="feed-img">
		                        </div>
		                        <div class="body-bottom">
		                            <div class="feed-tools">
		                            	<div class="clickable-svg clickable-svg-heart">
		                                   
		                               </div>
		                                <div class="clickable-svg shareFeed" data-bs-toggle="modal" data-bs-target="#shareTool1">
		                                   <svg
		                                       xmlns="http://www.w3.org/2000/svg"
		                                       width="25"
		                                       height="25"
		                                       fill="currentColor"
		                                       class="bi bi-share"
		                                       viewBox="0 0 16 16"
		                                   >
		                                       <path
		                                           d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"
		                                       />
		                                   </svg>
		                               </div>
		                                <div class="clickable-svg clickable-svg-store clickable-svg-store1">
		                                   
		                               </div>
		                            </div>
		                           <div class="feed-text">
		                               <span class="modal-likeCount3" id="modal-likeCount"></span>
		                               <br />
		                               <span id="modal-content"></span>
		                               <br />
		                               <span id="modal-hash"></span>
		                               <br />
		                           </div>
		                        </div>
		                    </div>
		                    <div class="modal-feed-footer">
		                        <div class="reply-wrap">
		                            <div class="reply-middle">
		                                <dl class="reply-zone">
		                                
		                                </dl>
		                            </div>
		                            <div class="reply-bottom">
		                                <input type="text" placeholder="댓글을 입력하세요." id="replyContent" />
		                                <button id="reply-send">답글</button>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
			   </div>
			   <!-- Share Modal1 -->
				<div class="modal fade shareTool" id="shareTool1" tabindex="-1"
					aria-labelledby="shareToolLabe" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<form>
								<div class="modal-header">
									<h5 class="modal-title" id="shareToolLabe">공유하기</h5>
									<form>
										<input type="search" class="friends-search" id="friends-search"
											placeholder="검색할 팔로워를 입력하세요." />
									</form>
								</div>
								<div class="modal-body">
									<div class="list-btn">
										<span class="followBtn focus-btn">팔로워</span> <span class="chatBtn">채팅방</span>
									</div>
									<div class="lists">
										<div class="follower-list">
											<div>
												<dl>
													<c:if test="${empty follow }">
														<dt>
															<span>존재하는 팔로우가 없습니다.</span>
														</dt>
													</c:if>
													<c:forEach var="f" items="${follow }">
														<dt>
															<div>
																<img src="${contextPath}/${f.filePath}/${f.changeName}" />
																<label>${f.userNick }</label>
															</div>
															<input type="checkbox" id="addFriend1" name="userNo"
																value="${f.userNo }" />
														</dt>
													</c:forEach>
												</dl>
											</div>
										</div>
										<div class="chatting-list">
											<div>
												<dl>
													<c:if test="${empty chatRoomList }">
														<dt>
															<span>존재하는 채팅방이 없습니다.</span>
														</dt>
													</c:if>
													<c:forEach var="chatRoom" items="${chatRoomList }">
														<dt>
															<div>
																<div class="userCount">
																	<c:forEach var="chatImage" items="${chatRoomImage }"
																		varStatus="loop">
																		<c:if
																			test="${chatRoom.chatRoomNo == chatImage.chatRoomNo }">
																			<c:if test="${loop.index == 0 }">
																				<img
																					src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																			</c:if>
																			<c:if test="${loop.index == 1 }">
																				<img
																					src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																			</c:if>
																			<c:if test="${loop.index >= 2 }">
																				<img
																					src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																			</c:if>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="titleWrap">
																	<span class="roomTitle">${chatRoom.title }</span>
																</div>
															</div>
															<input type="checkbox" name="shareRoom"
																value="${chatRoom.chatRoomNo }" class="shareCheck" />
														</dt>
													</c:forEach>
												</dl>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="share-close" data-bs-dismiss="modal">나가기</button>
									<button type="submit" class="share-add">공유하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			   
               <!-- 하단 선택 박스2-->
               <div class="choice2 list2">
                   <div class="myimage">
                   		<c:forEach var="n" items="${myChoice}">
	                       <div class="myimage-section"  data-bs-toggle="modal" data-bs-target="#MyDetailFeed2" onclick="feedNo2(event , ${n.fileFno})" >
	                           <img class="img-size" src="${contextPath}/${n.filePath}/${n.changeName}" />
	                           <div class="like">
	                               <svg
	                                   xmlns="http://www.w3.org/2000/svg"
	                                   width="16"
	                                   height="16"
	                                   fill="currentColor"
	                                   class="bi bi-heart-fill"
	                                   viewBox="0 0 16 16"
	                               >
	                                   <path
	                                       fill-rule="evenodd"
	                                       d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
	                                   />
	                               </svg>
	                               <span class="bi">${n.likeCount}</span>
	                           </div>
	                       </div>
	                    </c:forEach>
                   </div>
               </div>
           </div>
           <!-- Modal2 -->
		   <div class="modal fade" id="MyDetailFeed2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
		      <div class="modal-dialog modal-xl" style="margin-top:110px;">
		            <div class="modal-content">
		                <div class="modal-header modal-backgound">
		                    <div class="modal-title" id="feedDetail">
		                        <div class="feed-header modal-feed-header">
		                            <div class="modal-user-profile">
				                        <div style="width:585px;" id="myChoiceModal">
		                               </div>
		                                <span class="material-symbols-outlined modal-toggle-button">
		                                    more_horiz
		                                </span>
		                                <div class="modal-more-options">
		                                    <div>
		                                        <dl>
	                                               <dt id="check-store2" class="clickable-svg-store1">
	                                                  
	                                               </dt>
	                                               <dt data-bs-toggle="modal" data-bs-target="#reportBtn" class="reportabc">
	                                                   
	                                               </dt>
	                                           </dl>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <button type="button" onclick="closeModal2()" class="modal-close" data-bs-dismiss="modal" aria-label="Close">Ⅹ</button>
		                </div>
		                <div class="modal-body modal-backgound">
		                    <div class="modal-feed-body">
		                       <div class="feed-img2" id="feed-img">
		                       </div>
		                        <div class="body-bottom">
		                           <div class="feed-tools">
		                               <div class="clickable-svg clickable-svg-heart">
		                                   
		                               </div>
		                               <div class="clickable-svg shareFeed" data-bs-toggle="modal" data-bs-target="#shareTool2">
		                                   <svg
		                                       xmlns="http://www.w3.org/2000/svg"
		                                       width="25"
		                                       height="25"
		                                       fill="currentColor"
		                                       class="bi bi-share"
		                                       viewBox="0 0 16 16"
		                                   >
		                                       <path
		                                           d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"
		                                       />
		                                   </svg>
		                               </div>
		                               <div class="clickable-svg clickable-svg-store clickable-svg-store1">
		                                   
		                               </div>
		                           </div>
		                           <div class="feed-text">
		                               <span class="modal-likeCount2" id="modal-likeCount2"></span>
		                               <br />
		                               <span id="modal-content2"></span>
		                               <br />
		                               <span id="modal-hash2"></span>
		                               <br />
		                           </div>
		                        </div>
		                    </div>
		                    <div class="modal-feed-footer">
		                        <div class="reply-wrap">
		                            <div class="reply-middle">
		                                <dl class="reply-zone">
		                                </dl>
		                            </div>
		                            <div class="reply-bottom">
		                                <input type="text" placeholder="댓글을 입력하세요." id="replyContent2"/>
		                                <button id="reply-send2">답글</button>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div> 
		   </div>
		   <input type="hidden" value="${loginUser.userNo}" id="myIdNo"/>
		   <!-- Share Modal2 -->
			<div class="modal fade shareTool" id="shareTool2" tabindex="-1"
				aria-labelledby="shareToolLabe" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form>
							<div class="modal-header">
								<h5 class="modal-title" id="shareToolLabe">공유하기</h5>
								<form>
									<input type="search" class="friends-search" id="friends-search"
										placeholder="검색할 팔로워를 입력하세요." />
								</form>
							</div>
							<div class="modal-body">
								<div class="list-btn">
									<span class="followBtn focus-btn">팔로워</span> <span class="chatBtn">채팅방</span>
								</div>
								<div class="lists">
									<div class="follower-list">
										<div>
											<dl>
												<c:if test="${empty follow }">
													<dt>
														<span>존재하는 팔로우가 없습니다.</span>
													</dt>
												</c:if>
												<c:forEach var="f" items="${follow }">
													<dt>
														<div>
															<img src="${contextPath}/${f.filePath}/${f.changeName}" />
															<label>${f.userNick }</label>
														</div>
														<input type="checkbox" id="addFriend1" name="userNo"
															value="${f.userNo }" />
													</dt>
												</c:forEach>
											</dl>
										</div>
									</div>
									<div class="chatting-list">
										<div>
											<dl>
												<c:if test="${empty chatRoomList }">
													<dt>
														<span>존재하는 채팅방이 없습니다.</span>
													</dt>
												</c:if>
												<c:forEach var="chatRoom" items="${chatRoomList }">
													<dt>
														<div>
															<div class="userCount">
																<c:forEach var="chatImage" items="${chatRoomImage }"
																	varStatus="loop">
																	<c:if
																		test="${chatRoom.chatRoomNo == chatImage.chatRoomNo }">
																		<c:if test="${loop.index == 0 }">
																			<img
																				src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																		</c:if>
																		<c:if test="${loop.index == 1 }">
																			<img
																				src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																		</c:if>
																		<c:if test="${loop.index >= 2 }">
																			<img
																				src="${contextPath}/${chatImage.filePath }/${chatImage.changeName}">
																		</c:if>
																	</c:if>
																</c:forEach>
															</div>
															<div class="titleWrap">
																<span class="roomTitle">${chatRoom.title }</span>
															</div>
														</div>
														<input type="checkbox" name="shareRoom"
															value="${chatRoom.chatRoomNo }" class="shareCheck" />
													</dt>
												</c:forEach>
											</dl>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="share-close" data-bs-dismiss="modal">나가기</button>
								<button type="submit" class="share-add">공유하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<!-- Report Modal -->
		     <div
		         class="modal fade"
		         id="reportBtn"
		         tabindex="-1"
		         aria-labelledby="exampleModalLabel"
		         aria-hidden="true"
		         data-backdrop="static"
		     >
		         <div class="modal-dialog">
		             <div class="modal-content modalstyle">
		                 <div class="modal-header">
		                     <h5 class="modal-title" id="exampleModalLabel">신고 하기</h5>
		                     <button
		                         type="button"
		                         class="btn-close close_btn close_btn_style"
		                         data-bs-dismiss="modal"
		                         aria-label="Close"
		                     >
		                         X
		                     </button>
		                 </div>
		                 <div class="modal-body">
		                     <div>
		                         <div class="report_title" data-dismiss="modal">이 게시물을 신고하는 이유</div>
		                         <br />
		                         <div class="report_content" onclick="checkReport(event)">
		                             스팸
		                         </div>
		                         <br />
		                         <div class="report_content" data-dismiss="modal" onclick="checkReport(event)">
		                             나체 이미지 또는 성적행위
		                         </div>
		                         <br />
		                         <div class="report_content" data-dismiss="modal" onclick="checkReport(event)">
		                             혐오 발언 또는 상징
		                         </div>
		                         <br />
		                         <div class="report_content" data-dismiss="modal" onclick="checkReport(event)">
		                             폭력 또는 위험한 단체
		                         </div>
		                         <br />
		                         <div class="report_content" data-dismiss="modal" onclick="checkReport(event)">
		                             지식재산권 침해
		                         </div>
		                         <br />
		                         <div class="report_content" data-dismiss="modal" onclick="checkReport(event)">
		                             타인 사칭
		                         </div>
		                         <br />
		                         <div class="report_content" data-dismiss="modal" onclick="checkReport(event)">
		                             적절하지 않은 컨텐츠
		                         </div>
		                         <br />
		                         <div class="report_content" data-dismiss="modal" onclick="checkReport(event)">
		                             마음에 들지 않습니다
		                         </div>
		                         <br />
		                         <div
		                             class="report_content"
		                             data-dismiss="modal"
		                             data-bs-toggle="modal"
		                             data-bs-target="#detailReport"
		                         >
		                             직접 입력
		                         </div>
		                         <br />
		                     </div>
		                 </div>
		             </div>
		         </div>
		     </div>
			 <!-- 직접입력 모달 -->
			 <div
			      class="modal fade"
			      id="detailReport"
			      tabindex="-1"
			      aria-labelledby="exampleModalLabel"
			      aria-hidden="true"
			      data-backdrop="static"
			  >
			      <div class="modal-dialog">
			          <div class="modal-content modalstyle">
			              <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalLabel">신고 하기</h5>
			                  <button
			                      type="button"
			                      class="btn-close close_btn close_btn_style"
			                      data-bs-dismiss="modal"
			                      aria-label="Close"
			                  >
			                      X
			                  </button>
			              </div>
			              <div class="modal-body">
			                  <div>
			                      <div class="report_title" data-dismiss="modal">신고하는 이유</div>
			                      <br />
			                      <textarea
			                      	  id="detailReason"
			                          style="resize: none; width: 470px; height: 150px; border-radius: 0.5rem; color:black;"
			                      ></textarea>
			                  </div>
			                  <div class="btn-box">
			                      <button class="btn btn-primary" data-dismiss="modal" onclick="checkReport(event)">
			                          신고하기
			                      </button>
			                  </div>
			              </div>
			          </div>
			      </div>
			  </div>
		   
           <!-- 실시간 바 -->
           <div class="sub-content">
        	
           </div>
       </div>
   </div>
	<script>
	 function checkReport(e) {
		   var reportFno = $('#myfeedchoicemodal').val();
		   var value = e.target.innerText;
		   var dvalue = $('#detailReason').val();
		   if(dvalue != ""){
			   value = dvalue;
		   }
		   console.log(reportFno);
		   $('#detailReason').val("");
       swal({
           title: '정말로 신고하시겠습니까?',
           buttons: true,
           dangerMode: true,
       }).then((willDelete) => {
           if (willDelete) {
        	   
        	   $.ajax({
   			        url: '${contextPath}/insertReport.re',
   			        data: { ReportContent : value , ReportFno : reportFno},
   			        method: 'post',
   			        success: function(result) {
   			        	console.log(result);
   			        }
   			    });
        	   
               swal('신고가 정상적으로 접수되었습니다.', {});
           } else {
               swal('신고가 정상적으로 접수되지 않았습니다.');
           }
       });
   }
	
	
		const sendReply = $('#reply-send');
		sendReply.click(function(){
			const replyContent = $('#replyContent').val();
			const inputreply = $('#replyContent');
			var feedNo = $('#myfeedchoicemodal').val();
			console.log(feedNo,replyContent);
			var rep="";
			const reply = $('.reply-zone');
			$.ajax({
				  url: '${contextPath}/detailSendReply.myfeed',
		           data: { replyContent : replyContent , feedNo : feedNo },
		           method : 'post',
		           success: function (result) {
		        	   console.log(result);
		        	   let r = result;
		    	   		rep +="<dt>"+
	                         "<img src='${contextPath}/"+r.filePath+"/"+r.changeName+"'/>"+
	                            "<div class='reply-list'>"+
	                                "<span>"+r.userNick+"</span>"+
	                                "<span>"+r.replyContent+"</span>"+
	                            "</div>"+
	                        "</dt>";
	                        
	                     reply.prepend(rep);
	                     inputreply.val("");
		           }
			})
		})
		
		const sendReply2 = $('#reply-send2');
		sendReply2.click(function(){
			const replyContent = $('#replyContent2').val();
			const inputreply = $('#replyContent2');
			var feedNo = $('#myfeedchoicemodal').val();
			console.log(feedNo,replyContent);
			var rep="";
			const reply = $('.reply-zone');
			$.ajax({
				  url: '${contextPath}/detailSendReply.myfeed',
		           data: { replyContent : replyContent , feedNo : feedNo },
		           method : 'post',
		           success: function (result) {
		        	   console.log(result);
		        	   let r = result;
		    	   		rep +="<dt>"+
	                         "<img src='${contextPath}/"+r.filePath+"/"+r.changeName+"'/>"+
	                            "<div class='reply-list'>"+
	                                "<span>"+r.userNick+"</span>"+
	                                "<span>"+r.replyContent+"</span>"+
	                            "</div>"+
	                        "</dt>";
	                        
	                     reply.prepend(rep);
	                     inputreply.val("");
		           }
			})
		})
	</script>
  
   <script>
   	   function closeModal2(){
   		   location.href ="${contextPath}/MyFeed.me";
   	   }
       function toLogin() {
           location.href = '${contextPath}/logout.me';
       }
       function follow() {
           location.href = '${contextPath}/follow/followlist';
       }
       function myEdit() {
           location.href = '${contextPath}/MyEdit.me';
       }
       function myFeedEnroll() {
           location.href = '${contextPath}/MyFeedEnroll.me';
       }
       function myFeedEdit() {
    	   const num = $(".fileNum").text();
    	   console.log(num);
    	   location.href = '${contextPath}/MyFeedEdit.me?fno='+num;
           
       }
       AOS.init();
       $(document).ready(function () {
           const choice1 = $('.list1');
           const choice2 = $('.list2');
           const btn1 = $('#pro-btn3');
           choice1.removeClass('choice1');
           choice2.addClass('choice2');
           btn1.addClass('change');
       });
       
       function selected1() {
            const btn1 = $('#pro-btn3');
            const btn2 = $('#pro-btn4');
            const choice1 = $('.list1');
            const choice2 = $('.list2');

            btn1.addClass('change');
            btn2.removeClass('change');
            choice1.removeClass('choice1');
            choice2.addClass('choice2');
       }
       function selected2() {
            const btn1 = $('#pro-btn3');
            const btn2 = $('#pro-btn4');
            const choice1 = $('.list1');
            const choice2 = $('.list2');

            btn2.addClass('change');
            btn1.removeClass('change');
            choice1.addClass('choice1');
            choice2.removeClass('choice2');
       }
      

   </script>
   <script>
	$("#friends-search").on('keyup', () => {
		let follow = $("#friends-search").val();
		
		$.ajax({
			url : "/dot/chat/searchFollowList",
			data : {follow: follow},
			method : 'post',
			success : (data) => {
				console.log(data);
				
				$(".follower-list dl").empty();
				$(".follower-list dl").html(data);
				
			},
			error : console.log
		})
	})
   	
   	
    $(function() {
        
        const socketShare = new SockJS('http://localhost:8083/dot/websocket');
        const stompShareClient = Stomp.over(socketShare);
        
        stompShareClient.connect({}, frame => {
            console.log('Connected: ' + frame);
              
            let shareUserList = [];
            let shareRoomList = [];
            let feedNo;
            
            $(".shareFeed").on('click', (e) => {
               
          	 let focus = $(e.currentTarget);
          	  
               console.log("hi");
               
               feedNo = focus.find("input[name='feedNo']").val();
               
               console.log(feedNo);
            })
            
            $(".share-add").on('click', () => {
               
               
               $("input[name='userNo']:checked").each(function() {
                   shareUserList.push($(this).val());
               });
        
               $("input[name='shareRoom']:checked").each(function() {
                   shareRoomList.push($(this).val());
               });
     
               console.log("shareUserList: " + JSON.stringify(shareUserList));
               console.log("shareRoomList: " + JSON.stringify(shareRoomList));
     
               const shareList = {
                     "feedNo" : feedNo,
                     "userNo" : ${loginUser.userNo},
                     "shareUserList" : shareUserList,
                     "shareRoomList" : shareRoomList
                     };
               console.log(shareList);
               
               stompShareClient.send('/app/shareFeed/', {}, JSON.stringify(shareList));
               stompShareClient.disconnect();
               
               $(".share-close").click();
               $("input[name='userNo']:checked").prop("checked", false);
               $("input[name='shareRoom']:checked").prop("checked", false);
               shareUserList = [];
               shareRoomList = [];
            });
            
            
        });
      })
   
   
   
		const  select2 = () => {
   	    	jb1("#MyDetailFeed .slick-dots li").eq(0).click();
   		}    
	   function feedNo(e , no){
		   //e.stopPropagation();
		   console.log(no);
		   const imgNo = no;
	       const hearticon = $('.clickable-svg-heart');
	       const storeicon = $('.clickable-svg-store');
	       const checkstore = $('#check-store');
	       const checkfollow = $('#check-follow');
	       const feedContent = $('#modal-content');
	       const feedhash = $('#modal-hash');
	       jb1.ajax({
	           url: '${contextPath}/detail.myfeed',
	           data: { imgNo : imgNo },
	           success: function (result) {
	        	   console.log(result);
	        	   value ="";
	        	   value6="";
	        	   value7="";
	        	   value5="";
	        	   value4="";
	        	   value3="";
	               let html = "<div class='fileNum' style='display:none'>"+result[1].fileFno+"</div>"
	           		   html += "<div id='slick_feed'>";
	           		let result1 = 0;
	           	   for(let img of result){
           		   		if(img.changeName != "DotLogo_D.png" && img.fileLevel != 1){
			           		html += "<div>"
							html += "<img src=${contextPath}/"+img.filePath+"/"+img.changeName+">"
							html += "</div>"
							result1++;
           	   			}
	               }
	           	   var setting = "";
	           	   if(result[0].feedHashtag != null){
	           	   		setting= result[0].feedHashtag.split("#");
	           	   }
	           		html += "</div>"
	           	   	jb1(".feed-img").html(html);
	           		
	           		var inputNo = "<input type='hidden' name='feedNo' value="+ imgNo +">";
	           		value += "회원님의 게시글을 "+result[0].likeCount+"명이 좋아합니다."
	           		if(result[0].feedContent != null){
	           			value6 += "<b>"+result[0].userNick+"</b> " + result[0].feedContent;
	           		}else{
	           			value6 += "<b>"+result[0].userNick+"</b> ";
	           		}
	           		for(let i=1 ; i<setting.length ; i++ ){
	           			value7 += "<a class='hashTag-modal' href='${contextPath}/searchList.se?keyword="+setting[i]+"&&condition=feedHashtag'>#"+setting[i]+"</a>";
	           		}
	           		if(result[0].likeFno == 0){
		           		value3 += "<input type='hidden' id='myfeedchoicemodal' value='" + result[1].fileFno + "'>"+
		           				  "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='currentColor' class='bi bi-heart' viewBox='0 0 16 16'>"+
		                          "<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/>"+
		                    	  "</svg>";	  
	           		}else{
		                value3 += "<input type='hidden' id='myfeedchoicemodal' value=" + result[1].fileFno + ">"+
		                		  "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='red' class='bi bi-heart-fill animate__animated animate__rubberBand' viewBox='0 0 16 16'>"+
		                          "<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/>"+
		                    	  "</svg>";
	           		}
	           		if(result[0].choiceFno == 0){
		           		value4 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-plus-square' viewBox='0 0 16 16'>"+
	                              "<path d='M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>"+
	                              "<path d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/>"+
	                        	  "</svg>";	  
	           		}else{
	           			value4 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-check-square-fill animate__animated animate__flipInY' viewBox='0 0 16 16'>"+
	           	                  "<path d='M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z'/>"+
	                          	  "</svg>";	  
	           		}
	           		if(result[0].choiceFno == 0){
	           			value5 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-plus-square' viewBox='0 0 16 16'>"+
	                              "<path d='M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>"+
	                              "<path d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/>"+
	              	  			  "</svg>"+
	                    		  "<a>저장하기</a>";
	           		}else{
	           			value5 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-check-square-fill animate__animated animate__flipInY' viewBox='0 0 16 16'>"+
					              "<path d='M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z'/>"+
			    			      "</svg>"+   
								  "<a>저장됨</a>";
	           		}
	           		
	           		hearticon.empty();
		           	storeicon.empty();
		           	checkstore.empty();
		           	feedContent.empty();
		           	feedhash.empty();
		           	hearticon.append(value3);
		           	storeicon.append(value4);
		           	checkstore.append(value5);
		           	feedContent.append(value6);
		           	feedhash.append(value7);
	           		jb1("#modal-likeCount").html(value);
	           		$('.shareFeed').append(inputNo);
	           		
	           	if (result1 > 1) {
			       jb1('#slick_feed').slick({
			    	   	// Slick configuration options
			    	   	slidesToShow: 1,
			    	   	slidesToScroll: 1,
			    	   	arrows : true,
			    	   	dots:true
			    	   	// Add more options as needed
			    	 });
			       	 select2();
	           	 }
	       	   }
	        });
	       
	       const reply = $('.reply-zone');
	       var rep = "";
	       jb1.ajax({
	    	   url: '${contextPath}/detailreply.myfeed',
	           data: { imgNo : imgNo },
	           success: function (result) {
	    	   	console.log(result);
	    	   	for(let r of result){
	    	   		rep +="<dt>"+
                         "<img src='${contextPath}/"+r.filePath+"/"+r.changeName+"'/>"+
                            "<div class='reply-list'>"+
                                "<span>"+r.userNick+"</span>"+
                                "<span>"+r.replyContent+"</span>"+
                            "</div>"+
                        "</dt>";
	    	   	}
	    	   	reply.append(rep);
	           }
	       });
	       
	   }
   </script>
	<script>
		
		
		const  slick3 = () => {
   	    	jb1("#MyDetailFeed2 .slick-dots li").eq(0).click();
   		}    
	   function feedNo2(e , no){
		   //e.stopPropagation();
		   console.log(no);
	       const imgNo = no;
	       const hearticon = $('.clickable-svg-heart');
	       const storeicon = $('.clickable-svg-store');
	       const checkstore = $('#check-store2');
	       const checkfollow = $('#check-follow');
	       const feedContent = $('#modal-content2');
	       const feedhash = $('#modal-hash2');
	       const loginUserNo = "${loginUser.userNo}"; 
	       jb1.ajax({
	           url: '${contextPath}/detail.myfeed',
	           data: { imgNo : imgNo },
	           success: function (result) {
	        	   console.log(result);
	        	   value6="";
	        	   value7="";
	        	   value5="";
	        	   value4="";
	        	   value3="";
	        	   value2="";
	        	   value ="";
	        	   let result1 = 0;
	        	   let html = "<div class='fileNum' style='display:none'>"+result[0].fileFno+"</div>"
	           	   	   html += "<div id='slick_feed2'>";
	           	   var setting= result[0].feedHashtag.split("#");
	           	   for(let img of result){
          		   	if(img.changeName != "DotLogo_D.png" && img.fileLevel != 1){
			        	html += "<div>"
						html += "<img src=${contextPath}/"+img.filePath+"/"+img.changeName+">"
						html += "</div>"
						result1++;
          	   		}
	              }
	           	html += "</div>"
		        jb1(".feed-img2").html(html);
	           	var report = "<span class='material-symbols-outlined'> report </span>"+
                			 "<a>신고하기</a>";
	           	var inputNo = "<input type='hidden' name='feedNo' value="+ imgNo +">";
               	if(result[1].feedWriter != loginUserNo){
               		$(".reportabc").append(report);
               	}
	           	value += "회원님의 게시글을 "+result[0].likeCount+"명이 좋아합니다."
	           	value2 += "<img src=${contextPath}/"+result[0].filePath+"/"+result[0].changeName+">"+
           				  "<span style='margin-left: 20px;'>"+result[0].userNick+"</span>";	
     			value6 += "<b>"+result[0].userNick+"</b> " + result[0].feedContent;
     			for(let i=1 ; i<setting.length ; i++ ){
           			value7 += "<a class='hashTag-modal' href='${contextPath}/searchList.se?keyword="+setting[i]+"&&condition=feedHashtag'>#"+setting[i]+"</a>";
           		}
           		if(result[0].likeFno == 0){
	           		value3 += "<input type='hidden' id='myfeedchoicemodal' value='" + result[1].fileFno + "'>"+
	           				  "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='currentColor' class='bi bi-heart' viewBox='0 0 16 16'>"+
	                          "<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/>"+
	                    	  "</svg>";	  
           		}else{
	                value3 += "<input type='hidden' id='myfeedchoicemodal' value=" + result[1].fileFno + ">"+
	                		  "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='red' class='bi bi-heart-fill animate__animated animate__rubberBand' viewBox='0 0 16 16'>"+
	                          "<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/>"+
	                    	  "</svg>";
           		}
           		if(result[0].choiceFno == 0){
	           		value4 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-plus-square' viewBox='0 0 16 16'>"+
                              "<path d='M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>"+
                              "<path d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/>"+
                        	  "</svg>";	  
           		}else{
           			value4 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-check-square-fill animate__animated animate__flipInY' viewBox='0 0 16 16'>"+
           	                  "<path d='M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z'/>"+
                          	  "</svg>";	  
           		}
           		if(result[0].choiceFno == 0){
           			value5 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-plus-square' viewBox='0 0 16 16'>"+
                              "<path d='M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>"+
                              "<path d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/>"+
              	  			  "</svg>"+
                    		  "<a>저장하기</a>";
           		}else{
           			value5 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-check-square-fill animate__animated animate__flipInY' viewBox='0 0 16 16'>"+
				              "<path d='M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z'/>"+
		    			      "</svg>"+   
							  "<a>저장됨</a>";
           		}
           		
	           	jb1("#modal-likeCount2").html(value);
	           	jb1("#myChoiceModal").html(value2);
	           	hearticon.empty();
	           	storeicon.empty();
	           	checkstore.empty();
	           	feedContent.empty();
	           	feedhash.empty();
	           	hearticon.append(value3);
	           	storeicon.append(value4);
	           	checkstore.append(value5);
	           	feedContent.append(value6);
	           	feedhash.append(value7);
	           	$('.shareFeed').append(inputNo);
	           	
	           	 if (result1 > 1) {
			       jb1('#slick_feed2').slick({
			    	   	// Slick configuration options
			    	   	slidesToShow: 1,
			    	   	slidesToScroll: 1,
			    	   	arrows : true,
			    	   	dots:true
			    	   	// Add more options as needed
			    	 });
			       	 slick3();
	           	 }
	       	   }
	        });
	       
	       const reply = $('.reply-zone');
	       var rep = "";
	       jb1.ajax({
	    	   url: '${contextPath}/detailreply.myfeed',
	           data: { imgNo : imgNo },
	           success: function (result) {
	    	   	console.log(result);
	    	   	for(let r of result){
	    	   		rep +="<dt>"+
                         "<img src='${contextPath}/"+r.filePath+"/"+r.changeName+"'/>"+
                            "<div class='reply-list'>"+
                                "<span>"+r.userNick+"</span>"+
                                "<span>"+r.replyContent+"</span>"+
                            "</div>"+
                        "</dt>";
	    	   	}
	    	   	reply.append(rep);
	           }
	       });
	   }
   </script>
   <script>
	   const likeCount2 = (feedNo) => {
		    $.ajax({
		        url: '${contextPath}/mainFeed/likeCount',
		        data: { feedNo: feedNo },
		        method: 'post',
		        success: function (count) {
		        	 if (Array.isArray(count) && count.length > 0) {
		                 const likeCountValue = count[0].likeCount;
						console.log(feedNo);
		                 let html = "회원님의 게시글을 " + likeCountValue + "명이 좋아합니다.";
		                 $(".modal-likeCount3").html(html);
		        }
		        }
		    });
		}; 
	   const likeCount = (feedNo) => {
		    $.ajax({
		        url: '${contextPath}/mainFeed/likeCount',
		        data: { feedNo: feedNo },
		        method: 'post',
		        success: function (count) {
		        	 if (Array.isArray(count) && count.length > 0) {
		                 const likeCountValue = count[0].likeCount;
		                 console.log(feedNo);
		                 let html = "회원님의 게시글을 " + likeCountValue + "명이 좋아합니다.";
		                 $(".modal-likeCount2").html(html);
		        }
		        }
		    });
		}; 
   
	   $(".clickable-svg-heart").click(function(){
	       if($(this).find('.bi-heart').length == 0){
	          var feedNo = $('#myfeedchoicemodal').val();
	           $.ajax({
	               url: '${contextPath}/mainFeed/removeLike',
	               data: { feedNo: feedNo },
	               method: 'post',
	               success: function(result) {
	               	likeCount(feedNo);
	               	likeCount2(feedNo);
	               },
	               error: function(xhr, status, error) {
	                   // 오류 발생 시 실행할 코드
	                   console.error('오류 발생:', error);
	               }
	           });
	       }else{
	    	  var feedNo = $('#myfeedchoicemodal').val();
	           $.ajax({
	               url: '${contextPath}/mainFeed/addLike',
	               data: { feedNo: feedNo },
	               method: 'post',
	               success: function(result) {
	              		 likeCount(feedNo);
	              		likeCount2(feedNo);
	               },
	               error: function(xhr, status, error) {
	                   console.error('오류 발생:', error);
	               }
	           });
	       }
	    })  
	    
	    $(".clickable-svg-store1").click(function(e){
			 var storeSVG =
				    `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
				    fill="currentColor" class="bi bi-plus-square animate__animated animate__flipInY"
				    viewBox="0 0 16 16">
				    <path
				        d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
				    <path
				        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
				    </svg>`;

				var storeFillSVG =
				    `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-square-fill animate__animated animate__flipInY" viewBox="0 0 16 16">
				        <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"/>
				    </svg>`;
				    
				    

		    var currentBoxSVG = $(this).find("svg");
		    var parentContainer = $('.clickable-svg-store1');
		    const svgElement = parentContainer.find("svg");
		    const aElement = parentContainer.find('a');
			    
           if($(this).find('.bi-check-square-fill').length != 0){
        	   var feedNo = $('#myfeedchoicemodal').val();	
           	 
	             $.ajax({
                   url: '${contextPath}/mainFeed/removeChoice',
                   data: { feedNo: feedNo },
                   method: 'post',
                   success: function(result) {
                   	 currentBoxSVG.replaceWith(storeSVG);
                   	 svgElement.replaceWith(storeSVG);
                   	 aElement.replaceWith('<a>저장하기</a>');
                   	
                   },
                   error: function(xhr, status, error) {
                       // 오류 발생 시 실행할 코드
                       console.error('오류 발생:', error);
                   }
               });
           }else{
        	   var feedNo = $('#myfeedchoicemodal').val();
               
               $.ajax({
                   url: '${contextPath}/mainFeed/addChoice',
                   data: { feedNo: feedNo },
                   method: 'post',
                   success: function(result) {
                   	currentBoxSVG.replaceWith(storeFillSVG);
                   	svgElement.replaceWith(storeFillSVG);
                   	aElement.replaceWith('<a>저장됨</a>');
                   },
                   error: function(xhr, status, error) {
                       // 오류 발생 시 실행할 코드
                       console.error('오류 발생:', error);
                   }
               });
           }
           
        });    
	   var followerList = $('.follower-list');
	   var chattingList = $('.chatting-list');
	   var followBtn = $('.followBtn');
	   var chatBtn = $('.chatBtn');
	    
	    followBtn.click(() => {
	        followBtn.addClass('focus-btn');
	        chatBtn.removeClass('focus-btn');

	        followerList.css('display','block');
	        chattingList.css("display","none");
	    });

	    chatBtn.click(() => {
	        followBtn.removeClass('focus-btn');
	        chatBtn.addClass('focus-btn');

	        followerList.css('display','none');
	        chattingList.css("display","block");
	    });

   </script>
</body>
</html>