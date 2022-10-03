package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

@Controller
public class FoodController {
	@Autowired 
    private FoodDAO dao;
	
	@GetMapping("food/food_list.do")
	public String food_list()
	{
		return "food/food_list"; // Model
	}
}