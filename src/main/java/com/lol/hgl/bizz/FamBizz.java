package com.lol.hgl.bizz;

import java.util.List;

import com.lol.hgl.dto.famDto;
import com.lol.hgl.dto.healthDto;

public interface FamBizz {
	
	public List<famDto> allFamList(int memberNo);
	public int insertFam(famDto famDto, String disease);
	public int insertFamBirth(famDto famDto, String memberId, String memberNickname);
	public famDto famDetail(int famNo);
	public int famDelete(int famNo);
	public int FamHealthInsert(healthDto healthdto);
	public healthDto healthDetail(int famNo);
	public List<healthDto> heatlList(int famNo);
	public int FamDiseaseUpdate(famDto famDto, String disease);
}
