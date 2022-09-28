package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

@Service
public class FoodServiceImpl implements FoodService {
	@Autowired
	private FoodDAO dao;

	@Override
	public List<FoodVO> FoodListData(Map map) {
		// TODO Auto-generated method stub
		return dao.foodListData(map);
	}

	@Override
	public FoodVO FoodDetailData(int no) {
		// TODO Auto-generated method stub
		return dao.foodDetailData(no); 
	}

	@Override
	public int FoodTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.foodTotalPage(map);
	}
	
}