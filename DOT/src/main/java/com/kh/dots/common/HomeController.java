package com.kh.dots.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@GetMapping("/")
	public String home() {
		log.info("/home 요청!");
		return "forward:start.jsp";
	}
}
