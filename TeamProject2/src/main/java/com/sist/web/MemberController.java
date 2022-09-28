package com.sist.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	   
	   //회원가입
	   @GetMapping("member/join.do")
	   public String member_join(Model model)
	   {
		   model.addAttribute("main_jsp", "../member/join.jsp");
		   return "member/join";
	   }
	   /*
	    *   private String id;
			private String pwd;
			private String name;
			private String sex;
			private String birthday;
			private String email;
			private String tel;
			private String role;
	    */
	   @PostMapping("member/join_ok.do")
	   public String member_join_ok(MemberVO vo)
	   {  
		   String en=encoder.encode(vo.getPwd());// <암호화  과정>
		   vo.setPwd(en);
		   dao.memberJoinInsert(vo);
		   return "redirect:../main/main.do";
	   }
	   
	   //아이디 체크
	   @PostMapping("member/idcheck.do")
	   @ResponseBody
	   public String member_idcheck(String id)
	   {
		   
		   String result="";
		   int count=dao.memberIdCheck(id);
		   if(count==0)
		   {
			   result="YES";
		   }
		   else
		   {
			   result="NO";
		   }
		   return result;	   
		}
	   
	   //이메일 체크
	   @PostMapping("member/emailcheck.do")
	   @ResponseBody
	   public String member_emailcheck(String email)
	   {
		   
		   String result="";
		   int count=dao.memberEmailCheck(email);
		   if(count==0)
		   {
			   result="YES";
		   }
		   else
		   {
			   result="NO";
		   }
		   return result;	   
		}
	   
	 //전화번호 체크
	   @PostMapping("member/telcheck.do")
	   @ResponseBody
	   public String member_telcheck(String tel)
	   {
		   
		   String result="";
		   int count=dao.memberTelCheck(tel);
		   if(count==0)
		   {
			   result="YES";
		   }
		   else
		   {
			   result="NO";
		   }
		   return result;	   
		}
	   
	   @GetMapping("member/login.do")
	   public String seoul_login()
	   {
		   return "member/login";
	   }
	   @GetMapping("member/logout.do")
	   public String member_logout(HttpSession session)
	   {
		   session.invalidate();
		   return "redirect:../main/main.do";
	   }
	   
	   //아이디 찾기
	   @GetMapping("member/idfind.do")
	   public String idfind(Model model)
	   {
		   model.addAttribute("main_jsp", "../member/idfind.jsp");
		   return "member/idfind";
	   }
	   @GetMapping("member/telfind_ok.do")
	   @ResponseBody
	   public String telfind_ok(Model model)
	   {
		   model.addAttribute("main_jsp", "../member/telfind_ok.jsp");
		   return "member/telfind_ok";
	   }
		   
	  //회원정보 수정
	   @GetMapping("member/join_before.do")
	   public String member_before(Model model)
	   {
	        model.addAttribute("main_jsp", "../member/join_before.jsp");
	        return "member/join_before";
	   }
	   @GetMapping("member/join_before_ok.do")
	   @ResponseBody
	   public String member_before_ok(String pwd,HttpSession session)
	   {
		   String id=(String)session.getAttribute("id");
		   String result="";
		   String db_pwd=dao.memberGetPassword(id);
		   if(encoder.matches(pwd, db_pwd))
		   {
			   result="yes";
		   }
		   else
		   {
			   result="no";
		   }
		   return result;
	   }
	   @GetMapping("member/join_update.do")
	   public String join_update(Model model,HttpSession session)
	   {
		   String id=(String)session.getAttribute("id");
		   MemberVO vo=dao.memberUpdateData(id);
		   model.addAttribute("vo", vo);
		   model.addAttribute("main_jsp", "../member/join_update.jsp");
		   return "member/join_update";
	   }
	   @PostMapping("member/join_update_ok.do")
	   public String join_update_ok(MemberVO vo,HttpSession session)
	   {
		
		   
		   //DB연동 
		   dao.memberUpdate(vo);
		   session.setAttribute("name", vo.getName());
		   return "redirect:../main/main.do";
	   }
	   
	   /*
	 //회원정보 탈퇴
	   @GetMapping("member/join_delete.do")
	   public String member_delete(Model model)
	   {
	        model.addAttribute("main_jsp", "../member/join_delete.jsp");
	        return "member/join_delete";
	   }
	   @GetMapping("member/join_delete_ok.do")
	   @ResponseBody
	   public String join_delete_ok(String pwd,HttpSession session)
	   {
		   String id=(String)session.getAttribute("id");
		   String result="";
		   String db_pwd=dao.memberGetPassword(id);
		   if(encoder.matches(pwd, db_pwd))
		   {
			   result="yes";
		   }
		   else
		   {
			   result="no";
		   }
		   return result;
	   }
	   @GetMapping("member/join_delete_check.do")
	   public String join_delete_check(MemberVO vo,Model model,HttpSession session)
	   {
		   String id=(String)session.getAttribute("id");
		   dao.memberDelete(vo);
		   model.addAttribute("main_jsp", "../member/join_delete_check.jsp");
		   return "member/join_delete_check";
	   }
	   @PostMapping("member/join_delete_check_ok.do")
	   public String join_delete_check_ok(MemberVO vo,HttpSession session)
	   {
		
		   
		   //DB연동 
		   dao.memberDelete(vo);
		   session.setAttribute("name", vo.getName());
		   return "redirect:../main/main.do";
		   
	   }
	   */
	   
	   
	   
	   
	  
	
}
