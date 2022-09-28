package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.FoodVO;

public interface FoodService {
	public List<FoodVO> FoodListData(Map map);
	public FoodVO FoodDetailData(int no);
	public int FoodTotalPage(Map map);
}