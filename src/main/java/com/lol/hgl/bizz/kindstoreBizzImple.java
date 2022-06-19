package com.lol.hgl.bizz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lol.hgl.dao.kindstoreDao;
import com.lol.hgl.dto.kindstoreDto;

@Service
public class kindstoreBizzImple implements kindstoreBizz {

	@Autowired
	private kindstoreDao dao;
	
	@Override
	public kindstoreDto selectOne(int kindNum) {
		return dao.selectOne(kindNum);
	}

	//검색할 조건에 맞는게 몇개있는지 전체적으로 세어주는것
	@Override
	public int kindstoreListSerchCount(String kindDo, String kindCity) {
		System.out.println(kindDo);
		System.out.println(kindCity);
		return dao.kindstoreListSerchCount(kindDo, kindCity);
	}

	@Override
	public List<kindstoreDto> selectSearchAll(int startPost, int endPost, String kinddo, String kindcity) {
		return dao.selectSearchAll(startPost, endPost, kinddo, kindcity);
	}
}
