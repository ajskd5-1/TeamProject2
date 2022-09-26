package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@RestController
public class BoardRestController {
	@Autowired
	private BoardDAO dao;
	@GetMapping(value = "board/list_vue.do",produces = "text/plain;charset=utf-8")
	public String board_list_vue(String page)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list=dao.boardListData(map);
		int totalpage=dao.boardTotalpage();
		// list로 데이터 전송
		String result="";
		try
		{
			JSONArray arr=new JSONArray();
			int k=0;
			for(BoardVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("subject", vo.getSubject());
				obj.put("name", vo.getName());
				obj.put("dbday", vo.getDbday());
				obj.put("hit", vo.getHit());
				obj.put("recount", vo.getRecount());
				obj.put("jeadmin", vo.getJeadmin());
				// 첫 페이지 설정
				if(k==0)
				{
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;
			}
			result=arr.toJSONString();
		}catch(Exception ex) {}
		return result;
	}
   
}
