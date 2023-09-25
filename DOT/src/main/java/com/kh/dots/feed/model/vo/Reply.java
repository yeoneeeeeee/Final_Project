package com.kh.dots.feed.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reply {
	
	private int replyNo; 
	private int replyWriter; 
	private String replyContent;
	private int replyFno; 
	private Date enrollDate; 
	private String status; 
	
	
	private String userNick;
	private String filePath;
	private String changeName;
	
}
