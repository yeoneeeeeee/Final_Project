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
public class Feed {
	
	private int feedNo; //	FEED_NO
	private int feedWriter; //	FEED_WRITER
	private String feedContent; // FEED_CONTENT
	private String likeStatus; //	LIKE_STATUS
	private String choiceStatus; //	CHOICE_STATUS
	private String likeCount; //	LIKE_COUNT
	private String feedHashtag; //	FEED_HASHTAG
	
	private String userNick;
	
}
