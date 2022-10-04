package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.*;
import com.sist.vo.*;


@Controller
public class MainController {
	@Autowired
	private MainService service;
	
	@GetMapping("main/main.do")
	public String main_main(Model model) {
		List<LocationVO> list = service.main_location();
		List<FoodVO> flist = service.main_food();
		List<BoardVO> blist=service.boardTopData();
		model.addAttribute("list", list);
		model.addAttribute("flist", flist);
		model.addAttribute("blist", blist);
		return "main";
	}
	
	@GetMapping("main/main2.do")
	public String main_main2() {
		return "main2";
	}
	
	@RequestMapping("search/search.do")
	public String search_search(String type, String ss, Model model) {
		
		model.addAttribute("type", type);
		model.addAttribute("ss", ss);
		return "search/search";
	}
	
}
