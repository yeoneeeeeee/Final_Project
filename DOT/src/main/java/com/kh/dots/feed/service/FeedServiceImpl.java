package com.kh.dots.feed.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dots.common.Utils;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.dao.FeedDao;
import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Like;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.member.model.vo.Friend;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedDao fDao;

	@Override
	public int insertFeed(Feed feed) {
		return fDao.insertFeed(feed);
	}

	@Override
	public int insertFeedImg(List<Images> imgs) {
		return fDao.insertFeedImg(imgs);
	}

	@Override
	public Feed selectFeedData(int fno) {
		return fDao.selectFeedData(fno);
	}

	@Override
	public List<Images> selectFeedImgList(int fno) {
		return fDao.selectFeedImgList(fno);
	}

	@Override
	public int updateFeed(Feed feed, List<MultipartFile> upfiles, String severFolderPath, String webPath,
			String deleteList) {
		log.info("Feed={}",feed.toString());
		log.info("deleteList",deleteList);
		log.info("upfiles={}",upfiles);
		int result = fDao.updateFeedText(feed);
		int result2 = 0;
		// 삭제
		if(deleteList != null && !deleteList.equals("")) {
			Map<String, Object> map = new HashMap();
			map.put("feedNo", feed.getFeedNo());
			map.put("deleteList",deleteList);
			
			result2 = fDao.deleteImage(map); 
		}
		
		
		if(result > 0) {
			List<Images> list = new ArrayList();
			List<Images> preList = fDao.selectFeedImgList(feed.getFeedNo());
			int level = 2;
			if(upfiles != null) {
				for(int i = 0 ; i < upfiles.size() ; i++) {
					
					if(!upfiles.get(i).isEmpty()) {
					String changeName = Utils.saveFile(upfiles.get(i), severFolderPath);
					
					Images img = Images
								 .builder()
								 .fileWriter(feed.getFeedWriter())
			                     .changeName(changeName)
			                     .originName(upfiles.get(i).getOriginalFilename())
			                     .fileLevel(level)
			                     .filePath(webPath)
			                     .fileFno(feed.getFeedNo())
			                     .build();
					level++;
			         list.add(img);
					}else {
						level++;
					}
				}
				log.info("list={}",list);
			}
			
			for( Images i : list) {
				result = fDao.updateImage(i);
				if(result == 0) {
					result = fDao.insertImage(i);
				}
			}
		}
		return result;
	}
	
	@Override
	public List<Member> profile(int userNo) {
		return fDao.profile(userNo);
	}
	
	@Override
	public List<Images> feedimg4() {
		return fDao.feedimg4();
	}

	@Override
	public List<Feed> feedList4() {
		return fDao.feedList4();
	}

	@Override
	public List<Reply> reply4() {
		return fDao.reply4();
	}

	@Override
	public int insertReply(Reply r) {
		return fDao.insertReply(r);
	}

	@Override
	public List<Reply> selectReplyList(int bno) {
		return fDao.selectReplyList(bno);
	}


	@Override
	public int updateLike(Feed f) {
		return fDao.updateLike(f);
	}

	@Override
	public List<Like> like4(int userNo) {
		return fDao.like4(userNo);
	}

	@Override
	public int removeLikeCount(Feed f) {
		return fDao.removeLikeCount(f);
	}
	@Override
	public int insertLike(Like l) {
		return fDao.insertLike(l);
	}
	
	@Override
	public int removeLike(Like l) {
		return fDao.removeLike(l);
	}

	@Override
	public int addChoice(Choice c) {
		return fDao.addChoice(c);
	}

	@Override
	public int removeChoice(Choice c) {
		return fDao.removeChoice(c);
	}

	@Override
	public List<Choice> choice4(int userNo) {
		return fDao.choice4(userNo);
	}

	@Override
	public List<Feed> likeCount(int feedNo) {
		return fDao.likeCount(feedNo);
	}

	@Override
	public List<Choice> checkChoice(Choice c) {
		return fDao.checkChoice(c);
	}

	@Override
	public List<Friend> friend4(int userNo) {
		return fDao.friend4(userNo);
	}

	@Override
	public int unFollow(Map<String, Integer> map) {
		return fDao.unFollow(map);
	}

	@Override
	public int addFollow(Map<String, Integer> map) {
		return fDao.addFollow(map);
	}

	@Override
	public List<Friend> friend5(int userNo) {
		return fDao.friend5(userNo);
	}

	@Override
	public List<Choice> choiceFilter() {
		return fDao.choiceFilter();
	}

	@Override
	public List<Friend> friendList(int userNo) {
		return fDao.friendList(userNo);
	}
}
