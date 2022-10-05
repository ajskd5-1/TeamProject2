package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.listener.adapter.ReplyFailureException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.DetailReplyDAO;
import com.sist.dao.LocationDAO;
import com.sist.vo.DetailReplyVO;
import com.sist.vo.LocationVO;

@Controller
public class LocationController {
	@Autowired
	private LocationDAO dao;
	
	@Autowired
	private DetailReplyDAO rdao;
	
	@GetMapping("location/location_list.do")
	public String location_list(String page,Model model,HttpServletRequest request) // 쿠키 읽기 목적 request
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
		List<LocationVO> list=dao.LocationListData(map);
		for(LocationVO vo:list)
		{
			String name=vo.getTitle();
			if(name.length()>25)
			{
				name=name.substring(0,25)+"..."; 
				vo.setTitle(name);
			}
			vo.setTitle(name);
		}
		int totalpage=dao.LocationTotalPage(map);
		
		// cookie
		Cookie[] cookies=request.getCookies();
		List<LocationVO> cList=new ArrayList<LocationVO>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--) // 최신꺼부터 올리려고 뒤에서부터 --
			{
				if(cookies[i].getName().startsWith("location"))
				{
					cookies[i].setPath("/");
					String no=cookies[i].getValue();
					// no에 해당되는 데이터를 읽어온다
					LocationVO vo=dao.LocationDetailData(Integer.parseInt(no));
					cList.add(vo);
				}
			}
		}
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		model.addAttribute("cList", cList); // 쿠키가 담긴 데이터
		model.addAttribute("size", cList.size());
		return "location/location_list";
	}
	// 쿠키 저장 => 항상 before를 거쳐서 들어온다
	@GetMapping("location/detail_before.do")
	public String location_detail_before(int no, HttpServletResponse response) // 쿠키 전송 목적 response
	{
		Cookie cookie=new Cookie("location"+no, String.valueOf(no)); // 단점 (클라이언트 브라우저에 저장) 문자열만 저장이 가능
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "redirect:location_detail.do?no="+no+"&type=1";
	}
   //상세보기 요청 
   @GetMapping("location/location_detail.do")
   public String location_detail(int no,String type,Model model)
   {
	   if(type==null)
		   type="1";
	   LocationVO vo=dao.LocationDetailData(no);
	   model.addAttribute("vo", vo);
	   
	   DetailReplyVO rvo=new DetailReplyVO();
	   rvo.setPno(no);
	   rvo.setType(Integer.parseInt(type));
	   List<DetailReplyVO> list=rdao.breplyListData(rvo);
	   model.addAttribute("list",list);
	   model.addAttribute("no", no);
	   return "location/location_detail";
   }
   
   @GetMapping("location/cookie_delete.do")
   public String location_cookie_delete(int no,HttpServletRequest request,HttpServletResponse response)
   {
	   Cookie[] cookies=request.getCookies();
	   for(int i=cookies.length-1;i>=0;i--)
	   {
		   if(cookies[i].getName().equals("location"+no))
		   {
			   cookies[i].setPath("/");
			   cookies[i].setMaxAge(0);
			   response.addCookie(cookies[i]);
			   break;
		   }
	   }
	   return "redirect:location_list.do";
   }
   
   @GetMapping("location/cookie_all_delete.do")
   public String location_cookie_all_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   Cookie[] cookies=request.getCookies();
	   for(int i=cookies.length-1;i>=0;i--)
	   {
		   if(cookies[i].getName().startsWith("location"))
		   {
			   cookies[i].setPath("/");
			   cookies[i].setMaxAge(0);
			   response.addCookie(cookies[i]); 
		   }
	   }
	   return "redirect:location_list.do";
   }
   
}
