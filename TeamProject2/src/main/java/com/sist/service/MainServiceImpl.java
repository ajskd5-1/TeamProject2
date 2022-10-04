package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	private MainDAO dao;
	
	@Override
	public List<LocationVO> main_location() {
		return dao.main_location();
	}
	@Override
	public List<FoodVO> main_food() {
		return dao.main_food();
	}

	@Override
	public List<LocationVO> search_search(Map map) {
		return dao.search_search(map);
	}

	@Override
	public int search_totalpage(Map map) {
		return dao.search_totalpage(map);
	}

	@Override
	public List<BoardVO> boardTopData() {
		// TODO Auto-generated method stub
		return dao.boardTopData();
	}
	
	
}
