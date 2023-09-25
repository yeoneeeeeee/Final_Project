package com.kh.dots.common.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dots.common.model.dao.CommonDao;
import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.Report;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.member.model.vo.Member;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonDao cDao;
	
	public List<Images> selectList(){
		return cDao.selectList();
	}

	public int keywordList(Map<String, Object> map) {
		return cDao.keywordList(map);
	}

	@Override
	public List<Member> memList1() {
		return cDao.memList1();
	}

	@Override
	public List<Member> memList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.memList(paramMap,rowBounds);
	}

	@Override
	public int selectMListCount(Map<String, Object> paramMap) {
		return cDao.selectMListCount(paramMap);
	}

	@Override
	public List<Feed> feList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.feList(paramMap, rowBounds);
	}

	@Override
	public List<Feed> feList1() {
		return cDao.feList1();
	}

	@Override
	public int selectFListCount(Map<String, Object> paramMap) {
		return cDao.selectFListCount(paramMap);
	}

	@Override
	public int deleteFeed(int i) {
		return cDao.deleteFeed(i);
	}

	@Override
	public List<Search> MyHistory(int i) {
		return cDao.MyHistory(i);
	}

	@Override
	public int insertSearch(Search search) {
		return cDao.insertSearch(search);
	}

	@Override
	public List<Alarm> selectMyAlarm(int userNo) {
		return cDao.selectMyAlarm(userNo);
	}

	@Override
	public int insertFollowAlarm1(Member m1) {
		return cDao.insertFollowAlarm1(m1);
	}

	@Override
	public int updateFollowAlarm1(Member m2) {
		return cDao.updateFollowAlarm1(m2);
	}

	@Override
	public Alarm selectAlarmOne(int ano) {
		return cDao.selectAlarmOne(ano);
	}

	@Override
	public int updateRead(int ano) {
		return cDao.updateRead(ano);
	}

	@Override
	public int insertLikeAlarm1(Member m1) {
		return cDao.insertLikeAlarm1(m1);
	}

	@Override
	public int updateLikeAlarm1(Member m2) {
		return cDao.updateLikeAlarm1(m2);
	}

	@Override
	public List<Member> WList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.WList(paramMap,rowBounds);
	}

	@Override
	public int selectWListCount(Map<String, Object> paramMap) {
		return cDao.selectWListCount(paramMap);
	}

	@Override
	public List<Member> BList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.BList(paramMap,rowBounds);
	}

	@Override
	public int selectBListCount(Map<String, Object> paramMap) {
		return cDao.selectBListCount(paramMap);
	}


	@Override
	public List<Report> selectReportList(Map<String, Object> paramMap, RowBounds rowBounds) {
		return cDao.selectReportList(paramMap,rowBounds);
	}

	@Override
	public int selectRListCount(Map<String, Object> paramMap) {
		return cDao.selectRListCount(paramMap);
	}

	@Override
	public Report detailList(int reportNo) {
		return cDao.detailList(reportNo);
	}

	@Override
	public int updateReadReport(int reportNo) {
		return cDao.updateReadReport(reportNo);
	}

	@Override
	public int deleteReport(int i) {
		return cDao.deleteReport(i);
	}
	
	@Override
	public int insertChatAlarm(Alarm alarm) {
		return cDao.insertChatAlarm(alarm);
	}

	@Override
	public List<Images> selectList2(Map<String, Object> paramMap) {
		return cDao.selectList2(paramMap);
	}

	@Override
	public int insertReport(Report r) {
		return cDao.insertReport(r);
	}

	@Override
	public int BlackMember(int i) {
		return cDao.BalckMember(i);
	}

	@Override
	public int WhiteMember(int i) {
		return cDao.WhiteMember(i);
	}

	@Override
	public int countReport(int userNo) {
		return cDao.countReport(userNo);
	}

	@Override
	public int countFollower(int userNo) {
		return cDao.countFollower(userNo);
	}

	@Override
	public int BListDeleteadmin(int i) {
		return cDao.BListDeleteadmin(i);
	}

	@Override
	public int WListDeleteadmin(int i) {
		return cDao.WListDeleteadmin(i);
	}

}
