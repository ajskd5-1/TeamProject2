package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.FoodVO;

public interface FoodMapper {
	  @Select("SELECT no,poster,title,num "
			  +"FROM (SELECT no,poster,title,rownum as num "
			  +"FROM (SELECT no,poster,title "
			  +"FROM jeju_food_1_2 ORDER BY no ASC)) "
			  +"WHERE num BETWEEN #{start} AND #{end}")
	   public List<FoodVO> foodListData(Map map);
	   
	   @Select("SELECT CEIL(COUNT(*)/12.0) FROM jeju_food_1_2")
	   public int foodTotalPage(Map map);
	   
	   @Select("SELECT * FROM jeju_food_1_2 "
			+"WHERE no=#{no}") 
	   public FoodVO foodDetailData(int no);
}

