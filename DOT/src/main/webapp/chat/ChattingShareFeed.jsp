<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- FeedDetail Modal -->

<!-- FeedDetail Modal -->
<div class="modal-dialog modal-xl chatting-share-modal">
	<div class="modal-content">
		<div class="modal-header modal-backgound">
			<div class="modal-title" id="feedDetail">
				<div class="feed-header modal-feed-header">
					<div class="modal-user-profile">
					<input type="hidden" value="${loginUser.userNo }" id="myUserNo"/>
						<div>
							<img
								src="${contextPath }/${feedWriter.filePath}/${feedWriter.changeName}" />
							<span>${feedWriter.userNick }</span>
						</div>
						<span class="material-symbols-outlined modal-toggle-button">
							more_horiz </span>
						<div class="modal-more-options">
							<div>
								<dl>
									<c:if test="${feedWriter.userNo == loginUser.userNo }">
										<dt>
											<span class="material-symbols-outlined"> edit </span> <a>수정하기</a>
										</dt>
									</c:if>
									<dt>
										<div class="clickable-svg storeFeed">

											<c:set var="selectChoice">
												<svg xmlns="http://www.w3.org/2000/svg" width="25"
													height="25" fill="currentColor" class="bi bi-plus-square"
													viewBox="0 0 16 16">
                                                          <path
														d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                                          <path
														d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                                      </svg>
												<a>저장하기</a>
											</c:set>

											<c:if test="${!empty choice }">
												<c:forEach var="choice" items="${choice}">
													<c:if test="${choice.choiceFno eq feed.feedNo }">
														<c:set var="selectChoice">
															<svg xmlns="http://www.w3.org/2000/svg" width="20"
																height="20" fill="currentColor"
																class="bi bi-check-square-fill animate__animated animate__flipInY"
																viewBox="0 0 16 16">
                                                              <path
																	d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z" />
                                                          </svg>
															<a>저장됨</a>
														</c:set>
													</c:if>
												</c:forEach>
											</c:if>
											<c:out value="${selectChoice }" escapeXml="false" />

											<input type="hidden" id="feedNo_${feed.feedNo}"
												value="${feed.feedNo}" />
										</div>
									</dt>

									<dt>

										<c:if test="${feed.feedWriter eq m.userNo}">
											<c:set var="div5">
											</c:set>
										</c:if>

										<c:forEach var="friendList" items="${friendList}">
											<c:if
												test="${(loginUser.userNo eq friendList.friendUser1 && feed.feedWriter eq friendList.friendUser2)&& (loginUser.userNo eq friendList.friendUser2 && feed.feedWriter eq friendList.friendUser1) }">
												<c:set var="div5">
													<div class="follow-control-js">
														<div class="remove-follow">
															<span class="material-symbols-outlined">person_remove</span>
															<a>팔로우 취소</a>
														</div>
														<input type="hidden" id="feedNo_${feed.feedNo}"
															value="${feed.feedWriter}" />
													</div>
												</c:set>
											</c:if>
											<c:if
												test="${loginUser.userNo eq friendList.friendUser2 && feed.feedWriter eq friendList.friendUser1}">
												<c:set var="div5">
													<div class="follow-control-js">
														<div class="remove-follow">
															<span class="material-symbols-outlined">person_remove</span>
															<a>팔로우 취소</a>
														</div>
														<input type="hidden" id="feedNo_${feed.feedNo}"
															value="${feed.feedWriter}" />
													</div>
												</c:set>
											</c:if>
											<c:if
												test="${loginUser.userNo eq friendList.friendUser1 && feed.feedWriter eq friendList.friendUser2}">
												<c:set var="div5">
													<div class="follow-control-js">
														<div class="add-follow">
															<span class="material-symbols-outlined">person_add</span>
															<a>팔로우 추가</a>
														</div>
														<input type="hidden" id="feedNo_${feed.feedNo}"
															value="${feed.feedWriter}" />
													</div>
												</c:set>
											</c:if>

										</c:forEach>
										<c:out value="${div5}" escapeXml="false" />
									</dt>
									<c:if test="${feed.feedWriter != loginUser.userNo}">
										<dt data-bs-toggle="modal" data-bs-target="#reportBtn" onclick="thisFeed(${feed.feedNo})">
											<span class="material-symbols-outlined"> report </span> <a>신고하기</a>
										</dt>
									</c:if>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-body modal-backgound">
			<div class="modal-feed-body">
				<div class="feed-img">
					<c:forEach var="img" items="${img }">
						<c:if test="${img.changeName != 'DotLogo_D.png'}">
							<div>
								<img src="${contextPath }/${img.filePath}/${img.changeName}" />
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="body-bottom">
					<div class="feed-tools">
						<div class="clickable-svg likeFeed">

							<c:set var="selectLike">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
									fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                           <path
										d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                </svg>
							</c:set>
							<c:if test="${!empty like }">
								<c:forEach var="like" items="${like}">
									<c:if test="${like.likeFno eq feed.feedNo }">
										<c:set var="selectLike">
											<svg xmlns="http://www.w3.org/2000/svg" width="25"
												height="25" fill="red" class="bi bi-heart-fill"
												viewBox="0 0 16 16">
                                        <path
													d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                                       </svg>
										</c:set>
									</c:if>
								</c:forEach>
							</c:if>
							<c:out value="${selectLike }" escapeXml="false" />

							<input type="hidden" id="feedNo_${feed.feedNo}"
								value="${feed.feedNo}" />
						</div>
						<div class="clickable-svg shareFeed" data-bs-toggle="modal"
							data-bs-target="#shareTool">
							<input type="hidden" name="feedNo" value="${feed.feedNo }" />
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
								fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
                                        <path
									d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                                    </svg>
						</div>
						<div class="clickable-svg storeFeed">

							<c:set var="selectChoice">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
									fill="currentColor" class="bi bi-plus-square"
									viewBox="0 0 16 16">
                                                          <path
										d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                                          <path
										d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                                      </svg>
							</c:set>

							<c:if test="${!empty choice }">
								<c:forEach var="choice" items="${choice}">
									<c:if test="${choice.choiceFno eq feed.feedNo }">
										<c:set var="selectChoice">
											<svg xmlns="http://www.w3.org/2000/svg" width="20"
												height="20" fill="currentColor"
												class="bi bi-check-square-fill animate__animated animate__flipInY"
												viewBox="0 0 16 16">
                                                              <path
													d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z" />
                                                          </svg>
										</c:set>
									</c:if>
								</c:forEach>
							</c:if>
							<c:out value="${selectChoice }" escapeXml="false" />

							<input type="hidden" id="feedNo_${feed.feedNo}"
								value="${feed.feedNo}" />
						</div>
					</div>
					<div class="feed-text feed-text${feed.feedNo }">
						<span> 해당 게시글을 ${feed.likeCount }명이 좋아합니다. </span> <br>
						<span><b>${feedWriter.userNick }</b>${feed.feedContent}</span> <br>
						<c:if test="${feed.feedHashtag != null}">
							<c:set var="setting" value="${fn:split(feed.feedHashtag,'#')}"/>
							<c:forEach var="hs" items="${setting}">
								<span> <a class="main-HashTag" href="${contextPath}/searchList.se?keyword=${hs}&&condition=feedHashtag">#${hs}</a></span>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<div class="modal-feed-footer">
				<div class="reply-wrap">
					<div class="reply-middle">
						<dl>
							<c:if test="${empty reply }">
								<div class="noReply">
									<span>현재 댓글이 존재하지 않습니다.</span>
								</div>
							</c:if>
							<c:if test="${!empty reply }">
								<c:forEach var="reply" items="${reply }">
									<dt class="output output_${reply.replyFno }">
										<img
											src="${contextPath }/${reply.filePath}/${reply.changeName}" />
										<div class="reply-list">
											<span>${reply.userNick }</span> <span>${reply.replyContent }</span>
										</div>
									</dt>
								</c:forEach>
							</c:if>
						</dl>
					</div>
					<div class="reply-bottom">
						<input type="text" class="insertReply" placeholder="댓글을 입력하세요." />
						<button class="reply_input" value="${feed.feedNo}">답글</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Share Modal -->
