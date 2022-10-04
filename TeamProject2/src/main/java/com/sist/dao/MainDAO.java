package com.sist.dao;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;

@Repository
public class MainDAO {
	@Autowired
	private MainMapper mapper;
	
//	@Select("SELECT title, poster, rownum FROM jeju_location_1_2 WHERE rownum>=6")
	public List<LocationVO> main_location() {
		return mapper.main_location();
	}
	public List<FoodVO> main_food(){
		return mapper.main_food();
	}
	
	// 검색
//	@Select("SELECT no, title, poster, num "
//			+ "FROM (SELECT no, title, poster, rownum as num "
//			+ "FROM (SELECT no, title, poster "
//			+ "FROM ${table_name} WHERE REGEXP_LIKE(title, #{ss}) ORDER BY no ASC)) "
//			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<LocationVO> search_search(Map map) {
		return mapper.search_search(map);
	}
//	@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name} "
//			+ "WHERE WHERE REGEXP_LIKE(title, #{ss})")
	public int search_totalpage(Map map) {
		return mapper.search_totalpage(map);
	}
//  게시판)public List<BoardVO> boardTopData();	
	public List<BoardVO> boardTopData(){
		return mapper.boardTopData();
	}
		
}
