package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.CourseDAO;
import com.sist.vo.CourseVO;

@Service
public class CourseServiceImpl implements CourseService{
	@Autowired
	private CourseDAO dao;
	
	@Override
	public void courseInsertData(CourseVO vo) {
		dao.courseInsertData(vo);
	}

	@Override
	public List<CourseVO> courseListData(String id) {
		return dao.courseListData(id);
	}

	@Override
	public List<CourseVO> courseDetailData(CourseVO vo) {
		return dao.courseDetailData(vo);
	}

	@Override
	public void courseDeleteData(int no) {
		dao.courseDeleteData(no);
	}
	
}
