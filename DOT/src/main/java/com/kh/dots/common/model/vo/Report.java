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
public class Report {
	private int reportNo; //	REPORT_NO
	private int reportWriter; //	REPORT_WRITER
	private String reportTitle; //	REPORT_TITLE
	private String reportContent; //	REPORT_CONTENT
	private Date enrollDate; //	ENROLL_DATE
	private String reportStatus; // REPORT_STATUS
	private int reportTarget; // REPORT_TARGET
	private int reportFno; // REPORT_FNO
	
	
	private String userNick;
}
