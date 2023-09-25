$(function() {
    $(".toggle-button").click(function(){
        $(this).next(".more-options").slideToggle(250);
    });
    
    $(document).mouseup(function(e){
        var container = $(".more-options");
        var buttons = $(".toggle-button");
        if (!container.is(e.target) && container.has(e.target).length === 0
            && !buttons.is(e.target) && buttons.has(e.target).length === 0) {
            container.slideUp(250);
        }
    });


    var checkboxAdded = false;
    var button = $('#deleteBtn');
    var chatList = $('.chat-list');
	var checkbox = $('<input type="checkbox" name="deleteRoom" class="deleteCheck"/>');
	var checkbtn = $('<button id="deleteList" class="deleteListBtn">삭제하기</button>')


	chatList.find('.deleteCheck').hide();
    button.click(function() {
        if (!checkboxAdded) {
            
            //chatList.find(".list-info").prepend(checkbox);
            chatList.closest(".chat-list").prepend(checkbtn);
            
            chatList.find('.deleteCheck').show();
            checkboxAdded = true;
        } else {
            chatList.find('.deleteCheck').hide();
            chatList.find('.deleteListBtn').remove();
            checkboxAdded = false;
        }
    });
    
    
    
    
    
    $("#input-search-chat").on("keyup", () => {
	    let keyword = $("#input-search-chat").val();
	    let action = "search";
	
	    $.ajax({
	        url: "/dot/chat/chatRoomList",
	        data: { keyword: keyword, action : action },
	        method: "post",
	        success: (data) => {
	            
	            console.log(data);
	            
	            $(".chat-list").empty();
	            $(".chat-list").html(data);
	        },
	        error: console.log
	    });
	});
	



    $(".joinChatRoom").on("click", (e) => { // 클래스 선택자 사용
	    const focus = $(e.currentTarget);
	    const chatRoomNo = focus.find("[name=chatRoom]").val();
	
	    console.log(chatRoomNo);
	
	    $.ajax({
	        url: "/dot/chat/joinChatRoom",
	        data: { chatRoomNo: chatRoomNo },
	        method: "post",
	        success: (data) => {
	        	$(".chat-room-wrap").empty();
	            $(".chat-room-wrap").html(data);
	        },
	        error: (error) => {
	            console.error(error);
	        }
	    });
	});
	
	
	
	
//	let selectedCheckboxes = [];
//		
//	$('.output-list input[type="checkbox"][name="userNo"]').each(function() {
//	    if ($(this).prop('checked')) {
//	        selectedCheckboxes.push($(this).val());
//	    }
//		console.log(selectedCheckboxes);
//	});
	
		
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
	
	
	
    $("#deleteList").on("click", (e) => {
    	let del = $(e.currentTarget);
    	
    	console.log(del);
    	
    })
	
	
});
