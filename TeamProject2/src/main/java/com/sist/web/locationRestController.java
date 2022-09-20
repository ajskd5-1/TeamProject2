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

import com.sist.dao.LocationDAO;
import com.sist.vo.LocationVO;

@RestController
public class locationRestController {
	@Autowired
	private LocationDAO Dao; 
	
	@GetMapping(value="location/location_list.do",produces = "text/plain;charset=utf-8")
    public String location_list(String page,Model model)
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
 	   
 	   
 	   List<LocationVO> list=Dao.LocationListData(map);
 	   int totalpage=Dao.LocationTotalPage(map);
 	   String result="";
 	   JSONArray arr=new JSONArray();
 	   int k=0;
 	   for(LocationVO vo:list)
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

}