<div class="modal fade shareTool" id="shareTool" tabindex="-1"
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

<script>
	$("#friends-search").on('keyup', () => {
		let follow = $("#friends-search").val();
		
		$.ajax({
			url : "/dot/chat/searchFollowList",
			data : {follow: follow},
			method : 'post',
			success : (data) => {
				$(".follower-list dl").empty();
				$(".follower-list dl").html(data);
			},
			error : console.log
		})
	})

    var followerList = $('.follower-list');
    var chattingList = $('.chatting-list');

    chattingList.css("display","none");

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

<script>
	$(function() {
    	
	    const socket = new SockJS('http://localhost:8083/dot/websocket');
		const stompClient = Stomp.over(socket);
		
		stompClient.connect({}, frame => {
		    console.log('Connected: ' + frame);
		   	
		    let shareUserList = [];
		    let shareRoomList = [];
		    let feedNo;
		    
		    $(".shareFeed").on('click', () => {
		    	
		    	console.log("hi");
		    	
		    	feedNo = $(this).find("input[name='feedNo']").val();
		    	
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
		    	
			    stompClient.send('/app/shareFeed/', {}, JSON.stringify(shareList));
			    stompClient.disconnect();
			    
			    $(".share-close").click();
			    $("input[name='userNo']:checked").prop("checked", false);
			    $("input[name='shareRoom']:checked").prop("checked", false);
			    shareUserList = [];
			    shareRoomList = [];
		    });
		});
    })
