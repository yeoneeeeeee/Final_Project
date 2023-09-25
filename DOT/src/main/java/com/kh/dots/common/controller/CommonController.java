package com.kh.dots.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dots.chatting.model.service.ChatService;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.common.model.template.Pagination;
import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.PageInfo;
import com.kh.dots.common.model.vo.Report;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.common.service.CommonService;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.service.FeedService;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Friend;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {

	@Autowired
	private CommonService cService;

	@Autowired
	private MemberService mService;
	
	@Autowired
	private ChatService chService;
	
	@Autowired
	private FeedService fService;

	@ResponseBody
	@RequestMapping(value = "/upToDate",method = RequestMethod.POST)
	public int upToDate(HttpSession session, @RequestParam HashMap<String,Object> param, int loginUserNo) {

		Object a = param.get("alarmlist1");
		List<Alarm> list = new ArrayList();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		List<Alarm> list2 = cService.selectMyAlarm(loginUser.getUserNo());
		log.info("알람테스트={}",list2);
		
		List<Member> friendList = new ArrayList();
			 
		List<Friend> mlist = mService.sideFriendList(loginUser.getUserNo());
		
		for(Friend b : mlist) {
			Member f = mService.selectFriendList2(b);
			if(f != null) {
				friendList.add(f);
			}
		}
		session.setAttribute("mlist", friendList);
		session.setAttribute("alarmlist", list2);
		log.info("mlistlate={}",session.getAttribute("mlist"));
		log.info("alarmListabcabcc={}",session.getAttribute("alarmlist"));
		
		int result = 0; 

		return result;
	}
	
	@GetMapping("/search")
	public String search(HttpSession Session, Model model) {
		Member m = (Member) Session.getAttribute("loginUser");
		List<ChatRoom> crList = chService.selectChatRoomList(m.getUserNo());
		List<Member> follow2 = mService.searchFollowList(m.getUserNo());
		List<ChatRoomJoin> crImage = chService.selectChatRoomListImage(m.getUserNo());
		List<Search> MyHistory1 = cService.MyHistory(m.getUserNo());
		List<Search> MyHistory = new ArrayList();
		for(int i=0; i<MyHistory1.size(); i++) {
			if(i<8) {
				Search s = MyHistory1.get(i);
				MyHistory.add(s);
			}else {
				break;
			}
		}
		
		Session.setAttribute("history",MyHistory);
		List<Images> slist = cService.selectList();
		log.info("slist = {} ", slist);
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("follow", follow2);
		model.addAttribute("chatRoomImage", crImage);
		model.addAttribute("slist", slist);
		
		return "common/search.jsp";
	}
	
	@ResponseBody
	@PostMapping("/insertReport.re")
	public int insertReport(HttpSession session, String ReportContent, int ReportFno ) {
		Member m = (Member)session.getAttribute("loginUser");
		Feed f = fService.selectFeedData(ReportFno);
		Report r = new Report();
		r.setReportWriter(m.getUserNo());
		r.setReportTitle(m.getUserNick()+"님의 신고");
		r.setReportContent(ReportContent);
		r.setReportTarget(f.getFeedWriter());
		r.setReportFno(ReportFno);
		
		int result = cService.insertReport(r);
		log.info("{}",result);
		return result;
	}

	// 검색 기능
	@GetMapping("/searchList.se")
	public String selectList(@RequestParam(name = "keyword") String keyword, Model model, HttpSession Session, @RequestParam Map<String, Object> paramMap) {
		Member m = (Member) Session.getAttribute("loginUser");
		List<Member> rf = mService.recommandFollowList(m.getUserNo());
		log.info("rf={}", rf);
		List<ChatRoom> crList = chService.selectChatRoomList(m.getUserNo());
		List<Member> follow2 = mService.searchFollowList(m.getUserNo());
		List<ChatRoomJoin> crImage = chService.selectChatRoomListImage(m.getUserNo());
		
		model.addAttribute("rf", rf);
		log.info("keyword = {}", paramMap);
		List<Search> MyHistory = cService.MyHistory(m.getUserNo());
		int result = 0;
		Search search = new Search();
		search.setSearchWriter(m.getUserNo());
		search.setSearchKeyword(keyword);
		result = cService.insertSearch(search);
		log.info("result={}", result);

		List<Search> MyHistory1 = cService.MyHistory(m.getUserNo());
		List<Search> MyHistory2 = new ArrayList();
		for(int i=0; i<MyHistory1.size(); i++) {
			if(i<8) {
				Search s = MyHistory1.get(i);
				MyHistory2.add(s);
			}else {
				break;
			}
		}
		
		Session.setAttribute("history",MyHistory2);
		
		log.info("paramMap={}",paramMap);
		List<Images> slist2 = cService.selectList2(paramMap);
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("follow", follow2);
		model.addAttribute("chatRoomImage", crImage);
		model.addAttribute("keyword",keyword);
		model.addAttribute("slist", slist2);
		return "common/search.jsp";
	}

	@GetMapping("/Alarm.al")
	public String enterAlarm(HttpSession Session, Model model) {
		return "common/alarm.jsp";
	}

	@GetMapping("/otherperson.op")
	public String otherpseron(int ano, Model model, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Alarm al = cService.selectAlarmOne(ano);
		log.info("ano={}",ano);
		log.info("al={}",al);
		Member otherUser = mService.checkMember(al.getAlarmWriter());
		List<Images> myImglist = mService.selectListMyImg(al.getAlarmWriter());
		List<Member> follower = mService.searchFollowerList(al.getAlarmWriter());
		List<Member> follow = mService.searchFollowList(al.getAlarmWriter());
		int result = cService.updateRead(ano);
		List<Alarm> list = cService.selectMyAlarm(loginUser.getUserNo());
		session.setAttribute("alarmlist", list);

		model.addAttribute("follower", follower);
		model.addAttribute("follow", follow);
		model.addAttribute("otherUser", otherUser);
		model.addAttribute("myImglist", myImglist);

		return "member/YourFeed.jsp";
	}
	
	@GetMapping("/myperson.op")
	public String myperson(int ano, Model model, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Alarm al = cService.selectAlarmOne(ano);
		log.info("ano={}",ano);
		log.info("al={}",al);
		Member otherUser = mService.checkMember(al.getAlarmAcceptUser());
		List<Images> myImglist = mService.selectListMyImg(al.getAlarmAcceptUser());
		List<Member> follower = mService.searchFollowerList(al.getAlarmAcceptUser());
		List<Member> follow = mService.searchFollowList(al.getAlarmAcceptUser());
		int result = cService.updateRead(ano);
		List<Alarm> list = cService.selectMyAlarm(loginUser.getUserNo());
		session.setAttribute("alarmlist", list);

		model.addAttribute("follower", follower);
		model.addAttribute("follow", follow);
		model.addAttribute("otherUser", otherUser);
		model.addAttribute("myImglist", myImglist);

		return "member/MyFeed.jsp";
	}
	
	@GetMapping("/myMessage.ms")
	public String myMessage(int ano, Model model, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Alarm al = cService.selectAlarmOne(ano);
		int result = cService.updateRead(ano);
		List<Alarm> list = cService.selectMyAlarm(loginUser.getUserNo());
		session.setAttribute("alarmlist", list);
		
		return "/chat/chatRoomList";
	}

	/* 어드민 기능 */
	@GetMapping("/adminMain")
	public String adminMain(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {
		int offset = (currentPage - 1) * 5;
		int limit = 5;

		log.info("paramMap ={}", paramMap);

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> memList = cService.memList(paramMap, rowBounds);
		List<Member> BListTrue = new ArrayList();
		List<Member> WListTrue = new ArrayList();
		for(Member bm : memList) {
			int count = cService.countReport(bm.getUserNo());
			bm.setReportCount(count);
			BListTrue.add(bm);
		}
		for(Member wm : BListTrue) {
			int count = cService.countFollower(wm.getUserNo());
			wm.setFollowerCount(count);
			WListTrue.add(wm);
		}
		
		int total = cService.selectMListCount(paramMap);
		log.info("total ={}", total);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);

		log.info("pi ={}", pi);
		model.addAttribute("memList", WListTrue);
		model.addAttribute("pi", pi);

		return "admin/adminMain.jsp";
	}
	
	@ResponseBody
	@PostMapping("/BListMemberadmin")
	public int BListMemberadmin(@RequestParam(value="rowCheck[]") List<Integer> array) {
		int result = 0;
		
		log.info("rowCheck={}",array);
		for(int i : array) {
			result = cService.BlackMember(i);
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/WListMemberadmin")
	public int WListMemberadmin(@RequestParam(value="rowCheck[]") List<Integer> array) {
		int result = 0;
		
		log.info("rowCheck={}",array);
		for(int i : array) {
			result = cService.WhiteMember(i);
		}
		
		return result;
	}

	@GetMapping("/adminFeed")
	public String adminFeed(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {
		int offset = (currentPage - 1) * 5;
		int limit = 5;

		log.info("paramMap ={}", paramMap);

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Feed> feList1 = cService.feList1();
		List<Feed> feList = cService.feList(paramMap, rowBounds);
		log.info("feList1 ={}", feList1);
		int total = cService.selectFListCount(paramMap);
		log.info("total ={}", total);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);

		log.info("pi ={}", pi);
		model.addAttribute("feList", feList);
		model.addAttribute("pi", pi);
		return "admin/adminFeed.jsp";
	}

	@PostMapping("/deleteFeed")
	public String deleteFeed(int[] rowCheck) {
		log.info("rowCheck={}", rowCheck);
		int result = 0;
		for (int i = 0; i < rowCheck.length; i++) {
			result = cService.deleteFeed(rowCheck[i]);
			if (result == 0) {
				break;
			}
		}
		return "redirect:/adminFeed";
	}
	
	@GetMapping("/adminWList")
	public String adminWList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		int offset = (currentPage -1) *5;
		int limit = 5;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> WList = cService.WList(paramMap, rowBounds);
		List<Member> WListTrue = new ArrayList();
		for(Member wm : WList) {
			int count = cService.countFollower(wm.getUserNo());
			wm.setFollowerCount(count);
			WListTrue.add(wm);
		}
		
		log.info("WList ={}", WListTrue);
		int total = cService.selectWListCount(paramMap);		
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("WList", WListTrue);
		model.addAttribute("pi", pi);
		return "admin/adminWList.jsp";
	}
	
	@GetMapping("/adminBList")
	public String adminBList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		int offset = (currentPage -1) *5;
		int limit = 5;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> BList = cService.BList(paramMap, rowBounds);
		List<Member> BListTrue = new ArrayList();
		for(Member bm : BList) {
			int count = cService.countReport(bm.getUserNo());
			bm.setReportCount(count);
			BListTrue.add(bm);
		}
		
		log.info("BList ={}", BListTrue);
		int total = cService.selectBListCount(paramMap);		
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("BList", BListTrue);
		model.addAttribute("pi", pi);
		return "admin/adminBList.jsp";
	}
	
	@GetMapping("/adminReport")
	public String adminReport(Model model,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			@RequestParam Map<String, Object> paramMap,
			Member m
			) {
		int offset = (currentPage -1) *5;
		int limit = 5;
		
		paramMap.put("m", m);
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Report> rlist = cService.selectReportList(paramMap, rowBounds);
		int total = cService.selectRListCount(paramMap);		
		log.info("rlist ={}", rlist);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		model.addAttribute("rlist", rlist);
		model.addAttribute("pi", pi);
		
		return "admin/adminReport.jsp";
	}
	
	@ResponseBody
	@GetMapping("/detailReport")
	public Report detailReport(
			Model model,
			int reportNo
			) {
		Report detailList = cService.detailList(reportNo); 
		int result = cService.updateReadReport(reportNo);
		log.info("detailList={}",detailList);
		
		return detailList;
	}
	
	@GetMapping("/deleteReport")
	public String deleteReport(
			int[] rowCheck
			) {
		log.info("rowCheck={}",rowCheck);
		int result = 0;
		if(rowCheck !=null) {
			for (int i = 0; i < rowCheck.length; i++) {
				result = cService.deleteReport(rowCheck[i]);
				if (result == 0) {
					break;
				}
			}
		}
		return "/adminReport";
	}
	
	@ResponseBody
	@GetMapping("/processReport")
	public int processReport(
			Model model,
			int reportNo
			) {
		int result = cService.deleteReport(reportNo);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/BListDeleteadmin")
	public int BListDeleteadmin(
			@RequestParam(value="rowCheck[]") List<Integer> array
			) {
		int result = 0;
		for(int i : array) {
			result = cService.BListDeleteadmin(i);
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/WListDeleteadmin")
	public int WListDeleteadmin(
			@RequestParam(value="rowCheck[]") List<Integer> array
			) {
		int result = 0;
		for(int i : array) {
			result = cService.WListDeleteadmin(i);
		}
		
		return result;
	}
	

}
