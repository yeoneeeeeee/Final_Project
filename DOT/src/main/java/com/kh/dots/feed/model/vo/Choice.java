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
public class Choice {
	
	private int choiceNo; 
	private int choiceFno; 
	private int choiceMember;
	private String choiceStatus;
	
	private String fileWriter;
	private String changeName;
	private String filePath;
	private int fileFno;
	private int likeCount;
	
}
