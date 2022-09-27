package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.service.*;
import com.sist.vo.*;

@RestController
public class MainRestController {
	@Autowired
	private MainService service;
	
	@GetMapping(value = "search/search_vue.do", produces = "text/plain;charset=UTF-8")
	public String search_vue(int page, String type, String ss) {
		String s = "";
		
		String result = "";
		int rowSize = 12;
		int start = (page*rowSize)-(rowSize-1);
		int end = rowSize*page;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("ss", ss);
		
		if(type.equals("location")) {
			map.put("table_name", "jeju_location_1_2");
			s = "관광지";
		} else if(type.equals("food")) {
			map.put("table_name", "jeju_food_1_2");
			s = "맛집";
		}
		List<LocationVO> list = service.search_search(map);
		
		int totalpage = service.search_totalpage(map);
		final int BLOCK = 10;
		int startPage = ((page-1)/BLOCK*BLOCK)+1;
		int endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage > totalpage) {
			endPage = totalpage;
		}
		
		JSONArray arr = new JSONArray();
		int k = 0;
		for(LocationVO vo : list) {
			JSONObject obj = new JSONObject();
			String title = vo.getTitle();
			if(title.length()>15) {
				title = title.substring(0, 15) + "...";
			}
			obj.put("t", title);
			obj.put("no", vo.getNo());
			obj.put("title", vo.getTitle());
			obj.put("poster", vo.getPoster());
			obj.put("addr", vo.getAddr());
			
			if(k == 0) {
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
				obj.put("ty", s);
			}
			arr.add(obj);
			k++;
		}
		
		result = arr.toJSONString();
		return result;
	}
	
}
