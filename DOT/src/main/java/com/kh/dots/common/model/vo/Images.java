package com.kh.dots.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Images {
	private int fileNo;
	private int fileWriter;
	private String originName;
	private String changeName;
	private String filePath;
	private String status;
	private int fileLevel;
	private int fileFno;
	
	private int likeCount;
	private String userNick;
	private int likeFno;
	private int choiceFno;
	private int friendUser2;
	private int friendUser1;
	private int feedWriter;
	private String feedContent;
	private String feedHashtag;
}
