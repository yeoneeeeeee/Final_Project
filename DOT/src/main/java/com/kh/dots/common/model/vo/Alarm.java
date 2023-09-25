package com.kh.dots.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Alarm {

	private int alarmNo; 
	private int alarmWriter;
	private int alarmAcceptUser;
	private String alarmContent;
	private String alarmType;
	
	private String userNick;
	private String userNo;
	private String filePath;
	private String changeName;
	
	
}
