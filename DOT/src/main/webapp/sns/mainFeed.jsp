<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/MainFeed3.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick.css" />
     
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/MainFeed3.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- alert 스타일 변경-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!--  웹소켓 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/Header.jsp" />
		<div class="contents">
			<jsp:include page="../common/Sidebar.jsp" />
			<div class="main-content">
				<div class="main-wrap">
					<div class="feed-list">
					<input type="hidden" value="${loginUser.userNo }" id="myUserNo"/>
						<dl>
							<c:forEach var="i" items="${fd}">
								<c:forEach var="u" items="${mem}">
									<c:if test="${i.feedWriter == u.userNo}">
										<dt>
											<div class="feed-wrap">
												<div class="feed-header">
													<div class="user-profile">
														<div>
															<img src="${contextPath}/${u.filePath}/${u.changeName}" />
															<c:if test="${loginUser.userNo != u.userNo}">
																<span onclick="location.href='${contextPath}/YourFeed.me?uno=${u.userNo}'">${u.userNick}</span>
															</c:if>
															<c:if test="${loginUser.userNo == u.userNo}">
																<span onclick="location.href='${contextPath}/MyFeed.me'">${u.userNick}</span>
															</c:if>
														</div>
														<span class="material-symbols-outlined toggle-button"
															id="more-options-icon"> more_horiz </span>
														<div class="more-options">
															<div>
																<dl>
																	<dt>

																		<c:set var="div4">
																			<div class="choice-control-js">
																				<div class="initial-choice">
																					<svg xmlns="http://www.w3.org/2000/svg" width="20"
																						height="20" fill="currentColor"
																						class="bi bi-plus-square" viewBox="0 0 16 16">
                                                              						<path
																							d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                                             						 <path
																							d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                                         							 </svg>
																					<a>저장하기</a>
																				</div>
																				<input type="hidden" id="feedNo_${i.feedNo}"
																					value="${i.feedNo}" />
																			</div>
																		</c:set>
																		<c:forEach var="p" items="${ci}">
																			<c:if test="${i.feedNo == p.choiceFno}">
																				<c:if test="${p.choiceStatus eq 'Y'}">
																					<c:set var="div4">
																						<div class="choice-control-js">
																							<div class="clicked-choice">
																								<svg xmlns="http://www.w3.org/2000/svg"
																									width="20" height="20" fill="currentColor"
																									class="bi bi-check-square-fill animate__animated animate__flipInY"
																									viewBox="0 0 16 16">
                                                              										<path
																										d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z" />
                                                          											</svg>
																								<a>저장됨</a>
																							</div>
																							<input type="hidden" id="feedNo_${i.feedNo}"
																								value="${i.feedNo}" />
																						</div>
																					</c:set>
																				</c:if>
																			</c:if>
																			<c:if test="${i.feedWriter eq m.userNo} ">
																				<c:set var="div4">
																				</c:set>
																			</c:if>
																		</c:forEach>
																		<c:out value="${div4}" escapeXml="false" />
																	</dt>
																	<dt>
																		<c:if test="${i.feedWriter eq m.userNo}">
																			<c:set var="div5">
																			</c:set>
																		</c:if>

																		<c:forEach var="friendList" items="${friendList}">
																			<c:if
																				test="${(m.userNo eq friendList.friendUser1 && i.feedWriter eq friendList.friendUser2)&& (m.userNo eq friendList.friendUser2 && i.feedWriter eq friendList.friendUser1) }">
																				<c:set var="div5">
																					<div class="follow-control-js">
																						<div class="remove-follow">
																							<span class="material-symbols-outlined">person_remove</span>
																							<a>팔로우 취소</a>
																						</div>
																						<input type="hidden" id="feedNo_${i.feedNo}"
																							value="${i.feedWriter}" />
																					</div>
																				</c:set>
																			</c:if>
																			<c:if
																				test="${m.userNo eq friendList.friendUser2 && i.feedWriter eq friendList.friendUser1}">
																				<c:set var="div5">
																					<div class="follow-control-js">
																						<div class="remove-follow">
																							<span class="material-symbols-outlined">person_remove</span>
																							<a>팔로우 취소</a>
																						</div>
																						<input type="hidden" id="feedNo_${i.feedNo}"
																							value="${i.feedWriter}" />
																					</div>
																				</c:set>
																			</c:if>
																			<c:if
																				test="${m.userNo eq friendList.friendUser1 && i.feedWriter eq friendList.friendUser2}">
																				<c:set var="div5">
																					<div class="follow-control-js">
																						<div class="add-follow">
																							<span class="material-symbols-outlined">person_add</span>
																							<a>팔로우 추가</a>
																						</div>
																						<input type="hidden" id="feedNo_${i.feedNo}"
																							value="${i.feedWriter}" />
																					</div>
																				</c:set>
																			</c:if>

																		</c:forEach>
																		<c:out value="${div5}" escapeXml="false" />
																	</dt>
																	<c:if test="${i.feedWriter != m.userNo}">
																	<dt data-bs-toggle="modal" data-bs-target="#reportBtn1" onclick="thisFeed(${i.feedNo})">
																		<span class="material-symbols-outlined"> report
																		</span> <a>신고하기</a>
																	</dt>
																	</c:if>
																</dl>
															</div>
														</div>
													</div>
												</div>
												<div class="feed-body">
													<div class="feed-img">
														<c:forEach var="l" items="${fi}">
															<c:if test="${i.feedNo==l.fileFno}">
																<c:if test="${l.changeName != 'DotLogo_D.png'}">
																	<div>
																		<img src="${contextPath}/${l.filePath}/${l.changeName}" />
																	</div>
																</c:if>
															</c:if>
														</c:forEach>
													</div>
													<div class="body-bottom">
														<div class="feed-tools">

															<c:set var="div2">
																<div class="feed-control-js">
																	<div class="clickable-svg initial-heart">
																		<svg xmlns="http://www.w3.org/2000/svg" width="25"
																			height="25" fill="currentColor" class="bi bi-heart"
																			viewBox="0 0 16 16">
                                                       						<path
																				d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                                       					 </svg>
																	</div>
																	<input type="hidden" id="feedNo_${i.feedNo}"
																		value="${i.feedNo}" />
																</div>
															</c:set>
															<c:forEach var="o" items="${lk}">
																<c:if test="${i.feedNo == o.likeFno}">
																	<c:if test="${o.likeStatus eq 'Y'}">
																		<c:set var="div2">
																			<div class="feed-control-js">
																				<div class="clickable-svg clicked-heart">
																					<svg xmlns="http://www.w3.org/2000/svg" width="25"
																						height="25" fill="red"
																						class="bi bi-heart-fill" viewBox="0 0 16 16">
                                                               							 <path
																							d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                                                              						 </svg>
																				</div>
																				<input type="hidden" id="feedNo_${i.feedNo}"
																					value="${i.feedNo}" />
																			</div>
																		</c:set>
																	</c:if>
																</c:if>
															</c:forEach>
															<c:out value="${div2}" escapeXml="false" />

															<div class="clickable-svg shareFeed"
																data-bs-toggle="modal" data-bs-target="#shareToolMain">
																<input type="hidden" name="feedNo" value="${i.feedNo }" />
																<svg xmlns="http://www.w3.org/2000/svg" width="20"
																	height="20" fill="currentColor" class="bi bi-share"
																	viewBox="0 0 16 16">
                                                        		<path
																		d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                                                    			</svg>
															</div>

															<div class="clickable-svg">

																<c:set var="div3">
																	<div class="choice-control-js">
																		<div class="clickable-svg initial-choice">
																			<svg xmlns="http://www.w3.org/2000/svg" width="23"
																				height="23" fill="currentColor"
																				class="bi bi-plus-square" viewBox="0 0 16 16">
                                                              				<path
																					d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                                              				<path
																					d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                                          					</svg>
																		</div>
																		<input type="hidden" id="feedNo_${i.feedNo}"
																			value="${i.feedNo}" />
																	</div>
																</c:set>
																<c:forEach var="p" items="${ci}">
																	<c:if test="${i.feedNo == p.choiceFno}">
																		<c:if test="${p.choiceStatus eq 'Y'}">
																			<c:set var="div3">
																				<div class="choice-control-js">
																					<div class="clickable-svg clicked-choice">
																						<svg xmlns="http://www.w3.org/2000/svg" width="23"
																							height="23" fill="currentColor"
																							class="bi bi-check-square-fill animate__animated animate__flipInY"
																							viewBox="0 0 16 16">
                                                              							<path
																								d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z" />
                                                          								</svg>
																					</div>
																					<input type="hidden" id="feedNo_${i.feedNo}"
																						value="${i.feedNo}" />
																				</div>
																			</c:set>
																		</c:if>
																	</c:if>
																</c:forEach>
																<c:out value="${div3}" escapeXml="false" />

															</div>
														</div>
														<div class="feed-text feed-text_${i.feedNo} ">
															<span> 해당 게시글을 ${i.likeCount}명이 좋아합니다. </span> <br>
														</div>
														<div class="feed-content">
															<span class="bold"> <c:forEach var="m"
																	items="${pf}">
																	<c:if test="${i.feedWriter==m.userNo}">
																		<b>${m.userNick}</b>
																	</c:if>
																</c:forEach> ${i.feedContent}
															</span> <br>
															<c:if test="${i.feedHashtag != null}">
																<c:set var="setting" value="${fn:split(i.feedHashtag,'#')}"/>
																<c:forEach var="hs" items="${setting}">
																<span> 
																	<a class="main-HashTag" href="${contextPath}/searchList.se?keyword=${hs}&&condition=feedHashtag">#${hs} </a>
																</span>
																</c:forEach>
															</c:if>
														</div>
													</div>
												</div>
												<div class="feed-footer">
													<div class="reply-wrap">
														<div class="reply-top">
															<button data-feedNo="${i.feedNo} ">댓글 더보기</button>
														</div>
														
														<div class="reply-middle reply-feed-middle">
															<dl>
																<dt class="output output1_${i.feedNo}">
																	<div>
																		<span style="font-size:13px; color:gray;">등록된 댓글이 없습니다.</span>
																	</div>
																</dt>
																
																<c:if test="${not empty rp }">
																	<c:set var="loop_flag" value="false" />
																	<c:forEach var="n" items="${rp}">
																		<c:if test="${not loop_flag }">
																		<c:if test="${i.feedNo == n.replyFno}">
																			<script>
																				$(".output1_${i.feedNo}").empty();
																			</script>
																			<dt class="output output1_${i.feedNo }">
																				<img
																					src="${contextPath}/${n.filePath}/${n.changeName}" />
																				<div class="reply-list">
																					<span>${n.userNick }</span> <span>${n.replyContent }</span>
																				</div>
																			</dt>
																			<c:set var="loop_flag" value="true" />
																		</c:if>
																		 </c:if>
																	</c:forEach>
																</c:if>
															</dl>
														</div>
														<input class="feedNo" type="hidden" value="${i.feedNo}" />
														<div class="reply-bottom">
															<input type="text" class="insertReply"
																placeholder="댓글을 입력하세요." />
															<button class="reply_input" value="${i.feedNo}">답글</button>
														</div>
													</div>
												</div>
											</div>
										</dt>
									</c:if>
								</c:forEach>
							</c:forEach>

						</dl>
					</div>
				</div>
			</div>
			 <div class="sub-content">
                    <div class="sub-wrap">
                        <div class="sub-container">
                            <div class="sub-recommand">
                                <div class="sub-title">
                                    <span>회원님을 위한 추천</span>
                                </div>
	                                <div class="result-content-area">
	                                  <c:if test="${rf ne null }">
                             		  <c:forEach var ="i" items="${rf}">
	                                    <div class="result-content">
	                                        <dl class="follow-list">
	                                            <dt class="follow-img" onclick="location.href='${contextPath}/YourFeed.me?uno=${i.userNo}'">
	                                                <img src='${contextPath}/${i.filePath}/${i.changeName}' /> 
	                                            </dt>
	                                            <dt class="follow-id" onclick="location.href='${contextPath}/YourFeed.me?uno=${i.userNo}'">
	                                                <div class="user-id">
	                                                    <span>${i.userNick }</span>
	                                                </div>
	                                                <div class="user-nickname">
	                                                    <span>${i.userName }</span>
	                                                </div>
	                                            </dt>
	                                            <dt class="follow-btn1">
	                                                <button class="follow-btn10 follower-btn" id="f-btn1_${i.userNo}" onclick="follow(event,${i.userNo})" value="${i.userNo}"><h6>팔로우</h6></button>
	                                                <button class="follow-btn10 follower-btn" id="f-btn2_${i.userNo}" onclick="unfollow(event,${i.userNo})" value="${i.userNo}" style="display:none; color:white;"><h6>팔로잉</h6></button>
	                                            </dt>
	                                        </dl>
	                                    </div>
                              		  </c:forEach> 
                              		  </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>

	<!-- FeedDetail Modal -->
	<div class="modal fade" id="feedDetail" tabindex="-1"
		aria-bs-labelledby="feedDetailLabel" aria-bs-hidden="true"></div>

	<!-- Share Modal -->
	<div class="modal fade" id="shareToolMain" tabindex="-1"
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
							<span class="followBtn focus-btn">팔로워</span> <span
								class="chatBtn">채팅방</span>
						</div>
						<div class="lists">
							<div class="follower-list">
								<div>
									<dl>
										<c:if test="${empty follow }">
											<div class="empty-follow-info">
												<div class="empty-follow">
													<span>존재하는 팔로우가 없습니다.</span>
												</div>
											</div>
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
											<div class="empty-follow-info">
												<div class="empty-follow">
													<span>존재하는 채팅방이 없습니다.</span>
												</div>
											</div>
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
         id="reportBtn1"
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
                 <div class="modal-body reportFno">
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
                             data-bs-target="#detailReport1"
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
	      id="detailReport1"
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

		<script>
			function thisFeed(no){
				console.log(no);
				var inputFno = "<input type='hidden' value="+no+" id='reportFno'>";
				$('.reportFno').append(inputFno);
			}
		   function checkReport(e) {
			   var reportFno = $("#reportFno").val();
			   var value = e.target.innerText;
			   var dvalue = $('#detailReason').val();
			   if(dvalue != ""){
				   value = dvalue;
			   }
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
		
		
		$('.reply_input').click(function () {
		    const parentContainer = $(this).closest('.reply-bottom');
		    const inputElement = parentContainer.find('input');
		    const replyContent = inputElement.val();
		    const feedNo = $(this).val(); 
		    
		    $.ajax({
		        url: '${contextPath}/mainFeed/insertReply',
		        data: {
		            replyContent: replyContent,
		            replyFno: feedNo
		        },
		        method: 'post',
		        success: function(result) {
		        	selectReplyList(feedNo);
		        },
		        complete: function (result) {
		            inputElement.val('');
		        }
		    });
		});
		
		const selectReplyList = (feedNo) => {
			$.ajax({
				url : '${contextPath}/mainFeed/selectReplyList',
				data: {bno : feedNo },
				method : 'get',
				success : function(replyList){
					console.log(replyList);
					let html= "";
					for(let reply of replyList){
					html= 
						"<img src='" + '${contextPath}/' + reply.filePath + '/' + reply.changeName + "' />" +
		                "<div class='reply-list'>" +
						"<span>" + reply.userNick +"</span><span>"+ reply.replyContent + "</span>"+
						"</div>";
					}
					$(".output1_"+feedNo).empty();
					$(".output1_"+feedNo).html(html);
				}
			})
		}; 
		
		
	         
	      const likeCount = (feedNo) => {
			    $.ajax({
			        url: '${contextPath}/mainFeed/likeCount',
			        data: { feedNo: feedNo },
			        method: 'post',
			        success: function (count) {
			        	 if (Array.isArray(count) && count.length > 0) {
			                 const likeCountValue = count[0].likeCount;

			                 let html = "<span> 해당 게시글을 " + likeCountValue + "명이 좋아합니다. </span> <br>";
			                 $(".feed-text_" + feedNo).html(html);
			        }
			        }
			    });
			}; 
			
			 $(".choice-control-js").click(function(e){
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
			    var parentContainer = $(this).closest('.feed-wrap').find('.choice-control-js');
			    const svgElement = parentContainer.find("svg");
			    const aElement = parentContainer.find('a');
				    
	            if($(this).find('.bi-check-square-fill').length != 0){
	            	 const feedNo = $(this).find('input').val();
	            	 console.log(feedNo);
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
	               const feedNo = $(this).find('input').val();
	               console.log(feedNo);
	                $.ajax({
	                    url: '${contextPath}/mainFeed/addChoice',
	                    data: { feedNo: feedNo },
	                    method: 'post',
	                    success: function(result) {
	                    	console.log(result);
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

				 $(".follow-control-js").click(function(){
				 var followDIV = $(this).find("div");
				 var addfollow = `<div class="add-follow">
	                 <span class="material-symbols-outlined">person_add</span> 
	                 <a>팔로우 추가</a>
	             </div>`;
	             var removefollow = `<div class="remove-follow">
	                 <span class="material-symbols-outlined">person_remove</span> 
	                 <a>팔로우 취소</a>
	             </div>`;
            
			            if($(this).find('.remove-follow').length != 0){
			               const userNo = $(this).find('input').val();
			                
			                $.ajax({
			                    url: '${contextPath}/mainFeed/unfollow',
			                    data: { userNo: userNo },
			                    method: 'post',
			                    success: function(result) {
			                    	followDIV.replaceWith(addfollow);
			                    },
			                    error: function(xhr, status, error) {
			                        console.error('오류 발생:', error);
			                    }
			                });
			            }else{
			               const userNo = $(this).find('input').val();
			                
			                $.ajax({
			                    url: '${contextPath}/mainFeed/addfollow',
			                    data: { userNo: userNo },
			                    method: 'post',
			                    success: function(result) {
			                    	followDIV.replaceWith(removefollow);
			                    },
			                    error: function(xhr, status, error) {
			                        console.error('오류 발생:', error);
			                    }
			                });
			                
			                const myNo = $('#myUserNo').val();
	         		       stompClient.send("/app/updateFollowStatus", {}, JSON.stringify({
	         		        	userNo: userNo,
	         		        	userNo2 : myNo
	         		        }));
			            }
			         });         
		</script>
        
        </div>
    </div>


    
	   
   
    <script>
          AOS.init();
    </script>
     <script>
		 	//웹소켓 연결(웹 브라우저에서 실행)
		    const socketLike = new SockJS("http://localhost:8083${contextPath}/websocket"); //URL에 대한 WebSocket 연결을 설정
		    const stompLike = Stomp.over(socketLike); //WebSocket을 통해 Stomp 클라이언트를 생성
		    $(".feed-control-js").click(function(){
	            if($(this).find('.bi-heart').length != 0){
	               const feedNo = $(this).find('input').val();
	                
	                $.ajax({
	                    url: '${contextPath}/mainFeed/removeLike',
	                    data: { feedNo: feedNo },
	                    method: 'post',
	                    success: function(result) {
	                    	likeCount(feedNo);
	                    },
	                    error: function(xhr, status, error) {
	                        // 오류 발생 시 실행할 코드
	                        console.error('오류 발생:', error);
	                    }
	                });
	            }else{
	               const feedNo = $(this).find('input').val();
	                
	                $.ajax({
	                    url: '${contextPath}/mainFeed/addLike',
	                    data: { feedNo: feedNo },
	                    method: 'post',
	                    success: function(result) {
	                   		 likeCount(feedNo);
	                    },
	                    error: function(xhr, status, error) {
	                        console.error('오류 발생:', error);
	                    }
	                });
	               	const myNo = $('#myUserNo').val();
	            	const userNo = feedNo;
	                stompClient.send("/app/updateLikeStatus", {}, JSON.stringify({
	    	        	userNo: userNo,
	    	        	userNo2 : myNo
	    	        }));
	                
	            }
	         })         
		 
    	
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
        
        const socketShare = new SockJS('http://localhost8083/dot/websocket');
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
   	
   	
    $(".reply-top>button").on('click',(e) => {
        
        const fd = $(e.currentTarget);
        let feedNo = fd[0].dataset.feedno;

        if(feedNo != undefined) {
//            console.log(feedNo);
           
           $.ajax({
              url : '/dot/chat/shareFeed',
              data : {feedNo : feedNo},
              method : 'post',
              success : (data) => {
                 //$("#feedDetail").empty();
                 $("#feedDetail").html(data);
                 
                 if($("#feedDetail").find('.feed-img').children().length != 1) {
                    
                    jb1("#feedDetail").find('.feed-img').slick({
                        // Slick configuration options
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        arrows : true,
                        dots:true
                        // Add more options as needed
                      });
                    $("#feedDetail").find('.slick-dots').children()[0].click();
                 }
                 
                 $("#feedDetail").modal('show');
              },
              error : console.log
           })
        }
     })
   	
   	</script>
    <script>
        //사이드바 친구추천
         const socketFollow5 = new SockJS("http://localhost8083${contextPath}/websocket"); //URL에 대한 WebSocket 연결을 설정
        const stompFollow5 = Stomp.over(socketFollow5); //WebSocket을 통해 Stomp 클라이언트를 생성
        function follow(e,no){
        	const myNo = $('#myUserNo').val();
        	const userNo = $('#f-btn2_'+no).val();
 			const clickbtn = $('#f-btn1_'+no);
 			const clickbtn2 = $('#f-btn2_'+no);
			    $.ajax({
	                url: '${contextPath}/follow/followlist/addfollow',
	                data: { userNo: userNo },
	                method: 'post',
	                success(result) {
	                    // 처리 로직
	                    clickbtn.css("display", "none");
	                    clickbtn2.css("display","block");
	                }
	            });
 			console.log(userNo);
	        stompClient.send("/app/updateFollowStatus", {}, JSON.stringify({
	        	userNo: userNo,
	        	userNo2 : myNo
	        }));
	    };
		
        function unfollow(e,no){
        	console.log(e,no);
        	const userNo = $('#f-btn2_'+no).val();
 			const clickbtn = $('#f-btn1_'+no);
 			const clickbtn2 = $('#f-btn2_'+no);
		    $.ajax({
		        url: '${contextPath}/follow/followlist/unfollow',
		        data: { userNo: userNo },
		        method: 'post',
		        success(result) {
		            // AJAX 요청 성공 처리
		        	clickbtn.css("display", "block");
                    clickbtn2.css("display","none");
		        }
		    });
        }
        
        </script>
      
</body>
</html>