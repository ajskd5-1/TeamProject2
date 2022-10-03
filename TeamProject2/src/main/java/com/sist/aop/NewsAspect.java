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

@Component
@Aspect
public class NewsAspect {
	@Autowired
	private NewsManager mgr;
	
	@Before("execution(* com.sist.web.*Controller.*(..))")
	public void footer() {
		try {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			
			String json = mgr.newsFind("신상품");
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
			request.setAttribute("newList", nList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
