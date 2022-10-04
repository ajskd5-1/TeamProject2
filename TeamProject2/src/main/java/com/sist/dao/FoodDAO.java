package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.FoodMapper;
import com.sist.vo.FoodVO;

@Repository
public class FoodDAO {
	@Autowired
	private FoodMapper mapper;
	
	 public List<FoodVO> foodListData(Map map)
	 {
		 return mapper.foodListData(map);
	 }
	 public int foodTotalPage(Map map)
	 { 
		 return mapper.foodTotalPage(map);
	 }
	 public FoodVO foodDetailData(int no)
	 {
		 mapper.foodHitIncrement(no);
		 return mapper.foodDetailData(no);
	 }
	
}

