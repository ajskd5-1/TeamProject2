package com.sist.web;




import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.binding.MapperProxy;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.taglibs.standard.tag.common.core.RemoveTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.mapper.MemberMapper;
import com.sist.service.EmailService;
import com.sist.vo.*;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Inject
    EmailService emailService;


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
		   
		   EmailVO evo = new EmailVO();
		   evo.setSenderName("제주IN");
		   evo.setSenderMail("sistteam1@gmail.com");
		   evo.setReceiveMail(vo.getEmail());
		   evo.setSubject("제주IN 회원가입");
		   evo.setMessage("안녕하세요 제주IN입니다. " + vo.getName() + "님의 회원가입을 축하드립니다!!");
		   emailService.sendMail(evo);
		   
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
	   //로그인
	   @GetMapping("member/login.do")
	   public String login()
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
	   public String idfind()
	   {
		   return "member/idfind";
	   }
	   @GetMapping("member/idfind_ok.do")
	   @ResponseBody
	   public String idfind_ok(String name,String tel,HttpSession session)
	   {
		   
		   String result="";
		   Map map = new HashedMap();
		   map.put("name", name);
		   map.put("tel", tel);
		   String id = dao.idfind(map);
		   System.out.println("id찾기");
		   System.out.println(id);
		   if(id != null) {
			   result = id;
			   
		   } else {
			   result = "NOID";
		   }
		   
		   return result;
	   }
	  
	  //회원정보 수정
	   @GetMapping("member/join_before.do")
	   public String member_before()
	   {
	      
	        return "mypage/join_before";
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
		   return "mypage/join_update";
	   }
	   @PostMapping("member/join_update_ok.do")
	   public String join_update_ok(MemberVO vo,HttpSession session)
	   {
		
		   System.out.println(vo.getId());
		   System.out.println(vo.getName());
		   
		   //DB연동 
		   dao.memberUpdate(vo);
		   session.setAttribute("name", vo.getName());
		   return "redirect:../main/main.do";
	   }
	   
	 
	 //회원정보 탈퇴
	   @GetMapping("member/memberDelete.do")
	   public String memberDelete()
	   {
	      
	        return "mypage/memberDelete";
	   }
	   @GetMapping("member/member_ok.do")
	   @ResponseBody
	   public String member_ok(String pwd,HttpSession session)
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
	   @GetMapping("member/Delete.do")
	   public void Delete(Model model,HttpSession session)
	   {
		   String id=(String)session.getAttribute("id");
	       
	       MemberVO vo = dao.memberEmail(id);
	       EmailVO evo = new EmailVO();
		   evo.setSenderName("제주IN");
		   evo.setSenderMail("sistteam1@gmail.com");
		   evo.setReceiveMail(vo.getEmail());
		   evo.setSubject("제주IN 회원탈퇴");
		   evo.setMessage("안녕하세요 제주IN입니다." + vo.getName() + "님의 탈퇴가 완료되었습니다!!");
		   emailService.sendMail(evo);
	       
		   dao.memberDelete(id);
	       session.invalidate();
	   }
	  
	
}
