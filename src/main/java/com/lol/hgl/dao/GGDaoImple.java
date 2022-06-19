package com.lol.hgl.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lol.hgl.dto.ggDto;
import com.lol.hgl.dto.ggImgDto;
import com.lol.hgl.dto.ggcmDto;

@Repository
public class GGDaoImple implements GGDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "gg.";

	@Override
	public int ggListCount() {
		int res = 0;
		try {
			res = sqlSession.selectOne(namespace + "ggListCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	

	@Override
	public List<ggDto> ggAllList() {
		List<ggDto> list = new ArrayList<>();
		try {
			list = sqlSession.selectList(namespace + "ggAllList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int insertGGRowNum(int rowNum, int ggNo) {
		int res=0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rowNum", rowNum);
		map.put("ggNo", ggNo);
		try {
			res = sqlSession.update(namespace+"insertGGRowNum", map);			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<ggDto> selectAll(int startPost, int endPost) {
		List<ggDto> res = new ArrayList<ggDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startPost", startPost);
		map.put("endPost", endPost);
		   try {
			   res = sqlSession.selectList(namespace+"selectAll", map);
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return res;
	}
	

	@Override
	public int ggListSerchCount(String topic, String keyword) {
		int res = 0;
		keyword = "%"+keyword+"%";
		Map<String, String> map = new HashMap<String, String>();
		map.put("topic", topic);
		map.put("keyword", keyword);
		try {
			res = sqlSession.selectOne(namespace + "ggListSerchCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	

	@Override
	public List<ggDto> ggSearchAllList(String topic, String keyword) {
		List<ggDto> list = new ArrayList<>();
		keyword = "%"+keyword+"%";
		Map<String, String> map = new HashMap<String, String>();
		map.put("topic", topic);
		map.put("keyword", keyword);
		try {
			list = sqlSession.selectList(namespace + "ggSearchAllList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ggDto> selectSearchAll(int startPost, int endPost, String topic, String keyword) {
		List<ggDto> list = new ArrayList<ggDto>();
		keyword = "%"+keyword+"%";
		Map<String, String> map = new HashMap<String, String>();
		map.put("startPost", String.valueOf(startPost));
		map.put("endPost", String.valueOf(endPost));
		map.put("topic", topic);
		map.put("keyword", keyword);
		try {
			list = sqlSession.selectList(namespace+"selectSearchAll", map);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public ggDto selectOne(int seq) {
		ggDto res = new ggDto();
		try {
			res = sqlSession.selectOne(namespace+"selectOne", seq);
			}catch(Exception e ) {
				e.printStackTrace();
			}		
		return res;
	}

	@Override
	public int insert(ggDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace+"insert", dto);
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
	public int update(ggDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"update", dto);
			}catch(Exception e ) {
				e.printStackTrace();
			}	
		System.out.println(res);
		return res;
	}

	@Override
	public int repleyInsert(ggcmDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace+"repleyInsert", dto);
			}catch(Exception e ) {
				e.printStackTrace();
			}	
		return res;
	}

	@Override
	public int repleyDelete(int seq) {
		int res = 0;
		try {
			res = sqlSession.delete(namespace+"repleyDelete", seq);
			}catch(Exception e ) {
				e.printStackTrace();
			}	
		return res;
	}

	@Override
	public int repleyUpdate(ggcmDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"repleyUpdate", dto);
			}catch(Exception e ) {
				e.printStackTrace();
			}	
		return res;
	}

	@Override
	public List<ggcmDto> repleySelectOne(int seq) {
		List<ggcmDto> res = new ArrayList<ggcmDto>();
		try {
			res = sqlSession.selectList(namespace+"repleySelectList", seq);
			}catch(Exception e ) {
				e.printStackTrace();
			}		
		return res;
	}

	@Override
	public int updateReadCount(int ggNo) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "updateReadCount", ggNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int newGgNo() {
		int res = 0;
		try {
			res = sqlSession.selectOne(namespace+"newGgNo");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertGgImage(ggImgDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace+"insertGgImage", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ggImgDto> imgSelectList(int ggNo) {
		List<ggImgDto> list = new ArrayList<ggImgDto>();
		try {
			list = sqlSession.selectList(namespace+"imgSelectOne",ggNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
//		System.out.println("★ 이미지 첨부 확인용 ★ : "+ list.get(0).getGgImgStoreName()); // 이미지 가져오는 것 확인용 2022 06 19 0310 , 프린트 찍는거에서 오류발생하는듯?
		return list;
	}

	@Override
	public int deleteImg(int ggNo) {
		int res=0;
		try {
			res = sqlSession.delete(namespace+"deleteImg",ggNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updeateImgDelY(int ggNo) {
		int res=0;
		try {
			res = sqlSession.update(namespace+"updeateImgDelY",ggNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
		
	}

	@Override
	public int updeateImgDelN(String[] ggImgNo) {
		int res = 0;
		Map<String,String[]> map = new HashMap<String,String[]>();
		map.put("ggImgNos", ggImgNo);
		try {
			res = sqlSession.update(namespace+"updeateImgDelN",map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteImgDelY() {
		int res=0;
		try {
			res = sqlSession.delete(namespace+"deleteImgDelY");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}


}
