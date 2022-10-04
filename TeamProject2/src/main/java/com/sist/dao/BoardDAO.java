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
	
	//공지사항
	public void boardNoticeInsert(BoardVO vo)
	{
	    mapper.boardNoticeInsert(vo);
	}
	
	public List<BoardVO> boardPrevData(int no)
	{
		return mapper.boardPrevData(no);
	}
	
	public List<BoardVO> boardNextData(int no)
	{
		return mapper.boardNextData(no);
	}
	
	public void recountdecrement(int no)
	{
		mapper.recountdecrement(no);
	}
	
	public void recountIncrement(int no)
	{
		mapper.recountIncrement(no);
	}
}
