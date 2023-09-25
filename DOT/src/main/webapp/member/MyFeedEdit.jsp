<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyFeedEnroll</title>
 		<!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- alert 스타일 변경-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!-- font -->
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />
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
        <!-- alert 스타일 변경 -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- Slick-->
        <link src="${contextPath}/resources/css/slick.css" type="text/css"></link>
        <link src="${contextPath}/resources/css/slick-theme.css" type="text/css"></link>
        <script src="${contextPath}/resources/js/slick.min.js" type="text/javascript" charset="utf-8"></script>
         <script type="text/javascript" src="${contextPath}/resources/js/MyFeed.js"></script>
        <link rel="stylesheet" href="${contextPath}/resources/css/My_Feed_Enroll.css" />
        <style>
    .slider-container {
        width: 500px; /* 슬라이더 컨테이너의 너비 설정 */
    }

    /* 왼쪽 화살표 숨김 스타일 */
    .slick-prev.hidden {
        display: none;
    }

    /* 오른쪽 화살표 숨김 스타일 */
    .slick-next.hidden {
        display: none;
    }
</style>
        
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			if('${alertMsg}' == '게시물 수정 실패!'){
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
                    <form action="${contextPath}/feedEdit.fe" method="post" enctype="multipart/form-data" id="form-form-from">
                    <input type="hidden" name="fno" value="${feed.feedNo}"/>
                    <div class="main_container">
                        <div class="slide_wrap">
                            <div class="slide_container">
                                <div class="add-remove">
                                <c:forEach var="i" items="${feedImgs}" begin="0" end="${feedImgs.size()}">
	                       			<img src="${contextPath}/${i.filePath}/${i.changeName}">
	                       		</c:forEach>
	                       		<c:set var="other1" value="5"/>
	                       		<c:set var="other2" value="${feedImgs.size()}"/>
	                       		<c:set var="other3" value="${other1-other2-1}"/>
	                       		<c:if test="${otehr3 != 0 && other3 != -1}">
	                       			<c:forEach var="i2" begin="0" end="${other3}">
	                       				<img src="${contextPath}/resources/images/DotLogo_D.png">
	                       			</c:forEach>
	                       		</c:if>
                                </div>
                                <div class="buttons">
                                    <label class="button add-slide" id="add-slide1">
									    <span class="material-symbols-outlined add">
									        add_circle
									    </span>
									    <input type="file" class="file-input" accept="image/*" style="display: none;" name="feedImg1" id="feedImg1">
									    
									</label>
									 <label class="button add-slide" id="add-slide2" >
						                <span class="material-symbols-outlined add">
						                    add_circle
						                </span>
						                <input type="file" class="file-input" accept="image/*" style="display: none;" name="feedImg2" id="feedImg2">
            						</label>
            						<label class="button add-slide" id="add-slide3" >
						                <span class="material-symbols-outlined add">
						                    add_circle
						                </span>
						                <input type="file" class="file-input" accept="image/*" style="display: none;" name="feedImg3" id="feedImg3">
            						</label>
            						<label class="button add-slide" id="add-slide4" >
						                <span class="material-symbols-outlined add">
						                    add_circle
						                </span>
						                <input type="file" class="file-input" accept="image/*" style="display: none;" name="feedImg4" id="feedImg4">
            						</label>
            						<label class="button add-slide" id="add-slide5" >
						                <span class="material-symbols-outlined add">
						                    add_circle
						                </span>
						                <input type="file" class="file-input" accept="image/*" style="display: none;" name="feedImg5" id="feedImg5">
            						</label>
                                </div>
                            </div>
                            <div class="slide_list_wrap">
                                <div class="slide_list">
                                	
                                	<c:forEach var="i" items="${feedImgs}" begin="0" end="5">
	                       				<div class="thumbnail">
	                                		<img src="${contextPath}/${i.filePath}/${i.changeName}">
			                				<a href="javascript:void(0)" class="remove-slide">
			                					<span class="material-symbols-outlined remove">delete_forever</span>
			                				</a>
			                			</div>
	                       			</c:forEach>
	                       			<c:if test="${otehr3 != 0 && other3 != -1}">
		                       			<c:forEach var="i2" begin="0" end="${other3}">
		                       				<div class="thumbnail">
	                                			<img src="${contextPath}/resources/images/DotLogo_D.png">
			                					<a href="javascript:void(0)" class="remove-slide">
			                						<span class="material-symbols-outlined remove">delete_forever</span>
			                					</a>
			                				</div>
		                       			</c:forEach>
		                       		</c:if>
                                </div>
                            </div>
                        </div>
                        <div class="update_container">
                            <div class="id_container">
                                <div class="userid_img">
                                    <img src ="${contextPath}/${profileImg.filePath}/${profileImg.changeName}">
                                </div>
                                <div class="user_id">
                                    <h5>${loginUser.userNick}</h5>
                                </div>
                            </div>
                            <div class="feed_container">
                                <textarea class="text" name="feedContent" placeholder="문구 입력...">${feed.feedContent}</textarea>
                            </div>
                            <div class="hash_container">
                                <input type="text" name="hashTag" class="hashtag" placeholder="태그 입력...." value="${feed.feedHashtag}"/>
                            </div>
                            <div class="confirm_container">
                                <div class="cancle_btn"></div>
                                <div class="confirm_btn"><button type="button" class="cancle" onclick="toMyFeed()">취소</button>
                                <button type="button" id="form-btn-feed" class="confirm">등록</button>
                                </div>
                            </div>
                            <input type="hidden" name="deleteList" id="deleteList" value=""/>
                        </div>
                    </div>
                   </form>
                </div>
            </div>
        </div>
		<script>
		  var form = $('#form-form-from');
		  var btn = $('#form-btn-feed');
		  btn.on('click', function(event) {
			  //event.preventDefault();
			  console.log("1");
			  swal({
				  text:"게시물을 등록하시겠습니까?",
				  buttons : ["취소하기","등록하기"]
			  })
			  .then((value) => {
				  console.log(value);
				  if(value){
					  form.submit();
				  }else{
					  console.log("다시해~");
				  }
			  });
		    });
			  
		  function toMyFeed() {
		        location.href = '${contextPath}/MyFeed.me';
		  }
		</script>
		
		<script>
		 $(document).ready(function () {
		        var slideContainer = jb1('.add-remove');
		        var maxSlides = 5;

		        // Initialize the slick slider for the slideContainer
		        slideContainer.slick({
		            slidesToShow: 1,
		            slidesToScroll: 1,
		            infinite: true, // Prevent infinite scrolling
		        });
	
		       
		        
		        var slidmainImg = jb1('.add-remove img');
		        var slidmainImg2 = jb1('.thumbnail>img');
		        var inputImage = jb1('.file-input');
		        var deleteImage = jb1('.thumbnail span')
		        
		        const deleteList = document.getElementById("deleteList");
				const deleteSet = new Set();
		         
		        
		        for(let i=0 ; i<inputImage.length ; i++){

				    // 파일이 선택 되었을 때의 동작
				    inputImage[i].addEventListener("change", function(){
				    	console.log(this.files[0]);
				        if(this.files[0] != undefined){ // 파일이 선택 되었을 때
				            const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
				            reader.readAsDataURL(this.files[0]);
				            // 지정된 파일을 읽음 -> result에 저장(URL 포함) -> URL을 이용해서 이미지 볼 수 있음

				            reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
				                // e.tartget == redaer
				                // e.target.result == 읽어들인 이미지의 URL
				                // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
				                slidmainImg[i+1].setAttribute("src", e.target.result);
				            	slidmainImg2[i].setAttribute("src", e.target.result);
				            	deleteSet.delete(i);
				            }
				      
				        } else { // 파일이 선택되지 않았을 때 (취소)
				        	slidmainImg[i+1].setAttribute("src","${contextPath}/resources/images/DotLogo_D.png"); // src 속성 제거
				        	slidmainImg2[i].setAttribute("src","${contextPath}/resources/images/DotLogo_D.png"); // src 속성 제거
				        }
				    });


			
				    // 미리보기 삭제 버튼(x)이 클릭 되었을 때의 동작
				    deleteImage[i].addEventListener("click", function(){
					
				        // 미리보기가 존재하는 경우에만 (이전에 추가된 이미지가 있을 때만 X버튼 동작)
				        if( slidmainImg2[i].getAttribute("src")  !=  "${contextPath}/resources/images/DotLogo_D.png" ){

				            // 미리보기 삭제
				           	slidmainImg[i+1].setAttribute("src","${contextPath}/resources/images/DotLogo_D.png"); // src 속성 제거
				        	slidmainImg2[i].setAttribute("src","${contextPath}/resources/images/DotLogo_D.png"); // src 속성 제거

				            // input의 값을 "" 만들기
				            console.log(inputImage[i].value);
				            inputImage[i].value = "";
				            console.log(inputImage[i].value);
				            
				            deleteSet.add(i+2);
				            deleteList.value = Array.from(deleteSet);
				        }

				    });
		        }

		    });
		</script>
</body>
</html>