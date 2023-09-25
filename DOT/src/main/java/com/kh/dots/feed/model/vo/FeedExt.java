package com.kh.dots.feed.model.vo;

import java.util.List;

import com.kh.dots.common.model.vo.Images;

import lombok.Data;

@Data
public class FeedExt extends Feed{
	
	private List<Images> FeedImgList;
	//private List<Reply> replyList;
}
