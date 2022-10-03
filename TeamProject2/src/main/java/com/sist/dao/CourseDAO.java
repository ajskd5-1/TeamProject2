package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class CourseDAO {
	@Autowired
	private CourseMapper mapper;
	
	public void courseInsertData(CourseVO vo) {
		mapper.courseInsertData(vo);
	}
	public List<CourseVO> courseListData(String id){
		return mapper.courseListData(id);
	}
	public List<CourseVO> courseDetailData(CourseVO vo){
		return mapper.courseDetailData(vo);
	}
	public void courseDeleteData(int no) {
		mapper.courseDeleteData(no);
	}
}
