
   		
   		
   		(
		    function(){
		       const display = $(".reply-middle>dl")[0];
		       
		       if(display != null){
		          display.scrollTop = display.scrollHeight;
		       }
		    }
		 )();
		
		 $('.reply_input').on('click', function () {
			    sendReply($(this));
		 });

		 $('.insertReply').on('keydown', function (event) {
		     if (event.which === 13) { // 엔터 키(키 코드 13)를 눌렀을 때
		         sendReply($(this));
		     }
	 	});
		
		 function sendReply(button) {
		    const parentContainer = button.closest('.reply-bottom');
		    const inputElement = parentContainer.find('input');
		    const replyContent = inputElement.val();
		    const feedNo = parentContainer.find(".reply_input").val(); 
		    
		    $.ajax({
		        url: '${contextPath}/mainFeed/insertReply',
		        data: {
		            replyContent: replyContent,
		            replyFno: feedNo
		        },
		        method: 'post',
		        success: function (result) {
		        	if(result > 0) {
		        		selectReplyList(feedNo);
		        	}  else {
		        		alert("답글 달기 실패");
		        	}
		        },
		        complete: function (result) {
		            inputElement.val('');
		        }
		    });
		};
		
		function selectReplyList(feedNo) {
			$.ajax({
				url : '${contextPath}/mainFeed/selectReplyList',
				data: {bno : feedNo },
				method : 'get',
				success : function(replyList){
					let html = "";
					let lastReply = replyList.pop();
					html = 
						"<dt class='output'>" +
						"<img src='" + '${contextPath}' + lastReply.filePath + '/' + lastReply.changeName + "' />" +
		                "<div class='reply-list'>" +
						"<span>" + lastReply.userNick +"</span><span>"+ lastReply.replyContent + "</span>"+
						"</div>" +
						"</dt>";
						
					$(".output_"+feedNo).parent().prepend(html);
				}
			})
		};
		
		$("#friends-search").on("keyup", () => {
		
		    let follow = $("#friends-search").val();
		
		    $.ajax({
		        url: "/dot/chat/searchFollowList",
		        data: { follow : follow },
		        method: "post",
		        success: (data) => {
		            
		            console.log(data);
		            
		            $(".output-list").empty();
		            $(".output-list").html(data);
		            
		        },
		        error: console.log
		    });
		});
		
		
   		