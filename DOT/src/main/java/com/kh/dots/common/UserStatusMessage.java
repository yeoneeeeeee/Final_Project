package com.kh.dots.common;

import java.util.List;

import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserStatusMessage {
    private String userNick;
    private boolean checkLog;
    private int userNo;
    private int userNo2;
    private List<Member> friendList;
    private List<Alarm> alarmList;
}
