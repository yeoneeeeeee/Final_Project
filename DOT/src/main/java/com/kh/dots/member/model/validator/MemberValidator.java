package com.kh.dots.member.model.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.member.model.vo.Member;

@Component
public class MemberValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.equals(clazz); // 검사하고자하는 객체가 Member타입일대만 유효성 검사지원 
	}
	/* 
	 * 필드별로 유효성 검사 실시
	 * 부적합한 값이 있을경우, Errors객체에 해다 오류사실을 추가.
	 * */
	
	@Override
	public void validate(Object target , Errors errors) {
		
		Member m = (Member) target;
		
		// 1. 아이디 검사
		String userId = m.getUserId();
		if(userId == null || userId.isEmpty()) {
			errors.rejectValue("userId","error-name","아이디값 누락");
		}
		
		// 2. 비밀번호 검사
		String userPwd = m.getUserPwd();
		if(userPwd == null || userPwd.isEmpty()) {
			errors.rejectValue("userPwd", "error-name","비밀번호 누락");
		}
		
		// 3. 이름 검사
		String userName = m.getUserName();
		if(userName == null || userName.isEmpty()) {
			errors.rejectValue("userName", "error-name","이름 누락");
		}
	}
	
	
	
	
	
	
	
	
	
	

}
