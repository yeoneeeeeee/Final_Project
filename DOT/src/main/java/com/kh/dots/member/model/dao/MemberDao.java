package com.kh.dots.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Friend;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOne(String userId) {
		return sqlSession.selectOne("member.selectOne", userId);
	}
	
	public Member selectOne(int userNo) {
		return sqlSession.selectOne("member.selectOneByUserNo", userNo);
	}

	public Member loginUser(Member m) {
		return sqlSession.selectOne("member.loginUser", m);
	}

	public int idCheck(String userId) {
		return sqlSession.selectOne("member.idCheck", userId);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember",m);
	}

	public Images selectListImages(int userNo) {
		return sqlSession.selectOne("member.selectListImages",userNo);
	}

	public List<Images> selectListMyImg(int userNo) {
		return sqlSession.selectList("member.selectListMyImg",userNo);
	}

	public List<Images> detailMyFeedModal(int imgNo) {
		return sqlSession.selectList("member.detailMyFeedModal",imgNo);
	}

	public List<Friend> sideFriendList(int userNo) {
		return sqlSession.selectList("member.sideFriendList", userNo);
	}

	public Member checkMember(int userNo) {
		return sqlSession.selectOne("member.checkMember", userNo);
	}

	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember",m);
	}

	public int updateProfileImg(Member m) {
		return sqlSession.update("member.updateProfileImg",m);
	}

	public int insertProFileImg() {
		return sqlSession.insert("member.insertProFileImg");
	}

	public int changePwd(Member m) {
		return sqlSession.update("member.changePwd",m);
	}

	public int deleteUser(Member m) {
		return sqlSession.update("member.deleteUser",m);
	}

	public Member logincheck(Member m) {
		return sqlSession.selectOne("member.logincheck",m);
	}

	public int loginPwdReset(Member m) {
		return sqlSession.update("member.loginPwdReset",m);
	}

	public int updateUserLoginStatus(Member m) {
		return sqlSession.update("member.updateUserLoginStatus",m);
	}

	public Member selectFriendList2(Friend a) {
		return sqlSession.selectOne("member.selectFriendList2",a);
	}

	public List<Member> selectAll() {
		return sqlSession.selectList("member.selectAll");
	}
	
	public List<Member> searchFollowerList(int userNo) {
		return 	sqlSession.selectList("member.searchFollowerList",userNo);
	}

	public List<Images> searchFollowerImageList(int userNo) {
		return sqlSession.selectList("member.searchFollowerImageList",userNo);
	}

	public List<Member> searchFollowList(int userNo) {
		return sqlSession.selectList("member.searchFollowList",userNo);
	}

	public int unFollow(Map<String, Integer> map) {
		return sqlSession.delete("member.unFollow",map);
	}

	public int addFollow(Map<String, Integer> map) {
		return sqlSession.insert("member.addFollow",map);
	}

	public List<Member> recommandFollowList(int userNo) {
		return sqlSession.selectList("member.recommandFollowList",userNo);
	}

	public Member feedMember(int feedNo) {
		return sqlSession.selectOne("member.feedMember",feedNo);
	}

	public List<Choice> myChoiceList(int userNo) {
		return sqlSession.selectList("member.myChoiceList",userNo);
	}

	public List<Reply> detailReply(int imgNo) {
		return sqlSession.selectList("member.detailReply",imgNo);
	}

	public int insertReplyMy(Map<String, Object> map) {
		log.info("Dao userNo={}",map.get("userNo"));
		log.info("Dao replyContent={}",map.get("replyContent"));
		log.info("Dao feedNo={}",map.get("feedNo"));
		return sqlSession.insert("member.insertReplyMy",map);
	}

	public Reply latelyReply(Map<String, Object> map) {
		return sqlSession.selectOne("member.latelyReply",map);
	}
}
