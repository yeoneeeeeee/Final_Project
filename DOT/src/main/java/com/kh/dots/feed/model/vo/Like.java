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
public class Like {
	
	private int likeNo; 
	private int likeFno; 
	private int likeMember;
	private String likeStatus;
	
}
