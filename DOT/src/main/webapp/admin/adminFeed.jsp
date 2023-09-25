<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/Dot_admin.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/sidebar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <!-- alert 스타일 변경 -->
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>admin</title>
</head>
<body>
    <div class="wrap">
       	<jsp:include page="/common/Header.jsp" />
        <div class="ctn">
            <div class="side-bar">
                <div class="controller">
                    <div class="member-controller cont" onclick="location.href='${contextPath}/adminMain';">
                        <span class="material-symbols-outlined"> group </span>
                        <h3>회원관리</h3>
                    </div>
                    <div class="det-wrapper">
                        <div class="member det">
                            <div class="det-area" onclick="location.href='${contextPath}/adminWList';">
                                <h4>인플루언서</h4>
                            </div>
                        </div>
                        <div class="member det">
                            <div class="det-area" onclick="location.href='${contextPath}/adminBList';">
                                <h4>블랙리스트</h4>
                            </div>
                        </div>
                    </div>
                    <div class="feed-controller cont" onclick="location.href='${contextPath}/adminFeed';">
                        <span class="material-symbols-outlined"> data_table </span>
                        <h3>피드관리</h3>
                    </div>
                    <div class="report-controller cont" onclick="location.href='${contextPath}/adminReport';">
                        <span class="material-symbols-outlined"> feedback </span>
                        <h3>신고관리</h3>
                    </div>
	                <div class="report-controller cont" onclick="location.href='${contextPath}/logout.me';">
                        <span class="material-symbols-outlined logout"> logout </span>
                        <h3>로그아웃</h3>
                    </div>
                </div>
            </div>

            <div class="header-bar">
                <div class="content-area">
                    <form action="${contextPath}/deleteFeed" method="post" id="form-feed-admin">
                    <div class="content-header">
                        <div class="icon-area">
                            <div class="content-icon">
                                <span class="material-symbols-outlined icon" onclick="location.href='${contextPath}/adminWList';"> verified </span>
                                <div class="font">l</div>
                                <span class="material-symbols-outlined icon" onclick="location.href='${contextPath}/adminBList';"> person_off </span>
                                <div class="font">l</div>
                                <span class="material-symbols-outlined" onclick="location.href='${contextPath}/adminFeed';"> data_table </span>
                                <div class="font">l</div>
                                <span class="material-symbols-outlined" onclick="location.href='${contextPath}/adminReport';"> feedback </span>
                                <div class="font">l</div>
                                <button class="del-btn" 
                                		id="btn-del"
                                		type="button" 
                                		style="background-color:transparent; padding-left:30px;"
                                		><span class="material-symbols-outlined">
delete
</span></button>
                            </div>
                        </div>
                    </div>
                    <div class="content-body">
                        <table id="feedList" class="table table-hover" align="center">
				            <thead class="category-wrap">
				            	<tr>
				               	 <th width="250px">
					                  <label style="margin:0px 20px 0px -40px;">
	                                       <input type="checkbox" id="selectAllBtn" onclick="selectAll();">
	                                       <span></span>
	                                   </label>
				                  		No.
				                  </th>
				                  <th width="550px">Writer</th>
				                  <th width="1000px">Feed Hashtag</th>
				               </tr>
				            </thead>
				            <tbody>
				               <c:if test="${empty feList}">
				                  <td colspan="5" align="center">게시글이 없떠요ㅠㅠ</td>
				               </c:if>
				               <c:forEach var="f" items="${feList}">
				                  <tr onclick="location.href='${contextPath}/YourFeed.me?uno=${f.feedWriter}'" class="memberinfo">
				                     <td>
                                         <label style="margin:0px 20px 0px -40px;">
                                             <input type="checkbox" name="rowCheck" value="${f.feedNo}"/>
                                             <span></span>
                                         </label>
                                     ${f.feedNo}</td>
				                     <td>${f.userNick}</td>
				                     <td>${f.feedHashtag}</td>
				                  </tr>
				               </c:forEach>
				            </tbody>
				         </table>
         			</div>
         			
         			<script>
         			 var form = $('#form-feed-admin');
         			 var btn = $('#btn-del');
         			  btn.on('click', function(event) {
         				  //event.preventDefault();
         				  console.log("1");
         				  swal({
         					  text:"게시물을 삭제하시겠습니까?",
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
			         	/* 체크박스 선택 & 전체선택 */
			         	function selectAll(){
					    	const checked1 = document.getElementById("selectAllBtn").checked;
					    	const rowChecks = document.querySelectorAll('.content-body input[type="checkbox"]');
					    	rowChecks.forEach( function(rowCheck) {
					    		rowCheck.checked = checked1;
					     	   })
						}
				    
						/* 전체선택 해제 */ 
						function selectOne(){
						    const all = document.getElementById("selectAllBtn");
						    const one = document.querySelectorAll('input[class="rowCheck-btn"]');
						    let isAll = true;
						    for(let i = 0; i < one.length; i++){
								if(one[i].checked == false){
						   	        isAll = false;
						            break;
						        }
						    }
						    if(isAll){
						      all.checked = true;
						    } else{
						    all.checked = false;
						    }
						}
			         </script>
         
         			<c:set var="url" value="${f.feedNo}?currentPage="/>
  		
			  		<c:if test="${not empty param.condition }"> 
			  			<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
			  		</c:if>
			  		<div id="paginArea">
			  			<ul class="pagination">
			  				<c:choose>
								<c:when test="${pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>	
								</c:when>			
			  					<c:otherwise>
			  						<li class="page-item"><a class="page-link" href="${url }${pi.currentPage -1}${sUrl}">Previous</a></li>
			  					</c:otherwise>
			  				</c:choose>
			  				
			  				<c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
			  					<li class="page-item">
			  						<a class="page-link" href="${url }${item}${sUrl}">${item }</a>
			  					</li>
			  				</c:forEach>
			  				
			  				<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>	
								</c:when>			
			  					<c:otherwise>
			  						<li class="page-item"><a class="page-link" href="${url }${pi.currentPage +1}${sUrl}">Next</a></li>
			  					</c:otherwise>
			  				</c:choose>
			  			</ul>	
			  		</div>	
			  		</form>
			  		<br clear="both"><br>
			  		
			  		<form id="searchForm" action="${feedNo}" method="get" align="center">
			  			<div class="feed-select-wrap">
						  	<select class="feed-select" name="condition">
						  		<option value="writer" ${param.condition eq 'writer' ? 'selected' : '' }>작성자</option>
						  		<option value="hashtag" ${param.condition eq 'hashtag' ? 'selected' : '' }>해시태그</option>
						  	</select>
			  			</div>
			  			<div class="feed-search-text">
			  				<input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
			  			</div>
							<button type="text" class="searchBtn btn btn-secondary">검색</button>
			  		</form>
			  	</div>
			  	
    <script></script>
</body>
</html>