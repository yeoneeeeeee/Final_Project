package com.kh.dots.common.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.Report;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.member.model.vo.Member;

public interface CommonService {

	public List<Images> selectList();

	public int keywordList(Map<String, Object> map);

	public List<Member> memList1();

	public List<Member> memList(Map<String, Object> paramMap, RowBounds rowBounds);

	public int selectMListCount(Map<String, Object> paramMap);

	public List<Feed> feList(Map<String, Object> paramMap, RowBounds rowBounds);

	public List<Feed> feList1();

	public int selectFListCount(Map<String, Object> paramMap);

	public int deleteFeed(int i);

	public List<Search> MyHistory(int i);

	public int insertSearch(Search search);

	public List<Alarm> selectMyAlarm(int userNo);

	public int insertFollowAlarm1(Member m1);

	public int updateFollowAlarm1(Member m2);

	public Alarm selectAlarmOne(int ano);

	public int updateRead(int ano);

	public int insertLikeAlarm1(Member m1);

	public int updateLikeAlarm1(Member m2);

	public List<Member> WList(Map<String, Object> paramMap, RowBounds rowBounds);

	public int selectWListCount(Map<String, Object> paramMap);

	public List<Member> BList(Map<String, Object> paramMap, RowBounds rowBounds);

	public int selectBListCount(Map<String, Object> paramMap);

	public List<Report> selectReportList(Map<String, Object> paramMap, RowBounds rowBounds);

	public int selectRListCount(Map<String, Object> paramMap);

	public Report detailList(int reportNo);

	public int updateReadReport(int reportNo);

	public int deleteReport(int i);
	
	public int insertChatAlarm(Alarm alarm);

	public List<Images> selectList2(Map<String, Object> paramMap);

	public int insertReport(Report r);

	public int BlackMember(int i);

	public int WhiteMember(int i);

	public int countReport(int userNo);

	public int countFollower(int userNo);

	public int BListDeleteadmin(int i);

	public int WListDeleteadmin(int i);
}
