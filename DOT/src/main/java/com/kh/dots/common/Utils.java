package com.kh.dots.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Utils {
	
	
	// 변경된 이름을 돌려주면서, 원본파일을 변경된 파일이름으로 서버에 저장시키는 메소드
	public static String saveFile(MultipartFile upfile, String savePath) {
		
		String originName = upfile.getOriginalFilename();// flower.jpg
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());//20230807122350
		int random = (int) (Math.random() * 90000 +10000);// 5자리 랜덤정수값
		String ext ="";
		if(!originName.equals("") && originName != null) {
			ext = originName.substring(originName.lastIndexOf("."));
		}
		
		String changeName = currentTime+random+ext;
		
		try {
			log.info("savePath={}",savePath);
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			//e.printStackTrace();
			log.error("게시글 등록 오류 = {}", e.getMessage());			
		} catch (IOException e) {
			log.error("게시글 등록 오류 = {}", e.getMessage());
		}
		
		
		return changeName;
	}
	
	//크로스 사이트 스크립트 공격을 방지하기 위한 메소드
	public static String XSSHandling(String content) {
		if(content != null) {
			content = content.replaceAll("&" , "&amp;");
			content = content.replaceAll("<" , "&lt;");
			content = content.replaceAll(">" , "&gt;");
			content = content.replaceAll("\"", "&quot;");
		}
		return content;
	}
	
	// 개행문자 처리
	public static String newLineHandling(String content) {
		return content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	}
	
	// 개행문자 해제
	public static String newLineClear(String content) {
		return content.replaceAll("<br>","\n");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
