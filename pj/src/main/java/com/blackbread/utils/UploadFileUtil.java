package com.blackbread.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.fileupload.util.Streams;
import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtil {

	/**
	 * 将上传的文件进行重命名
	 * 
	 * @param name
	 * @return
	 */
	private static String rename(String name) {
		Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date()));
		Long random = (long) (Math.random() * now);
		String fileName = now + "" + random;

		if (name.indexOf(".") != -1) {
			fileName += name.substring(name.lastIndexOf("."));
		}

		return fileName;
	}
	public static String saveFile(MultipartFile file,String path){
		BufferedInputStream in = null;
		FileOutputStream out = null;
		String result="";
		try {
			in = new BufferedInputStream(file.getInputStream());
			String fileName=rename(file.getOriginalFilename());
			File dirFile=new File(path);
			if(!dirFile.exists())
				dirFile.mkdirs();
			File outfile = new File(dirFile,fileName);
			result=outfile.getName();
			out = new FileOutputStream(outfile);
			BufferedOutputStream output = new BufferedOutputStream(out);
			Streams.copy(in, output, true);
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				in.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}

}
