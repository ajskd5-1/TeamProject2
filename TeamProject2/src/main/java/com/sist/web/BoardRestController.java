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
import com.sist.service.BoardService;
@RestController
public class BoardRestController {
	@Autowired
	private  BoardService service;
	@GetMapping(value = "board/list_vue.do",produces = "text/plain;charset=utf-8")
	public String board_list_vue(String page)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list=service.boardListData(map);
		int totalpage=service.boardTotalpage();
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
	@GetMapping(value="board/update_vue.do",produces = "text/plain;charset=utf-8")
	public String board_update_vue(int no)
	{
		String result="";
		BoardVO vo=service.boardUpdateData(no);
		JSONObject obj=new JSONObject();
		obj.put("no", vo.getNo());
		obj.put("subject", vo.getSubject());
		obj.put("content", vo.getContent());
		result=obj.toJSONString();
		return result;
	}
	
	@GetMapping(value = "board/update_vue_ok.do",produces = "text/plain;charset=utf-8")
	public void board_update_vue_ok(BoardVO vo)
	{
		service.boardUpdate(vo);
		
	}
}