</script>

<script>
   $(function() {
       (
          function(){
             const display = $(".reply-middle>dl")[0];
             
             if(display != null){
                display.scrollTop = display.scrollHeight;
             }
          }
       )();
      
       $('.modal .reply_input').on('click', function () {
          modalSendReply($(this));
       });
       $('.modal .insertReply').on('keydown', function (event) {
           if (event.which === 13) { // 엔터 키(키 코드 13)를 눌렀을 때
              modalSendReply($(this));
           }
      });
             function modalSendReply(e) {
                const parentContainer = e.closest('.reply-bottom');
                const inputElement = parentContainer.find('input');
                const replyContent = inputElement.val();
                const feedNo = parentContainer.find("button").val(); 
                
                console.log("modalReply")
                
                $.ajax({
                    url: '${contextPath}/mainFeed/insertReply',
                    data: {
                        replyContent: replyContent,
                        replyFno: feedNo
                    },
                    method: 'post',
                    success: function (result) {
                       modalSelectReplyList(feedNo);
                       
                    },
                    complete: function (result) {
                        inputElement.val('');
                    }
                });
            };
            
            function modalSelectReplyList(feedNo) {
               $.ajax({
                  url : '${contextPath}/mainFeed/selectReplyList',
                  data: {bno : feedNo },
                  method : 'get',
                  success : function(replyList){
                     console.log(replyList)
                     let reply = replyList[replyList.length-1]; 
                     let html= 
                        "<dt class='output'>"+
                        "<img src='" + '${contextPath}/' + reply.filePath + '/' + reply.changeName + "' />" +
                            "<div class='reply-list'>" +
                        "<span>" + reply.userNick +"</span><span>"+ reply.replyContent + "</span>"+
                        "</div></dt>";
                        let html1= 
                           "<img src='" + '${contextPath}/' + reply.filePath + '/' + reply.changeName + "' />" +
                               "<div class='reply-list'>" +
                           "<span>" + reply.userNick +"</span><span>"+ reply.replyContent + "</span>"+
                           "</div>";
                     $(".feed-wrap .output1_"+feedNo).eq(0).html(reply ? html1 : "").siblings().remove();
                     $(".modal .output_"+feedNo).parent().prepend(html);
                  }
               })
            };  
          //웹소켓 연결(웹 브라우저에서 실행)
		    const socketLike = new SockJS("http://localhost:8083${contextPath}/websocket"); //URL에 대한 WebSocket 연결을 설정
		    const stompLike = Stomp.over(socketLike); //WebSocket을 통해 Stomp 클라이언트를 생성
               
              $(".modal .likeFeed").click(function(){
                 
                  var heartSVG =
                   '<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart  animate__animated animate__rubberBand" viewBox="0 0 16 16">' +
                   '    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>' +
                   '</svg>';

               var heartFillSVG =
                       '<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="red" class="bi bi-heart-fill animate__animated animate__rubberBand" viewBox="0 0 16 16">' +
                       '    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>' +
                       '</svg>';
                 
                var parentContainer = $(this).closest('body').find('.modal .likeFeed');
                const svgElement = parentContainer.find("svg");
                  const feedContainer = $(this).closest('body').find('.feed-wrap .feed-control-js');
                  const feedsvgElement = feedContainer.find("svg");

                     if(svgElement.hasClass("bi-heart-fill")){
                        const feedNo = $(this).find('input').val();
                         
                         $.ajax({
                             url: '${contextPath}/mainFeed/removeLike',
                             data: { feedNo: feedNo },
                             method: 'post',
                             success: function(result) {
                                modalLikeCount(feedNo);
                                 svgElement.replaceWith(heartSVG);
                                 feedsvgElement.replaceWith(heartSVG);
                             },
                             error: function(xhr, status, error) {
                                 // 오류 발생 시 실행할 코드
                                 console.error('오류 발생:', error);
                             }
                         });
                     }else if (svgElement.hasClass("bi-heart")){
                        const feedNo = $(this).find('input').val();
                         
                         $.ajax({
                             url: '${contextPath}/mainFeed/addLike',
                             data: { feedNo: feedNo },
                             method: 'post',
                             success: function(result) {
                                modalLikeCount(feedNo);
                                 svgElement.replaceWith(heartFillSVG);
                                 feedsvgElement.replaceWith(heartFillSVG);
                             },
                             error: function(xhr, status, error) {
                                 console.error('오류 발생:', error);
                             }
                         });
                         
                      	const myNo = $('#myUserNo').val();
    	            	const userNo = feedNo;
    	            	stompLike.send("/app/updateLikeStatus", {}, JSON.stringify({
    	    	        	userNo: userNo,
    	    	        	userNo2 : myNo
    	    	        }));
                     }
                  })         
                  
               function modalLikeCount(feedNo) {
                   $.ajax({
                       url: '${contextPath}/mainFeed/likeCount',
                       data: { feedNo: feedNo },
                       method: 'post',
                       success: function (count) {
                           if (Array.isArray(count) && count.length > 0) {
                                const likeCountValue = count[0].likeCount;

                                let html = "<span> 해당 게시글을 " + likeCountValue + "명이 좋아합니다. </span>";
                                $(".main-content .feed-text_" + feedNo).html(html);
                                $(".modal .feed-text" + feedNo + ">span").eq(0).html(html);
                       }
                       }
                   });
               }; 
               
               
               $(".modal .storeFeed").click(function(e){
                   var storeSVG =
                         `<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                         fill="currentColor" class="bi bi-plus-square animate__animated animate__flipInY"
                         viewBox="0 0 16 16">
                         <path
                             d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                         <path
                             d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                         </svg>`;

                     var storeFillSVG =
                         `<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check-square-fill animate__animated animate__flipInY" viewBox="0 0 16 16">
                             <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"/>
                         </svg>`;

                   var currentBoxSVG = $(this).find("svg");
                   var parentContainer = $(this).closest('body').find('.modal .storeFeed');
                   const svgElement = parentContainer.find("svg");
                   const aElement = parentContainer.find('a');
                   
                   var feedParentContainer = $(this).closest('body').find('.main-content .choice-control-js');
                   const feedSvgElement = feedParentContainer.find("svg");
                   const feedAElement = feedParentContainer.find('a');
                      
                     if($(this).find('.bi-check-square-fill').length != 0){
                         const feedNo = $(this).find('input').val();
                         console.log($(this))
                         
                         $.ajax({
                             url: '${contextPath}/mainFeed/removeChoice',
                             data: { feedNo: feedNo },
                             method: 'post',
                             success: function(result) {
                                 currentBoxSVG.replaceWith(storeSVG);
                                 svgElement.replaceWith(storeSVG);
                                 feedSvgElement.replaceWith(storeSVG);
                                 aElement.replaceWith('<a>저장하기</a>');
                                 feedAElement.replaceWith('<a>저장하기</a>');
                                
                             },
                             error: function(xhr, status, error) {
                                 // 오류 발생 시 실행할 코드
                                 console.error('오류 발생:', error);
                             }
                         });
                     }else{
                        const feedNo = $(this).find('input').val();
                         
                         $.ajax({
                             url: '${contextPath}/mainFeed/addChoice',
                             data: { feedNo: feedNo },
                             method: 'post',
                             success: function(result) {
                                currentBoxSVG.replaceWith(storeFillSVG);
                                svgElement.replaceWith(storeFillSVG);
                                feedSvgElement.replaceWith(storeFillSVG);
                                aElement.replaceWith('<a>저장됨</a>');
                                feedAElement.replaceWith('<a>저장됨</a>');
                             },
                             error: function(xhr, status, error) {
                                 // 오류 발생 시 실행할 코드
                                 console.error('오류 발생:', error);
                             }
                         });
                     }
                     
                  });    
               

               $(".modal-toggle-button").click(function(){
                   $(this).next(".modal-more-options").slideToggle(250);
               });

               $(document).mouseup(function(e){
                   var container = $(".modal-more-options");
                   var buttons = $(".modal-toggle-button");
                   if (!container.is(e.target) && container.has(e.target).length === 0
                       && !buttons.is(e.target) && buttons.has(e.target).length === 0) {
                       container.slideUp(250);
                   }
               });
               

                $(".modal .follow-control-js").click(function(){
                var followDIV = $(this).find("div");
                var addfollow = `<div class="add-follow">
                       <span class="material-symbols-outlined">person_add</span> 
                       <a>팔로우 추가</a>
                   </div>`;
                   var removefollow = `<div class="remove-follow">
                       <span class="material-symbols-outlined">person_remove</span> 
                       <a>팔로우 취소</a>
                   </div>`;
                   

                   var feedParentContainer = $(this).closest('body').find('.main-content .follow-control-js');
                   const feedElement = feedParentContainer.find("svg");
                   
                   
                   
                        if($(this).find('.remove-follow').length != 0){
                           const userNo = $(this).find('input').val();
                            
                            $.ajax({
                                url: '${contextPath}/mainFeed/unfollow',
                                data: { userNo: userNo },
                                method: 'post',
                                success: function(result) {
                                   followDIV.replaceWith(addfollow);
                                   feedParentContainer.replaceWith(addfollow);
                                   
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
                                   feedParentContainer.replaceWith(removefollow);
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
    });
</script>
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
		   console.log(dvalue);
		   console.log(value);
		   if(dvalue != ""){
			   value = dvalue;
		   }
		   console.log(value);
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
	 </script>


<!-- <script src="${contextPath}/resources/js/Dot_ChatSlick.js"></script> -->




