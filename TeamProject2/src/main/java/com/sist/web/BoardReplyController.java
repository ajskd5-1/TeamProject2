package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.service.BoardService;
@Controller
public class BoardReplyController {
	@Autowired
	private BoardReplyDAO dao;
	
	@Autowired
	private BoardService service;
	
	@PostMapping("breply/insert.do")
	public String breply_insert(BoardReplyVO vo,HttpSession session,RedirectAttributes ra)
	{
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		vo.setId(id);
		vo.setName(name);
		dao.breplyInsert(vo);
		service.recountIncrement(vo.getCno());
		ra.addAttribute("no",vo.getCno());
		return "redirect:../board/detail.do?no="+vo.getCno();
	}
	
	@GetMapping("breply/delete.do")
	public String breply_insert(BoardReplyVO vo)
	{
		dao.breplyDelete(vo.getNo());
		service.recountdecrement(vo.getCno());
		return "redirect:../board/detail.do?no="+vo.getCno();
	}
	
	@PostMapping("breply/update.do")
	public String breply_update(BoardReplyVO vo)
	{
		dao.breplyUpdate(vo);
		return "redirect:../board/detail.do?no="+vo.getCno();
	}
}
