package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.LocationVO;

public interface LocationMapper {  
	  @Select("SELECT no,poster,title,num "
			  +"FROM (SELECT no,poster,title,rownum as num "
			  +"FROM (SELECT no,poster,title "
			  +"FROM jeju_location_1_2 ORDER BY no ASC)) "
			  +"WHERE num BETWEEN #{start} AND #{end}")
	   public List<LocationVO> locationListData(Map map);
	   
	   @Select("SELECT CEIL(COUNT(*)/12.0) FROM jeju_location_1_2")
	   public int locationTotalPage(Map map);
	   
	   @Select("SELECT * FROM jeju_location_1_2 "
			  +"WHERE no=#{no}")
	   public LocationVO locationDetailData(Map map);
}
