package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;

public interface MainMapper {
	// 메인 추천
	@Select("SELECT no, title, poster, addr, hit, num " + 
			"FROM (SELECT no, title, poster, addr, hit, rownum as num " + 
			"from (SELECT no, title, poster, addr, hit " + 
			"FROM jeju_location_1_2 ORDER BY hit DESC)) WHERE num <= 6")
	public List<LocationVO> main_location();
	@Select("SELECT no, title, poster, addr, hit, num " + 
			"FROM (SELECT no, title, poster, addr, hit, rownum as num " + 
			"from (SELECT no, title, poster, addr, hit " + 
			"FROM jeju_food_1_2 ORDER BY hit DESC)) WHERE num <= 6")
	public List<FoodVO> main_food();
	
	
	// 검색
	@Select("SELECT no, title, poster, addr, num "
			+ "FROM (SELECT no, title, poster, addr, rownum as num "
			+ "FROM (SELECT no, title, poster, addr "
			+ "FROM ${table_name} WHERE REGEXP_LIKE(title, #{ss}) ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<LocationVO> search_search(Map map);
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name} "
			+ "WHERE REGEXP_LIKE(title, #{ss})")
	public int search_totalpage(Map map);
	// 게시판 Top5
	@Select("SELECT no,subject,name,hit,rownum "
			+ "FROM (SELECT no,subject,name,hit,rownum "
			+ "FROM jeju_board_1_2 ORDER BY hit DESC) "
			+ "WHERE rownum BETWEEN 1 AND 5")
	public List<BoardVO> boardTopData();
}
