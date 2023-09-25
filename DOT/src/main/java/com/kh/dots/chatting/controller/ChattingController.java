package com.kh.dots.chatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.dots.chatting.service.ChattingService;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService chatService;
	
	
}
