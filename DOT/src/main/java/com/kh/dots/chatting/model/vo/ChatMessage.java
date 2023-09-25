package com.kh.dots.chatting.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatMessage {

	private int chatNo;
	private int chatRoomNo;
	private int userNo;
	private String message;
	private String enrollDate;
	
	private String userNick;
	
	private String originName;
	private String changeName;
	private String filePath;
	
	private int feedNo;
	private List<Integer> shareUserList;
	private List<Integer> shareRoomList;

	
}
