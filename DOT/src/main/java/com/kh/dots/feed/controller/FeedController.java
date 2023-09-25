package com.kh.dots.feed.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dots.chatting.model.service.ChatService;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.common.Utils;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.common.service.CommonService;
import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Like;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.feed.service.FeedService;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Friend;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginUser"})
public class FeedController {

	@Autowired
	private FeedService fService;
	
	@Autowired MemberService mService;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private CommonService cService;
	
	@Autowired
	private ChatService chService;

	@GetMapping("/mainFeed")
	public String forwardFeedMain(HttpSession Session,Model model) {
		Member m = (Member)Session.getAttribute("loginUser");
	
		List <Member> member= fService.profile(m.getUserNo());
		List <Images> feedImg = fService.feedimg4();
		List <Feed> feedList = fService.feedList4();
		List <Reply> reply = fService.reply4();
		List <Like> like = fService.like4(m.getUserNo());
		List <Choice> choice = fService.choice4(m.getUserNo());
		List <Friend> follwer = fService.friend4(m.getUserNo());
		List <Friend> follow4 = fService.friend5(m.getUserNo());
		List <Choice> choiceFilter = fService.choiceFilter();
		List <Friend> friendList = fService.friendList(m.getUserNo());
		
		List<ChatRoom> crList = chService.selectChatRoomList(m.getUserNo());
		List<Member> follow = mService.searchFollowList(m.getUserNo());
		List<ChatRoomJoin> crImage = chService.selectChatRoomListImage(m.getUserNo());
		
		List<Member> rf = mService.recommandFollowList(m.getUserNo());
		log.info("rp={}", reply);
		model.addAttribute("rf", rf);
		
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("follow", follow);
		model.addAttribute("chatRoomImage", crImage);
		
		model.addAttribute("cf",choiceFilter);
		model.addAttribute("m",m);
		model.addAttribute("fw",follow4);
		model.addAttribute("fr",follwer);
		model.addAttribute("ci",choice);
		model.addAttribute("lk",like);
		model.addAttribute("rp",reply);
		model.addAttribute("mem",member);
		model.addAttribute("fi",feedImg);
		model.addAttribute("fd",feedList);
		model.addAttribute("friendList",friendList);
		
		return "sns/mainFeed.jsp";
	}
	
	@GetMapping("/MyFeedEnroll.me")
	public String MyFeedEnroll(HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Images profileImg = mService.selectListImages(loginUser.getUserNo());
		return "/member/MyFeedEnroll.jsp";
	}
	
	@PostMapping("/feedEnroll.fe") 
	public String feedEnroll(HttpSession session, Feed feed, String hashTag,
			MultipartFile feedImg1,
			MultipartFile feedImg2,
			MultipartFile feedImg3,
			MultipartFile feedImg4,
			MultipartFile feedImg5,
			Model model
			) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		feed.setFeedHashtag(hashTag);
		feed.setFeedWriter(loginUser.getUserNo());
		log.info("Feed={}",feed.toString());
		
		String webPath = "resources/images";
		String severFolderPath = application.getRealPath(webPath+"/");
		
		List<MultipartFile> feedImgs = new ArrayList();
		feedImgs.add(feedImg1);
		feedImgs.add(feedImg2);
		feedImgs.add(feedImg3);
		feedImgs.add(feedImg4);
		feedImgs.add(feedImg5);
		// 디렉토리생성 , 해당디렉토리가 존재하지 않는다면 생성
		File dir = new File(severFolderPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		List<Images> imgs = new ArrayList();
		int level = 2;
		for(MultipartFile img : feedImgs) {
			if(img != null && !img.isEmpty()) {
				String originalFilename = img.getOriginalFilename();
				if(originalFilename != null && !originalFilename.isEmpty()) {
					String changeName = Utils.saveFile(img, severFolderPath);
					 Images image = Images.builder()
		                        .fileWriter(loginUser.getUserNo())
		                        .changeName(changeName)
		                        .originName(originalFilename)
		                        .fileLevel(level++)
		                        .filePath(webPath)
		                        .build();
		                imgs.add(image);
				}
			}else {
				Images image = Images.builder()
                        .fileWriter(loginUser.getUserNo())
                        .changeName("DotLogo_D.png")
                        .originName("DotLogo_D.png")
                        .fileLevel(level++)
                        .filePath(webPath)
                        .build();
                imgs.add(image);
			}
		}
		log.info("imgs={}",imgs);
		
		int result1 = fService.insertFeed(feed);
		int result2 = fService.insertFeedImg(imgs);
		if(result1>0 && result2>0) {
			session.setAttribute("alertMsg","게시물 작성 성공!");
			return "redirect:/MyFeed.me";
		}else {
			session.setAttribute("alertMsg","게시물 작성 실패!");
			return "redirect:/MyFeedEnroll.me";
		}
	}
	
