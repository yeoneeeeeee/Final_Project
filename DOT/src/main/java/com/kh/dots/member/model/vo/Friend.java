package com.kh.dots.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Friend {
	private int friendNo;
	private int friendUser1;
	private int friendUser2;
	private String enable;
}
