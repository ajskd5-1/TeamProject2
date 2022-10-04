package com.sist.service;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface MainService {
	public List<LocationVO> main_location();
	public List<FoodVO> main_food();
	
	public List<LocationVO> search_search(Map map);
	public int search_totalpage(Map map);
	public List<BoardVO> boardTopData();
}