	@GetMapping("/MyFeedEdit.me")
	public String MyFeedEdit(HttpSession session, int fno, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Images profileImg = mService.selectListImages(loginUser.getUserNo());
		
		Feed feed = fService.selectFeedData(fno);
		List<Images> feedImgs = fService.selectFeedImgList(fno);
		model.addAttribute("feed",feed);
		model.addAttribute("feedImgs",feedImgs);
		return "/member/MyFeedEdit.jsp";
	}
	
	@PostMapping("/feedEdit.fe")
	public String feedEdit(HttpSession session, Feed feed, String hashTag,
			MultipartFile feedImg1,
			MultipartFile feedImg2,
			MultipartFile feedImg3,
			MultipartFile feedImg4,
			MultipartFile feedImg5,
			int fno,
			String deleteList,
			Model model
			) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		feed.setFeedHashtag(hashTag);
		feed.setFeedWriter(loginUser.getUserNo());
		feed.setFeedNo(fno);
		
		String webPath = "resources/images";
		String severFolderPath = application.getRealPath(webPath+"/");
		List<MultipartFile> upfiles = new ArrayList();
		upfiles.add(feedImg1);
		upfiles.add(feedImg2);
		upfiles.add(feedImg3);
		upfiles.add(feedImg4);
		upfiles.add(feedImg5);
		int result = fService.updateFeed(feed, upfiles, severFolderPath, webPath, deleteList);
		
		if(result > 0) {
			session.setAttribute("alertMsg","게시물 수정 성공!");
			return "redirect:/MyFeed.me";
		}else {
			session.setAttribute("alertMsg","게시물 수정 실패!");
			return "redirect:/feedEdit.fe";
		}
	}
	
	/* 준호형 파트*/
	@ResponseBody
	@PostMapping("/mainFeed/insertReply")
	public int insertReply(Reply r, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			r.setReplyWriter(m.getUserNo());
		}
		int result = fService.insertReply(r);
		return result;
		
	}
	
	@GetMapping("/mainFeed/selectReplyList")
	@ResponseBody
	public List<Reply> selectReplyList(int bno) {
		return fService.selectReplyList(bno);
	}
	
	@PostMapping("/mainFeed/likeCount")
	@ResponseBody
	public List<Feed> likeCount(int feedNo) {
		return fService.likeCount(feedNo);
	}
	
	@ResponseBody
	@PostMapping("/mainFeed/addLike")
	public int addLike(Like l,Feed f, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			l.setLikeMember(m.getUserNo());
			l.setLikeFno(f.getFeedNo());
			f.setFeedWriter(m.getUserNo());
		}
		int il = fService.insertLike(l);
		int ul = fService.updateLike(f);
		
		int result = 0 ;
		if(ul > 0 && ul > 0) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/mainFeed/removeLike")
	public int removeLike(Like l,Feed f, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			l.setLikeMember(m.getUserNo());
			l.setLikeFno(f.getFeedNo());
			f.setFeedWriter(m.getUserNo());
		}
		int il = fService.removeLike(l);
		int ul = fService.removeLikeCount(f);
		
		int result = 0 ;
		if(ul > 0 && ul > 0) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/mainFeed/addChoice")
	public int addChoice(Choice c,Feed f, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			c.setChoiceMember(m.getUserNo());
			c.setChoiceFno(f.getFeedNo());
		}
		List<Choice> list = fService.checkChoice(c);
		log.info("choiceList={}",c);
		int ac = 0;
		if(list .isEmpty()) {
			ac = fService.addChoice(c);
		}
		int result = 0 ;
		if(ac > 0  ) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/mainFeed/removeChoice")
	public int removeChoice(Choice c,Feed f, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			c.setChoiceMember(m.getUserNo());
			c.setChoiceFno(f.getFeedNo());
		}
		int rc = fService.removeChoice(c);
		int result = 0 ;
		if(rc > 0 ) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	   @PostMapping("/mainFeed/unfollow")
	   public String unFollow( Member mb,HttpSession Session ) {
	      Member m = (Member)Session.getAttribute("loginUser");
	      Map <String,Integer> map= new HashMap();
	      map.put("loginUserNo",m.getUserNo());
	      map.put("userNo",mb.getUserNo());
	      int result = fService.unFollow(map);
	      return result+"";
	   }
	   
	   @ResponseBody
	   @PostMapping("/mainFeed/addfollow")
	   public String addFollow(Member mb, HttpSession Session) {
	      Member m = (Member)Session.getAttribute("loginUser");
	      Map <String,Integer> map= new HashMap();
	      map.put("loginUserNo",m.getUserNo());
	      map.put("userNo",mb.getUserNo());
	      
	      int result = fService.addFollow(map);
	      return result+"";
	   }
 
}
