package com.kh.dots.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.service.CommonService;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WebSocketController  {

	@Autowired
	MemberService mService;
	
	@Autowired
	CommonService cService;
	
	private final SimpMessageSendingOperations messagingTemplate;
	
	 public WebSocketController(SimpMessageSendingOperations messagingTemplate) {
	        this.messagingTemplate = messagingTemplate;
	 }
   
	 @MessageMapping("/updateLoginStatus")
	 public void updateLoginStatus(@Payload UserStatusMessage message /*@DestinationVariable("userNo") int userNo*/) {
        // 클라이언트로부터 받은 사용자 로그인 상태를 업데이트
        String userNick = message.getUserNick(); // 사용자명
        boolean checkLog = message.isCheckLog(); // 로그인 상태
        int userNo = message.getUserNo();
        
        log.info("userNick={}",userNick);
        log.info("checkLog={}",checkLog);
        log.info("userNo={}",userNo);
        Member m = new Member();
        m.setUserNick(userNick);
        if(checkLog) {
        	m.setCheckLog("Y");
        }
        
        // 여기에서 해당 사용자의 로그인 상태를 업데이트하는 로직 추가
        int result = mService.updateUserLoginStatus(m);
        log.info("result={}",result);
        
        List<Member> Allmember = mService.selectAll();
        
        log.info("WebFriend={}",Allmember);
		String userTopic = "/topic/updateLoginStatus";
		message.setFriendList(Allmember);
        messagingTemplate.convertAndSend(userTopic, message);
	 }
	 
	 @MessageMapping("/updateLogoutStatus")
	 //@SendTo("/topic/friendLoginStatus")
	 public void updateLogoutStatus(@Payload UserStatusMessage message) {
	     String userNick = message.getUserNick(); // 사용자명
	     boolean checkLog = message.isCheckLog();
	     // 여기에서 해당 사용자의 로그인 상태를 로그아웃(false)으로 업데이트하는 로직 추가
	     log.info("userNick2={}",userNick);
	     log.info("checkLog2={}",checkLog);
	     Member m = new Member();
		 m.setUserNick(userNick);
		 if(checkLog == false) {
			m.setCheckLog("N");
		 } 
		 int result = mService.updateUserLoginStatus(m);
		 log.info("result={}",result);
	        
	     // 업데이트된 사용자 상태를 반환
	     //message.setCheckLog(false);
	     //return message;
		 List<Member> Allmember = mService.selectAll();
		 String userTopic = "/topic/friendLoginStatus";
		 message.setFriendList(Allmember);
		 messagingTemplate.convertAndSend(userTopic, message);
	 }

	 @MessageMapping("/updateFollowStatus")
	 public void updateFollowStatus(@Payload UserStatusMessage message) {
		 int userNo = message.getUserNo();
		 int loginNo = message.getUserNo2();
		 Member m1 = mService.checkMember(userNo);
		 Member m2 = mService.checkMember(loginNo);
		 log.info("websocketNo={}", m1.getUserNo());
		 log.info("websocketNo2={}", m1.getUserNick());
		 int result = cService.insertFollowAlarm1(m1);
		 int result2 = cService.updateFollowAlarm1(m2);
		 
		 
		 List<Alarm> list = cService.selectMyAlarm(userNo);
		 log.info("list={}",list);
			
		 
		 message.setAlarmList(list);
		 messagingTemplate.convertAndSend("/topic/updateFollowStatus", message);
	 }
	 
	 @MessageMapping("/updateLikeStatus")
	 public void updateLikeStatus(@Payload UserStatusMessage message) {
		 int feedNo = message.getUserNo();
		 int loginNo = message.getUserNo2();
		 
		 Member Writer = mService.feedMember(feedNo);
		 int userNo = Writer.getUserNo();
		 Member m1 = mService.checkMember(userNo);
		 Member m2 = mService.checkMember(loginNo);
		 int result = cService.insertLikeAlarm1(m1);
		 int result2 = cService.updateLikeAlarm1(m2);
		 
		 List<Alarm> list = cService.selectMyAlarm(userNo);
		 log.info("list={}",list);
			
		 
		 message.setAlarmList(list);
		 message.setUserNo(userNo);
		 
		 messagingTemplate.convertAndSend("/topic/updateLikeStatus", message);
	 }
 }
	 

