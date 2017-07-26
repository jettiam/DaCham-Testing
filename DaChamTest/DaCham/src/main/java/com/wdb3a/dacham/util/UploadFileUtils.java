package com.wdb3a.dacham.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class UploadFileUtils {
	public static String uploadFile(MultipartHttpServletRequest request ,String originalName, String uploadPath, byte[] fileData) throws Exception{
		long time = System.currentTimeMillis(); 

		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		String str = dayTime.format(new Date(time));
		
		str = str.replace(':', '_');
			
		int extIdx = originalName.lastIndexOf(".");
		String nameWithoutExtension = originalName.substring(0,extIdx);
		String savedName = nameWithoutExtension+str;
		savedName += originalName.substring(extIdx);
		
		String path = request.getSession().getServletContext().getRealPath("");
		
		File target = new File(path+uploadPath, savedName);
		System.out.println(target.getAbsolutePath());
		
		FileCopyUtils.copy(fileData, target);
	
		//이미지 파일이면 thumbnail 저장
		//아니면 icon 저장
		
		
		
		return savedName;
	}
	

	
	
}
