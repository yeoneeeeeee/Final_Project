package com.kh.dots.feed.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Like;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Friend;
import com.kh.dots.member.model.vo.Member;

public interface FeedService {

	int insertFeed(Feed feed);

	int insertFeedImg(List<Images> imgs);

	Feed selectFeedData(int fno);

	List<Images> selectFeedImgList(int fno);

	int updateFeed(Feed feed, List<MultipartFile> upfiles, String severFolderPath, String webPath, String deleteList);
	
	List<Member> profile(int userNo);

	List<Images> feedimg4();

	List<Feed> feedList4();

	List<Reply> reply4();

	int insertReply(Reply r);

	List<Reply> selectReplyList(int bno);

	int insertLike(Like l);

	int updateLike(Feed f);

	List<Like> like4(int userNo);

	int removeLike(Like l);

	int removeLikeCount(Feed f);

	int addChoice(Choice c);

	int removeChoice(Choice c);

	List<Choice> choice4(int userNo);

	List<Feed> likeCount(int feedNo);

	List<Choice> checkChoice(Choice c);

	List<Friend> friend4(int userNo);

	int unFollow(Map<String, Integer> map);

	int addFollow(Map<String, Integer> map);

	List<Friend> friend5(int userNo);

	List<Choice> choiceFilter();
	
	List<Friend> friendList(int userNo);

}
