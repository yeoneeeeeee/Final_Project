package com.kh.dots.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Friend;
import com.kh.dots.member.model.vo.Member;

public interface MemberService {

	Member selectOne(String userId);
	
	Member selectOne(int userNo);

	Member loginUser(Member m);

	int idCheck(String userId);

	int insertMember(Member m);

	void certifiedPhoneNumber(String userPhone, String numStr);

	Images selectListImages(int userNo);

	List<Images> selectListMyImg(int userNo);

	List<Images> detailMyFeedModal(int imgNo);

	List<Friend> sideFriendList(int userNo);

	Member checkMember(int userNo);

	int updateMember(Member m);

	int updateProfileImg(Member m);

	int insertProFileImg();

	int changePwd(Member m);

	int deleteUser(Member m);

	void sendEmail(String to_email, String authenticationKey, String title, String content);

	Member logincheck(Member m);

	int loginPwdReset(Member m);

	int updateUserLoginStatus(Member m);

	Member selectFriendList2(Friend a);

	List<Member> selectAll();

	List<Member> searchFollowerList(int userNo);

	List<Images> searchFollowerImageList(int userNo);

	List<Member> searchFollowList(int userNo);

	int unFollow(Map<String, Integer> map);

	int addFollow(Map<String, Integer> map);

	List<Member> recommandFollowList(int userNo);

	Member feedMember(int feedNo);

	List<Choice> myChoiceList(int userNo);

	List<Reply> detailReply(int imgNo);

	int insertReplyMy(Map<String, Object> map);

	Reply latelyReply(Map<String, Object> map);
}
