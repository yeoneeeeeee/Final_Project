<%@ page language="java" contentType="text/html; Charset=EUC-KR" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                <div class="content-area" style="margin-top:15px;">
                	<form action="${contextPath}/deleteReport" id="form-report-admin" >
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
                            <div class="category-wrap" id="reporpList">
                                <div class="category">
                                    <input type="checkbox" id="selectAllBtn" class="check-btn" onclick="selectAll();" style="margin-left:30px">
                                    <div class="title-no" style="margin-left:5px;">
                                       <span></span>
                                        No.
                                    </div>
                                    <div class="title-id">
                                        <span>Writer</span>
                                    </div>
                                    <div class="title-content" style="width:450px;">
                                        <span>Title</span>
                                    </div>
                                    <div class="title-date">
                                        <span>Date</span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="admin-area">
                                <c:if test="${empty rlist}">
				                  <div style="width:1000px; padding-top:150px; font-size:25px;"align="center">신고 내역이 없떠요ㅠㅠ</div>
				               </c:if>
                               <c:if test="${!empty rlist}">
                                <div class="content-left" >
	                                <c:forEach var="r" items="${rlist}" >
	                                	<c:if test="${r.reportStatus eq 'N'}">
										<div class="search-report" id="selectR${r.reportNo}" onclick="detailReport(event,${r.reportNo})" style="background-color:black">
	                                        <input type="checkbox" name="rowCheck" class="rowCheck-btn" value="${r.reportNo}" style="margin-left:20px;"/>
	                                        <div class="title-no de" style="margin-left:5px;">
	                                            <span></span>
	                                            <h4 id="no">${r.reportNo}</h4>
	                                        </div>
	                                        <div class="title-id de">
	                                            <h4>${r.userNick}</h4>
	                                        </div>
	                                        <div class="title-content de" style="width:450px;">
	                                            <h4>${r.reportTitle}</h4>
	                                        </div>
	                                        <div class="title-date de">
	                                            <h4>${r.enrollDate}</h4>
	                                        </div>
	                                    </div>
	                                    </c:if>
	                                    <c:if test="${r.reportStatus eq 'Y'}">
										<div class="search-report" id="selectR${r.reportNo}" onclick="detailReport(event,${r.reportNo})">
	                                        <input type="checkbox" name="rowCheck" class="rowCheck-btn" value="${r.reportNo}" style="margin-left:20px;"/>
	                                        <div class="title-no de" style="margin-left:5px;">
	                                            <span></span>
	                                            <h4 id="no">${r.reportNo}</h4>
	                                        </div>
	                                        <div class="title-id de">
	                                            <h4>${r.userNick}</h4>
	                                        </div>
	                                        <div class="title-content de" style="width:450px;">
	                                            <h4>${r.reportTitle}</h4>
	                                        </div>
	                                        <div class="title-date de">
	                                            <h4>${r.enrollDate}</h4>
	                                        </div>
	                                    </div> 
	                                    </c:if>
	                                </c:forEach>
                                </div>
                                </c:if>
                                <div class="ctn-right">
                                    <div class="right-wrap">
                                        <div class="right-container" >
                                            <div class="right-header">
                                                <div class="right-userid" >
                                                    <button class="userid-btn">NICK</button>
                                                    <h4 id="reportWriter" style="margin-left:-205px; margin-top:10px;">${userNick}</h4>
                                                </div>
                                                <div class="rigth-date">
                                                    <h4 id="enrollDate"  style="margin-left: -160px; margin-top: -5px;">${enrollDate}</h4>
                                                </div>
                                            </div>
                                            <div class="right-title">
                                                <button class="title-btn">제목</button>
                                                <h4 id="reportTitle" style="margin-top: 13px; margin-left:-200px;">${reportTitle}</h4>
                                            </div>
                                            <div class="right-detail">
                                                <button class="detail-btn">내용</button>
                                                <div id="reportContent" style="margin-top:-240px; margin-left:-200px;">${reportContent}</div>
                                            </div>
	                                            <div class="right-confirm">
	                                            	<div id="confirm-btn" style="display:none;"></div>
	                                                <button type="button" class="confirm-btn" id="confirm-btns" onclick="process()">처리</button>
	                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <script>
                                /* 신고 게시글 상세 보기 & 게시글 읽음 여부 표시 */
                                function detailReport(e,no){
                                    console.log(no);
                                    console.log('selectR'+no);
									var reportNo = no;
									const selectR = $('#selectR'+no);
									console.log(selectR);
									
                                    $.ajax({
                                        url:"${contextPath}/detailReport",
                                        data:{reportNo : reportNo},
                                        success: function(data){
                                        	console.log(data);
                                        	selectR.css("background-color","black");
                                       		var reportFeed = "게시물 번호 : "+data.reportFno;
                                       		var reportUno = "유저 번호 : "+data.reportTarget;
                                       		var content = reportFeed+" "+reportUno+"<br>"+data.reportContent;
                                       		
                                        	$('#reportWriter').text(data.userNick);
                                        	$('#enrollDate').text(data.enrollDate);
                                        	$('#reportTitle').text(data.reportTitle);
                                        	$('#reportContent').empty();
                                        	$('#reportContent').append(content);
                                        	$('#confirm-btn').text(data.reportNo);
                                        },
                                        error: function () {
                                        	console.log('detail error');
                                        }
                                    });
                                }
                                
                    			 var form = $('#form-report-admin');
                     			 var btn = $('#btn-del');
                     			  btn.on('click', function(event) {
                     				  //event.preventDefault();
                     				  console.log("1");
                     				  swal({
                     					  text:"게시물을 삭제하시겠습니까?",
                     					  buttons : ["취소하기","삭제하기"]
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
                                 /* 처리 기능 */
                                 function process(){
                                	 const reportNo = $('#confirm-btn').text();
                                	 console.log(reportNo);
                                 		$.ajax({
                                 			url: "${contextPath}/processReport",
                                 			data: {reportNo : reportNo},
                                 			success: function(data){
                                 				console.log(data);
                                 				if(data == 1){
                             					  swal({
                                 					  text:"게시물을 처리를 완료하시겠습니까?",
                                 					  buttons : ["취소하기","처리하기"]
                                 				  })
                                 				  .then((value) => {
                                 					  console.log(value);
                                 					  if(value){
                                 						 location.reload();
                                 					  }else{
                                 						  console.log("다시해~");
                                 					  }
                                 				  });
                                 					
                                 				}
                                 			},
                                 			error: function(){
                                 				console.log('process error');
                                 			}
                                		});
                              		}                                   
                                /*  var delForm = $('#form-del-report-admin');
                                 var delBtn = $('#r-del-btn');
                                 delBtn.on('click', function(event) {
                                 	var checkboxes = [];
                                 	$('input[name="rowCheck"]:checked').each(function() {
                                 		checkboxes.push($(this).val());
                                     });
                                 	console.log(checkboxes);
                                 	
                                	    if (checkboxes.length > 0) {
                     	                swal({
                     	                    text :"신고 게시글을 삭제하시겠습니까?",
                     	                    buttons : ["취소하기","삭제하기"]
                     	                })
                     	                .then((value) => {
                     	                     console.log(value);
                     	                     if (value) {
                     	                         delForm.submit();
                     	                		 console.log("del-r good");

                     	                     } else {
                     	                    	 console.log("return!");
                     	                     }
                     	                  });
                                      }
                                 }); */
                                </script>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>

        <c:set var="url" value="${r.reportNo}?currentPage="/>
  		
			  		<c:if test="${not empty param.condition }"> 
			  			<c:set var="sUrl" value="&condition=${param.condition }&keyword=${param.keyword }"/>
			  		</c:if>
			  		
			  		<div id="paginArea" style="margin-top:360px;">
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
			  		
			  		<br clear="both"><br>
			  		
			  		<form id="searchForm" action="${reportNo}" method="get" align="center" style="margin-left:500px; position:absolute;">
			  			<div class="report-select-wrap">
						  	<select class="feed-select" name="condition">
						  		<option value="writer" ${param.condition eq 'writer' ? 'selected' : '' }>작성자</option>
						  		<option value="title" ${param.condition eq 'title' ? 'selected' : '' }>제목</option>
						  	</select>
			  			</div>
			  			<div class="report-search-text" style="width:350px">
			  				<input type="text" class="form-control" name="keyword" value="${param.keyword }"/>
			  			</div> 
							<button type="text" class="searchBtn btn btn-secondary">검색</button>
			  		</form>
			  	

        <script>
            /* 체크박스 선택 & 전체선택 */
            function selectAll(){
                const checked = document.getElementById("selectAllBtn").checked;
                const rowChecks = document.querySelectorAll('input[type="checkbox"]');
                rowChecks.forEach( function(rowCheck) {
                    rowCheck.checked = checked;
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
				         
</body>
</html>