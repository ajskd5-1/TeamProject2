package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.BoardVO;
import com.sist.dao.BoardDAO;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	public BoardDAO dao;
	@Override
	public List<BoardVO> boardListData(Map map) {
		// TODO Auto-generated method stub
		return dao.boardListData(map);
	}

	@Override
	public int boardTotalpage() {
		// TODO Auto-generated method stub
		return dao.boardTotalpage();
	}

	@Override
	public List<BoardVO> boardFindData(Map map) {
		// TODO Auto-generated method stub
		return dao.boardFindData(map);
	}

	@Override
	public void boardInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.boardInsert(vo);
		
	}

	@Override
	public void boardInsert2(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.boardInsert2(vo);
	}

	@Override
	public BoardVO boardDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.boardDetailData(no);
	}

	@Override
	public BoardVO boardUpdateData(int no) {
		// TODO Auto-generated method stub
		return dao.boardUpdateData(no);
	}

	@Override
	public void boardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.boardUpdate(vo);
	}

	@Override
	public void boardDelete(int no) {
		// TODO Auto-generated method stub
		dao.boardDelete(no);
	}

	@Override
	public void boardNoticeInsert(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.boardNoticeInsert(vo);
	}

	@Override
	public List<BoardVO> boardPrevData(int no) {
		// TODO Auto-generated method stub
		return dao.boardPrevData(no);
	}

	@Override
	public List<BoardVO> boardNextData(int no) {
		// TODO Auto-generated method stub
		return dao.boardNextData(no);
	}

	@Override
	public void recountIncrement(int no) {
		// TODO Auto-generated method stub
		dao.recountIncrement(no);
	}

	@Override
	public void recountdecrement(int no) {
		// TODO Auto-generated method stub
		dao.recountdecrement(no);
	}

}
