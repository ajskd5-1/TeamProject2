package com.sist.service;

import java.util.List;

import com.sist.vo.CourseVO;

public interface CourseService {
	public void courseInsertData(CourseVO vo);
	public List<CourseVO> courseListData(String id);
	public List<CourseVO> courseDetailData(CourseVO vo);
	public void courseDeleteData(int no);
}
