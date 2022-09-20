package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.LocationDAO;
import com.sist.vo.LocationVO;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationDAO dao;
	@Override
	public List<LocationVO> locationListData(Map map) {
		// TODO Auto-generated method stub
		return dao.LocationListData(map);
	}

	@Override
	public LocationVO locationDetailData(Map map) {
		// TODO Auto-generated method stub
		return dao.LocationDetailData(map);
	}

	@Override
	public int LocationTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.LocationTotalPage(map);
	}

}
