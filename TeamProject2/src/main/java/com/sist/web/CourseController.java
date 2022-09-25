package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CourseController {
	@GetMapping("course/course.do")
	public String location_list()
	{
		return "course/course"; // Model
	}
}
