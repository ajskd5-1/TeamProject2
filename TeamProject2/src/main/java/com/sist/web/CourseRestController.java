package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class CourseRestController {
	@Autowired
	private CourseService service;
	
	@GetMapping(value = "mypage/my_course_vue.do", produces = "text/plain;charset=UTF-8")
	public String mypage_my_course_vue(HttpSession session) {
		String result = "";
		String id = (String)session.getAttribute("id");
		List<CourseVO> list = service.courseListData(id);
		System.out.println(list.size());
		JSONArray arr = new JSONArray();
		for(CourseVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("rday", vo.getRday());
			arr.add(obj);
		}
		result = arr.toJSONString();
		
		return result;
	}
	
	@GetMapping(value = "mypage/my_course_detail.do", produces = "text/plain;charset=UTF-8")
	public String mypage_my_course_detail(String rday, HttpSession session) {
		String result = "";
		String id = (String)session.getAttribute("id");
		CourseVO vo = new CourseVO();
		vo.setId(id);
		vo.setRday(rday);
		
		List<CourseVO> list = service.courseDetailData(vo);
		JSONArray arr = new JSONArray();
		for(CourseVO cvo : list) {
			JSONObject obj = new JSONObject();
			obj.put("no", cvo.getNo());
			obj.put("rday", cvo.getRday());
			obj.put("place", cvo.getPlace());
			obj.put("addr", cvo.getAddr());
			obj.put("inwon", cvo.getInwon());
			obj.put("regdate", cvo.getRegdate());
			arr.add(obj);
		}
		result = arr.toJSONString();
		
		return result;
	}
}
