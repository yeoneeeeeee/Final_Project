package com.kh.dots.chatting.model.vo;

import lombok.Data;

@Data
public class ChatRoomJoin {
	
	private int userNo;
	private int chatRoomNo;

	private String filePath;
	private String changeName;
}
