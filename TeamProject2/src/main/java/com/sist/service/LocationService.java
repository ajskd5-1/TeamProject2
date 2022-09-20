package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.LocationVO;

public interface LocationService {
	public List<LocationVO> locationListData(Map map);
	public LocationVO locationDetailData(Map map);
	public int LocationTotalPage(Map map);
}
