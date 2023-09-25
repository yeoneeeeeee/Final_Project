package com.kh.dots.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatRoom {
	
	private int chatRoomNo;
	private int userNo;
	private String title;
	private String status;
	
	private String userNick;
	private int cnt;


}
