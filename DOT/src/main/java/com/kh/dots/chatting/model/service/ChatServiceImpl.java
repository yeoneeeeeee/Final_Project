package com.kh.dots.chatting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.chatting.model.dao.ChatDao;
import com.kh.dots.chatting.model.vo.ChatMessage;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.common.Utils;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDao cDao;
	
	
	@Override
	public int openChatRoom(ChatRoom chatRoom) {
		return cDao.openChatRoom(chatRoom);
	}
	
	@Override
	public List<ChatRoom> selectChatRoomList(int userNo) {
		return cDao.selectChatRoomList(userNo);
	}

	@Override
	public int insertChatRoom(ChatRoomJoin join) {
		return cDao.insertChatRoom(join);
	}

	@Override
	public int selectOne(String title) {
		return cDao.selectOne(title);
	}

	@Override
	public List<ChatRoom> selectChatRoomListByKeyword(Map<String, Object> map) {
		return cDao.selectChatRoomListByKeyword(map);
	}

	@Override
	public List<ChatRoomJoin> joinChatRoom(ChatRoomJoin join) {
		return cDao.joinChatRoom(join);
	}

	@Override
	public List<ChatMessage> selectMsgList(ChatRoomJoin join) {
		return cDao.selectMsgList(join);
	}

	@Override
	public int insertMessage(ChatMessage cm) {
		
		cm.setMessage(Utils.XSSHandling(cm.getMessage()));
		cm.setMessage(Utils.newLineHandling(cm.getMessage()));
		
		return cDao.insertMessage(cm);
	}

	@Override
	public List<Member> searchFollowListByFollow(Map<String, Object> map) {
		return cDao.searchFollowListByFollow(map);
	}

	@Override
	public List<ChatRoomJoin> selectChatRoomListImage(int userNo) {
		return cDao.selectChatRoomListImage(userNo);
	}

	@Override
	public int exitChatRoom(ChatRoomJoin join) {
		return cDao.exitChatRoom(join);
	}

	@Override
	public int sendImgFile(ChatMessage cm) {
		return cDao.sendImgFile(cm);
	}

	@Override
	public int insertImgFile(Images image) {
		return cDao.insertImgFile(image);
	}

	@Override
	public List<ChatRoomJoin> selectChatRoomImage(int chatRoomNo) {
		return cDao.selectChatRoomImage(chatRoomNo);
	}

	@Override
	public ChatMessage selectImage(ChatMessage message) {
		return cDao.selectImage(message);
	}

	@Override
	public ChatMessage selectNewImg(ChatMessage message) {
		return cDao.selectNewImg(message);
	}

	@Override
	public ChatMessage selectNewMsg(int chatRoomNo) {
		return cDao.selectNewMsg(chatRoomNo);
	}

	@Override
	public ChatMessage selectThumbnail(int feedNo) {
		return cDao.selectThumbnail(feedNo);
	}

	@Override
	public Feed selectFeedOne(int feedNo) {
		return cDao.selectFeedOne(feedNo);
	}

	@Override
	public List<Reply> selectReply(int feedNo) {
		return cDao.selectReply(feedNo);
	}

	@Override
	public List<Images> selectFeedImg(int feedNo) {
		return cDao.selectFeedImg(feedNo);
	}

	@Override
	public List<ChatRoomJoin> selectJoinUsers(Map<String, Object> map) {
		return cDao.selectJoinUsers(map);
	}


	

}
