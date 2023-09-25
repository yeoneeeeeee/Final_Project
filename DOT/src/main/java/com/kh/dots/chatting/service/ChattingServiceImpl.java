package com.kh.dots.chatting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.chatting.model.dao.ChattingDao;

@Service
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	private ChattingDao chatDao;
}
