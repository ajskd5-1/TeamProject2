package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	@GetMapping("mypage/home.do")
	public String mypage_home() {
		return "mypage/home";
	}
	
	@GetMapping("mypage/my_course.do")
	public String mypage_course() {
		return "mypage/my_course";
	}
}
