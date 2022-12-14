package com.lol.hgl.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lol.hgl.dto.calDto;

@Repository
public class CalDaoImple implements CalDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "cal.";

	@Override
	public int insert(calDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace+"insert", dto);
			}catch(Exception e ) {
				e.printStackTrace();
			}	
		return res;
		
	}

	@Override
	public calDto selectOne(int seq) {
		calDto res = new calDto();
		try {
			res = sqlSession.selectOne(namespace+"selectOne", seq);
			}catch(Exception e ) {
				e.printStackTrace();
			}		
		return res;
	}

	@Override
	public int update(calDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.update(namespace+"update", dto);
			}catch(Exception e ) {
				e.printStackTrace();
			}
		return res;
	}
	
	@Override
	public int delete(int seq) {
		int res = 0;
		try {
			res = sqlSession.delete(namespace+"delete", seq);
			}catch(Exception e ) {
				e.printStackTrace();
			}	
		return res;
	}

	@Override
	public List<calDto> selectAll(String memberId, String yyyyMM) {
		
		List<calDto>res = new ArrayList<calDto>();
		Map<String,String> map = new HashMap<String,String>();
		map.put("memberId", memberId);
		map.put("yyyyMM", yyyyMM);
		try {
			res = sqlSession.selectList(namespace + "selectAll",map);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int getCalViewCount(String memberId, String yyyyMMdd) {

		int res = 0;
		Map<String,String> map = new HashMap<String,String>();
		map.put("memberId", memberId);
		map.put("yyyyMMdd", yyyyMMdd);
			
		try {
			res = sqlSession.selectOne(namespace + "getCalViewCount", map);			
			} catch(Exception e) {
				e.printStackTrace();
			}
		return res;
	}

	@Override
	public calDto getCalBoard(int seq) {
		calDto res = new calDto();
		try {
			res = sqlSession.selectOne(namespace+"getCalBoard", seq);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<calDto> birthList() {
		List<calDto> list = new ArrayList<calDto>();
		try {
			list = sqlSession.selectList(namespace+"birthList");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateCALSMS(int calNo) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"updateCALSMS",calNo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<calDto> calList() {
		List<calDto> list = new ArrayList<calDto>();
		try {
			list = sqlSession.selectList(namespace+"calList");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int DayListCount(calDto dto) {
		int res = 0;
		try {
			res = sqlSession.selectOne(namespace+"DayListCount", dto);
			}catch(Exception e ) {
				e.printStackTrace();
			}	
		System.out.println(res);
		return res;
	}


}
