package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import java.util.*;
import com.sist.vo.*;

public interface MainMapper {
	// 메인 추천
	@Select("SELECT no, title, poster, rownum FROM jeju_location_1_2 WHERE rownum<=6")
	public List<LocationVO> main_location();
	
	// 검색
	@Select("SELECT no, title, poster, num "
			+ "FROM (SELECT no, title, poster, rownum as num "
			+ "FROM (SELECT no, title, poster "
			+ "FROM ${table_name} WHERE REGEXP_LIKE(title, #{ss}) ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<LocationVO> search_search(Map map);
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name} "
			+ "WHERE REGEXP_LIKE(title, #{ss})")
	public int search_totalpage(Map map);
}
