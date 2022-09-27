package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.service.*;
import com.sist.vo.*;

@Controller
public class CourseController {
	@Autowired
	private CourseService service;
	
	@RequestMapping("course/course.do")
	public String course_course(String type, String ss, Model model) {
		if(type == null) {
			type = "location";
		}
		if(ss == null) {
			ss = "";
		}
		model.addAttribute("type", type);
		model.addAttribute("ss", ss);
		return "course/course"; // Model
	}

	@GetMapping("course/course_ok.do")
	public String course_course_ok(CourseVO vo, HttpSession session) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		service.courseInsertData(vo);
		return "course/course";
	}
}
