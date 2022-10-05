package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.DetailReplyDAO;
import com.sist.vo.DetailReplyVO;

@Controller
public class DetailReplyController {
	@Autowired
	private DetailReplyDAO dao;
	
	@PostMapping("reply/insert.do")
    public String reply_insert(DetailReplyVO vo,HttpSession session,RedirectAttributes ra)
    {
    	String id=(String)session.getAttribute("id");
    	String name=(String)session.getAttribute("name");
    	
    	vo.setId(id);
    	vo.setName(name);
    	
    	dao.DetailreplyInsert(vo);
    	
    	ra.addAttribute("no", vo.getPno());
    	return "redirect:../location/location_detail.do";
    }

   @GetMapping("reply/delete.do")
    public String reply_delete(int no,int pno)
     {
        try{
        	System.out.println(no);
        	dao.DetailreplyDelete(no);
        	System.out.println(pno);
        }catch(Exception ex)
        {
        	ex.printStackTrace();
        }
    	//dao.DetailreplyDelete(no);
    	//System.out.println(pno);
    	return "redirect:../location/location_detail.do?no="+pno;
    }
    
    
    @PostMapping("reply/update.do")
    public String reply_update(DetailReplyVO vo,RedirectAttributes ra)
    {
    	dao.DetailreplyUpdate(vo);
    	ra.addAttribute("no", vo.getPno());
    	return "redirect:../location/location_detail.do";
    }
}