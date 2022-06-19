package com.lol.hgl.util;

import java.awt.*;
import java.io.File;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.lol.hgl.dto.ggImgDto;

@Component("fileUtils")
public class FileUtil {
	private static final String filePath = "C:\\HGL\\src\\main\\webapp\\GGimg\\";
	public ggImgDto parseInsertFileInfo(MultipartFile multipartFile) throws Exception {

		ggImgDto dto = new ggImgDto();
		String originalFileExtension = null; // 확장자

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		dto.setGgImgOrginalName(multipartFile.getOriginalFilename());
		originalFileExtension = dto.getGgImgOrginalName().substring(dto.getGgImgOrginalName().lastIndexOf("."));
		dto.setGgImgStoreName(CommonUtil.getRandomString() + originalFileExtension);
		file = new File(filePath + dto.getGgImgStoreName());
		multipartFile.transferTo(file);
		dto.setGgImgSize((multipartFile.getSize()));

		return dto;
	}
	
	public void deleteFile(List<ggImgDto> list) {
		for(int i=0; i<list.size(); i++) {
			String fileName = filePath+list.get(i).getGgImgStoreName();
			File file = new File(fileName);		 
	        if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제 성공");
	            }else{
	                System.out.println("파일삭제 실패");
	            }
	        }else{
	            System.out.println("파일이 존재하지 않습니다.");
	        }

		}
	}
}
