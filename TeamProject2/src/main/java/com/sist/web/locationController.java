package com.sist.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class locationController {     
	@GetMapping("location/location_list.do")
	public String location_list()
	{
		return "location/location_list"; // Model
	}
	@GetMapping("location/location_detail.do")
	public String location_detail(int no,Model model)
	{
		model.addAttribute("no", no);
		return "location/location_detail";
	}
}
