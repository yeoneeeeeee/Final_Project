package com.kh.dots.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Member;

@Repository
public class ChatDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int openChatRoom(ChatRoom chatRoom) {
		
		int result = sqlSession.insert("chatting.openChatRoom", chatRoom);
		
		if(result > 0) {
			result = chatRoom.getChatRoomNo();
		}
		return result; 
	}
	
	
	public List<ChatRoom> selectChatRoomList(int userNo) {
		return sqlSession.selectList("chatting.selectChatRoomList",userNo);
	}


	public int insertChatRoom(ChatRoomJoin join) {
		return sqlSession.insert("chatting.insertChatRoom", join);
	}


	public int selectOne(String title) {
		return sqlSession.selectOne("chatting.selectOne",title);
	}


	public List<ChatRoom> selectChatRoomListByKeyword(Map<String, Object> map) {
		return sqlSession.selectList("chatting.selectChatRoomListByKeyword", map);
	}


	public List<ChatRoomJoin> joinChatRoom(ChatRoomJoin join) {
		return sqlSession.selectList("chatting.joinChatRoom", join);
	}


	public List<ChatMessage> selectMsgList(ChatRoomJoin join) {
		return sqlSession.selectList("chatting.selectMsgList", join);
	}


	public int insertMessage(ChatMessage cm) {
		return sqlSession.insert("chatting.insertMessage", cm);
	}


	public List<Member> searchFollowListByFollow(Map<String, Object> map) {
		return sqlSession.selectList("chatting.searchFollowListByFollow", map);
	}


	public List<ChatRoomJoin> selectChatRoomListImage(int userNo) {
		return sqlSession.selectList("chatting.selectChatRoomListImage", userNo);
	}

	public List<ChatRoomJoin> selectChatRoomImage(int chatRoomNo) {
		return sqlSession.selectList("chatting.selectChatRoomImage", chatRoomNo);
	}

	public int exitChatRoom(ChatRoomJoin join) {
		return sqlSession.delete("chatting.exitChatRoom", join);
	}


	public int sendImgFile(ChatMessage cm) {
		return sqlSession.insert("chatting.sendImgFile", cm);
	}

	public int insertImgFile(Images image) {
		return sqlSession.insert("chatting.insertImgFile", image);
	}


	public ChatMessage selectImage(ChatMessage message) {
		return sqlSession.selectOne("chatting.selectImage",message);
	}


	public ChatMessage selectNewImg(ChatMessage message) {
		return sqlSession.selectOne("chatting.selectNewImg", message);
	}


	public ChatMessage selectNewMsg(int chatRoomNo) {
		return sqlSession.selectOne("chatting.selectNewMsg",chatRoomNo);
	}


	public ChatMessage selectThumbnail(int feedNo) {
		return sqlSession.selectOne("chatting.selectThumbnail", feedNo);
	}


	public Feed selectFeedOne(int feedNo) {
		return sqlSession.selectOne("chatting.selectFeedOne", feedNo);
	}


	public List<Reply> selectReply(int feedNo) {
		return sqlSession.selectList("chatting.selectReply", feedNo);
	}


	public List<Images> selectFeedImg(int feedNo) {
		return sqlSession.selectList("chatting.selectFeedImg", feedNo);
	}


	public List<ChatRoomJoin> selectJoinUsers(Map<String, Object> map) {
		return sqlSession.selectList("chatting.selectJoinUsers", map);
	}

	
}
