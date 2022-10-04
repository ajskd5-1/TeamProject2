package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.mapper.BoardMapper;
import com.sist.vo.BoardVO;

public interface BoardService {
	
	public List<BoardVO> boardListData(Map map);
	public int boardTotalpage();
	public List<BoardVO> boardFindData(Map map);
	public void boardInsert(BoardVO vo);
	public void boardInsert2(BoardVO vo);
	public BoardVO boardDetailData(int no);
	public BoardVO boardUpdateData(int no);
	public void boardUpdate(BoardVO vo);
	public void boardDelete(int no);
	public void boardNoticeInsert(BoardVO vo);
	public List<BoardVO> boardPrevData(int no);
	public List<BoardVO> boardNextData(int no);
	public void recountIncrement(int no);
	public void recountdecrement(int no);
	
}
