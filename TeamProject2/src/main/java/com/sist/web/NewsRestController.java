package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.manager.*;
import com.sist.vo.*;
import java.util.*;

@RestController
public class NewsRestController {
	@Autowired
	private NewsManager mgr;
	
	@GetMapping(value = "news/news_vue.do", produces = "text/plain;charset=UTF-8")
	public String news_news_vue(String ss) {
		String result = "";
		String json = mgr.newsFind(ss);
		try {
			JSONParser jp = new JSONParser();
			JSONObject root = (JSONObject)jp.parse(json);
			JSONArray arr = (JSONArray)root.get("items");
			List<NewsVO> list = new ArrayList<NewsVO>();
			
			JSONArray arr2 = new JSONArray();
			for(int i=0; i<arr.size(); i++) {
				JSONObject obj = (JSONObject)arr.get(i); // items에 값 = {} (title, link, description, ...)
				JSONObject obj2 = new JSONObject();
				obj2.put("title", (String)obj.get("title"));
				obj2.put("link", (String)obj.get("link"));
				obj2.put("description", (String)obj.get("description"));
				arr2.add(obj2);
			}
			result = arr2.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}