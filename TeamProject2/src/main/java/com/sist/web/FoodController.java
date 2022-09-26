package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FoodController {
	@GetMapping("food/food_list.do")
	public String food_list()
	{
		return "food/food_list"; // Model
	}
	@GetMapping("food/food_detail.do")
	public String food_detail(int no,Model model)
	{
		model.addAttribute("no", no);
		return "food/food_detail";
	}
}
