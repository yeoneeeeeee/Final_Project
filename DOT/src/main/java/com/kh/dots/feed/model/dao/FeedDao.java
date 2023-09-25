package com.kh.dots.feed.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Like;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Friend;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class FeedDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertFeed(Feed feed) {
		return sqlSession.insert("feed.insertFeed",feed);
	}

	public int insertFeedImg(List<Images> imgs) {
		return sqlSession.insert("feed.insertFeedImg",imgs);
	}

	public Feed selectFeedData(int fno) {
		return sqlSession.selectOne("feed.selectFeedData",fno);
	}

	public List<Images> selectFeedImgList(int fno) {
		return sqlSession.selectList("feed.selectFeedImgList",fno);
	}

	public int updateFeedText(Feed feed) {
		return sqlSession.update("feed.updateFeedText",feed);
	}

	public int deleteImage(Map<String, Object> map) {
		return sqlSession.delete("feed.deleteImage",map);
	}

	public int updateImage(Images i) {
		return sqlSession.update("feed.updateImage",i);
	}

	public int insertImage(Images i) {
		return sqlSession.insert("feed.insertImage",i);
	}
	
	public List<Member> profile(int userNo) {
		return sqlSession.selectList("feed.profile",userNo);
	}

	public List<Images> feedimg4() {
		return sqlSession.selectList("feed.feedimg4");
	}

	public List<Feed> feedList4() {
		return sqlSession.selectList("feed.feedList4");
	}

	public List<Reply> reply4() {
		return sqlSession.selectList("feed.reply4");
	}

	public int insertReply(Reply r) {
		return sqlSession.insert("feed.insertReply",r);
	}

	public List<Reply> selectReplyList(int bno) {
		return sqlSession.selectList("feed.selectReplyList",bno);
	}

	public int insertLike(Like l) {
		return sqlSession.insert("feed.insertLike",l);
	}

	public List<Like> like4(int userNo) {
		return sqlSession.selectList("feed.like4",userNo);
	}
	
	public int updateLike(Feed f) {
		return sqlSession.insert("feed.updateLike",f);
	}

	public int removeLike(Like l) {
		return sqlSession.delete("feed.removeLike",l);
	}

	public int removeLikeCount(Feed f) {
		return sqlSession.update("feed.removeLikeCount",f);
	}

	public int addChoice(Choice c) {
		return sqlSession.insert("feed.addChoice",c);
	}

	public int removeChoice(Choice c) {
		return sqlSession.delete("feed.removeChoice",c);
	}

	public List<Choice> choice4(int userNo) {
		return sqlSession.selectList("feed.choice4",userNo);
	}

	public List<Feed> likeCount(int feedNo) {
		return sqlSession.selectList("feed.likeCount",feedNo);
	}

	public List<Choice> checkChoice(Choice c ){
		return sqlSession.selectList("feed.checkChoice", c);
	}

	public List<Friend> friend4(int userNo) {
		return sqlSession.selectList("feed.friend4", userNo);
	}

	public int unFollow(Map<String, Integer> map) {
		return sqlSession.delete("feed.unFollow", map);
	}

	public int addFollow(Map<String, Integer> map) {
		return sqlSession.insert("feed.addFollow", map);
	}

	public List<Friend> friend5(int userNo) {
		return sqlSession.selectList("feed.friend5", userNo);
	}

	public List<Choice> choiceFilter() {
		return sqlSession.selectList("feed.choiceFilter");
	}
	
	public List<Friend> friendList(int userNo) {
		return sqlSession.selectList("feed.friendList", userNo);
	}

}
