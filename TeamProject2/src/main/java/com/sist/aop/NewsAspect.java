package com.sist.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.sist.manager.*;
import java.util.*;
import com.sist.vo.*;
import javax.servlet.http.HttpServletRequest;
import com.sist.dao.*;

@Component
@Aspect
public class NewsAspect {
	@Autowired
	private NewsManager mgr;
	
	@Autowired
	private MainDAO dao;
	
	@Before("execution(* com.sist.web.*Controller.*(..))")
	public void footer() {
		try {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			
			String json = mgr.newsFind("제주도");
			JSONParser jp = new JSONParser();
			JSONObject obj = (JSONObject)jp.parse(json);
			JSONArray arr = (JSONArray)obj.get("items");
			List<NewsVO> nList = new ArrayList<NewsVO>(); 
			for(int i=0; i<5; i++) {
				NewsVO vo = new NewsVO();
				JSONObject o = (JSONObject)arr.get(i);
				vo.setTitle((String)o.get("title"));
				vo.setLink((String)o.get("link"));
				nList.add(vo);
			}
			List<LocationVO> lList = dao.main_location();
			for(LocationVO vo : lList) {
				if(vo.getTitle().length() > 3) {
					vo.setTitle(vo.getTitle().substring(0, 3) + "...");
				}
			}
			
			List<FoodVO> fList = dao.main_food();
			for(FoodVO fvo : fList) {
				if(fvo.getTitle().length() > 3) {
					fvo.setTitle(fvo.getTitle().substring(0, 3) + "...");
				}
			}
			
			request.setAttribute("locationList", lList);
			request.setAttribute("foodList", fList);
			request.setAttribute("newList", nList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
