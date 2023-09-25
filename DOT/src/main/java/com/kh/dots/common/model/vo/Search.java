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
public class Search {

	private int searchNo; //SEARCH_NO
	private int searchWriter; //SEARCH_WRITER
	private String searchKeyword; //SEARCH_KEYWORD
	private Date enrollDate; //ENROLL_DATE
	
}
