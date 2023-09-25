package com.kh.dots.chatting.model.service;

import java.util.List;
import java.util.Map;

import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Member;

public interface ChatService {
	
	int openChatRoom(ChatRoom room);
	
	List<ChatRoom> selectChatRoomList(int userNo);

	int insertChatRoom(ChatRoomJoin join);

	int selectOne(String title);

	List<ChatRoom> selectChatRoomListByKeyword(Map<String, Object> map);

	List<ChatRoomJoin> joinChatRoom(ChatRoomJoin join);

	List<ChatMessage> selectMsgList(ChatRoomJoin join);

	int insertMessage(ChatMessage chatMessage);

	List<Member> searchFollowListByFollow(Map<String, Object> map);

	List<ChatRoomJoin> selectChatRoomListImage(int userNo);

	int exitChatRoom(ChatRoomJoin join);

	int sendImgFile(ChatMessage cm);

	int insertImgFile(Images image);

	List<ChatRoomJoin> selectChatRoomImage(int chatRoomNo);

	ChatMessage selectImage(ChatMessage message);

	ChatMessage selectNewImg(ChatMessage message);

	ChatMessage selectNewMsg(int chatRoomNo);

	ChatMessage selectThumbnail(int feedNo);

	Feed selectFeedOne(int feedNo);

	List<Reply> selectReply(int feedNo);

	List<Images> selectFeedImg(int feedNo);

	List<ChatRoomJoin> selectJoinUsers(Map<String, Object> map);

	

	
	

}
