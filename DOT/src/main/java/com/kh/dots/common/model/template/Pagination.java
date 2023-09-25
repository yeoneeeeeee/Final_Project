package com.kh.dots.common.model.template;

import com.kh.dots.common.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int listCount,int currentPage,int pageLimit,int boardLimit) {
		
		int maxPage =(int)(Math.ceil(((double)listCount/boardLimit)));
		int startPage = (currentPage-1) / pageLimit * pageLimit+1; 
		int endPage = startPage+pageLimit-1; 
		
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		PageInfo pageinfo = new PageInfo();
		
		pageinfo.setBoardLimit(boardLimit);
		pageinfo.setCurrentPage(currentPage);
		pageinfo.setEndPage(endPage);
		pageinfo.setListCount(listCount);
		pageinfo.setMaxPage(maxPage);
		pageinfo.setPageLimit(pageLimit);
		pageinfo.setStartPage(startPage);
		
		
		return pageinfo;
		
		
	}
	
}
