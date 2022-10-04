package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.LocationMapper;
import com.sist.vo.LocationVO;

@Repository
public class LocationDAO {
	 @Autowired
	 private LocationMapper mapper;
	 
	 /*@Select("SELECT no,title,poster,num "
			 +"FROM (SELECT no,title,poster,rownum as num "
			 +"FROM (SELECT no,title,poster "
			 +"FROM ${jeju_location_1_2} ORDER BY no ASC)) "
			 +"WHERE num BETWEEN #{start} AND #{end}")*/
	 public List<LocationVO> LocationListData(Map map)
	 {
		 return mapper.locationListData(map);
	 }
	 /*
	 @Select("SELECT CEIL(COUNT(*)/12.0) FROM ${jeju_location_1_2}")*/
	 public int LocationTotalPage(Map map)
	 {
		 return mapper.locationTotalPage(map);
	 }
	 
	 /*@Select("SELECT * FROM ${jeju_location_1_2} "
			 +"WHERE no=#{no}")*/
	 public LocationVO LocationDetailData(int no)
	 {
		 mapper.locationHitIncrement(no);
		 return mapper.locationDetailData(no);
	 }
}