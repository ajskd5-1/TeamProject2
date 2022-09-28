package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.FoodDAO;
import com.sist.service.FoodService;
import com.sist.vo.FoodVO;

@RestController
public class FoodRestController {
	@Autowired
    private FoodService service;
	
	@Autowired
	private FoodDAO Dao; 
	
	@GetMapping(value="food/food_list.do",produces = "text/plain;charset=utf-8")
    public String food_list(String page,Model model)
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
 	   
 	   
 	   List<FoodVO> list=Dao.foodListData(map);
 	   int totalpage=Dao.foodTotalPage(map);
 	   String result="";
 	   JSONArray arr=new JSONArray();
 	   int k=0;
 	   for(FoodVO vo:list)
 	   {
 		   JSONObject obj=new JSONObject();
 		   obj.put("no", vo.getNo());
 		   obj.put("title", vo.getTitle());
 		   obj.put("poster", vo.getPoster());
 		   
 		   if(k==0)
 		   {
 			   obj.put("curpage", curpage);
 	 		   obj.put("totalpage", totalpage);
 		   }
 		   
 		   arr.add(obj);
 		   k++;
 	   }
 	   result=arr.toJSONString();
 	   return result;
    }
	
	@GetMapping(value="food/food_detail.do",produces = "text/plain;charset=utf-8")
    public String food_detail(int no)
    {
		String result="";
    	try
    	{
    		FoodVO vo=service.FoodDetailData(no);
    		JSONObject obj=new JSONObject();
    		obj.put("no", vo.getNo()); 
    		obj.put("title", vo.getTitle());
    		obj.put("poster", vo.getPoster());
    		obj.put("addr", vo.getAddr());
    		obj.put("tel", vo.getTel());
    		obj.put("type", vo.getType());
    		obj.put("time", vo.getTime());
    		obj.put("parking", vo.getParking());
    		obj.put("menu", vo.getMenu());
    		obj.put("score", vo.getScore());
    		
    		result=obj.toJSONString();
    		System.out.println(result);
    		
    	}catch(Exception ex) {}
    	return result;
    }

}