package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;


@RestController
public class MemberRestController {
	 @Autowired
	    private MemberDAO mDao;
	    
	    @Autowired
	    private BCryptPasswordEncoder encoder; 
	    
	  
	    @GetMapping(value="member/login_vue.do",produces = "text/plain;charset=utf-8")
	    public String member_login_ok(String id,String pwd,boolean ck,HttpSession session,HttpServletResponse response)
	    {
	 	   String result="";
	 	   System.out.println(ck);
	 	   int count=mDao.memberIdCheck(id);
	 	   if(count==0)
	 	   {
	 		   result="NOID";
	 	   }
	 	   else
	 	   {
	 		   MemberVO vo=mDao.memberJoinInfoData(id);
	 		   if(encoder.matches(pwd, vo.getPwd()))// 암호된 비밀번호 / 일반 비밀번호 비교 
	 		   {
	 			   session.setAttribute("id", id);
	 			   session.setAttribute("name", vo.getName());
	 			   session.setAttribute("role", vo.getRole());
	 			   if(ck==true)
	 			   {
	 				   Cookie cookie=new Cookie("id", id);
	 				   cookie.setPath("/");
	 				   cookie.setMaxAge(60*60*24);
	 				   response.addCookie(cookie);
	 				   ////////////////////////////////
	 				   cookie=new Cookie("name", vo.getName());
	 				   cookie.setPath("/");
	 				   cookie.setMaxAge(60*60*24);
	 				   response.addCookie(cookie);
	 				   ///////////////////////////////
	 				   cookie=new Cookie("role", vo.getRole());
	 				   cookie.setPath("/");
	 				   cookie.setMaxAge(60*60*24);
	 				   response.addCookie(cookie);
	 			   }
	 			   result="OK";
	 		   }
	 		   else
	 		   {
	 			   result="NOPWD";
	 		   }
	 	   }
	 	   return result;
	    }

}
