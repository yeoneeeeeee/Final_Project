package com.kh.dots.common.model;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {
	
	// 미완성된 rename함수 오버라이딩하기
	// 기존의 파일으 매개변수로 전달받아서 수정작업을한 후 해당 파일을 반환해주는 메소드
	@Override
	public File rename(File originFile) {
		
		// 원본파일명("aaa.jpg")
		String originName = originFile.getName();
		
		// 수정파일명 : 파일업로드된시간(연월일시분초) + 5자리 랜덤값
		// 확장자	  : 원본파일 확장자 그대로
		
		// 원본명	   =>   수정명
		// aaa.jpg => 20230703123811234.jpg
		
		// 1. 파일 업로드된시간 => String currentTime;
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값 => int ran;
		// 10000 - 99999
		int ran = (int)(Math.random() * 90000)+10000;
		
		// 3. 원본파일의 확장자 (String ext)
		// 원본파일명에서 가장 마지막위치의 .의 인덱스를 기준으로 확장자 구하기 (ㅍ파일명 중간에 .이 들어가는 케이스도 있기때문)
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ran + ext;
		
		// 원본파일을 수정된 파일명으로 적용시켜서 파일객체 반환.
		
		return new File(originFile.getParent(),changeName);
	}
}
