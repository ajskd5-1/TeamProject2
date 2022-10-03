package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import java.util.*;
import com.sist.vo.*;

public interface CourseMapper {
	// 코스 저장
	@SelectKey(keyProperty = "no",  resultType = int.class, before = true, statement = "SELECT NVL(MAX(no)+1, 1) as no FROM course_1_2")
	@Insert("INSERT INTO course_1_2 VALUES(#{no}, #{rday}, #{place}, #{addr}, #{inwon}, SYSDATE, #{id})")
	public void courseInsertData(CourseVO vo);
	
	// 마이페이지
	// 코스 리스트
	@Select("SELECT DISTINCT(rday) as rday FROM course_1_2 WHERE id=#{id} ORDER BY rday DESC")
	public List<CourseVO> courseListData(String id);
	// 코스 상세 리스트
	@Select("SELECT no, rday, place, addr, inwon, regdate "
			+ "FROM course_1_2 WHERE id=#{id} AND rday=#{rday} ORDER BY no DESC")
	public List<CourseVO> courseDetailData(CourseVO vo);
	// 코스 삭제
	@Delete("DELETE FROM course_1_2 WHERE no=#{no}")
	public void courseDeleteData(int no);
	
	
}
