package com.lol.hgl.bizz;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lol.hgl.dao.AdminDao;
import com.lol.hgl.dao.FWLDao;
import com.lol.hgl.dto.fwlbDto;
import com.lol.hgl.dto.ggDto;
import com.lol.hgl.dto.memberDto;

@Service
public class AdminBizzImple implements AdminBizz {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private FWLDao fwlDao;
	
	@Override
	public int memberAllListCount() {
		return dao.memberAllListCount();
	}
	
	@Override
	public List<memberDto> memberAllList(int startPost, int endPost) {
		return dao.memberAllList(startPost, endPost);
	}

	@Override
	public memberDto memberSelectOne(String memberNickName) {
		return dao.memberSelectOne(memberNickName);
	}

	@Override
	public int ggCount(String memberNickName) {
		return dao.ggCount(memberNickName);
	}

	@Override
	public int fwlbCount(String memberNickName) {
		return dao.fwlbCount(memberNickName);
	}

	@Override
	public List<ggDto> memberGGList(int startPost, int endPost, String memberNickName) {
		return dao.memberGGList(startPost, endPost, memberNickName);
	}

	@Override
	public List<fwlbDto> memberFwlbList(int startPost, int endPost, String memberNickName) {
		return dao.memberFwlbList(startPost, endPost, memberNickName);
	}

	@Override
	public int ggDelete(int ggNo) {
		return dao.ggDelete(ggNo);
	}

	@Override
	public int fwlbDelete(int fwlbNo) {
		return dao.fwlbDelete(fwlbNo);
	}

	@Override
	public int memberProhibit(String memberNickName) {
		dao.prohibitChk(memberNickName);
		dao.prohibitCount(memberNickName);
		memberDto user = dao.memberSelectOne(memberNickName);
		int count = user.getMemberProhibitCount();
		Date userLogOutTime = user.getMemberLogoutTime();
		Calendar cal = Calendar.getInstance();
		cal.setTime(userLogOutTime);
		switch (count) {
		case 1:
			cal.add(Calendar.DATE, 7);
			break;
		case 2:
			cal.add(Calendar.DATE, 15);
			break;
		case 3:
			cal.add(Calendar.DATE, 30);
			break;
		case 4:
			dao.memberGetOut(memberNickName);
			break;
		}
		Date mangeTime = cal.getTime();
		memberDto dto = new memberDto(memberNickName, mangeTime);
		dao.prohibitMangeTime(dto);
		return count;
	}

	@Override
	public int memberProhibitCancel(String memberNickName) {
		int res = dao.downProhibitcount(memberNickName);
		res = dao.prohibitCancel(memberNickName);
		return res;
	}

	@Override
	public int memberGetOut(String memberNickName) {
		fwlDao.FWLBDeleteAll(memberNickName);
		return dao.memberGetOut(memberNickName);
	}




}
