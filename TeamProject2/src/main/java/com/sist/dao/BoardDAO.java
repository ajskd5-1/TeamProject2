package com.sist.dao;
import com.sist.mapper.*;
import com.sist.vo.BoardVO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	private BoardMapper mapper;
	
	public List<BoardVO> boardListData(Map map)
	{
		return mapper.boardListData(map);
	}
	
	public int boardTotalpage()
	{
		return mapper.boardTotalpage();
	}
	public List<BoardVO> boardFindData(Map map)
	{
		return mapper.boardFindData(map);
	}
	
	public void boardInsert(BoardVO vo)
	{
		mapper.boardInsert(vo);
	}
	public void boardInsert2(BoardVO vo)
	{
		mapper.boardInsert2(vo);
	}
	public BoardVO boardDetailData(int no)
	{
		mapper.hitIncrement(no);
		return mapper.boardDetailData(no);
	}
	public BoardVO boardUpdateData(int no)
	{
		return mapper.boardDetailData(no);
	}
	
	public void boardUpdate(BoardVO vo)
	{
		mapper.boardUpdate(vo);
	}
	
	public void boardDelete(int no)
	{
		mapper.boardDelete(no);
	}
}
