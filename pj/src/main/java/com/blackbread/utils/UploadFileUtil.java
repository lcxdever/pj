package com.blackbread.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.management.RuntimeErrorException;

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

	public static String saveFile(MultipartFile file, String path) {
		BufferedInputStream in = null;
		FileOutputStream out = null;
		String result = "";
		try {
			in = new BufferedInputStream(file.getInputStream());
			String fileName = rename(file.getOriginalFilename());
			File dirFile = new File(path);
			if (!dirFile.exists())
				dirFile.mkdirs();
			File outfile = new File(dirFile, fileName);
			result = outfile.getName();
			out = new FileOutputStream(outfile);
			BufferedOutputStream output = new BufferedOutputStream(out);
			Streams.copy(in, output, true);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return result;
	}

	private enum include {
		JPEG, JPG, PNG, BMP, SVG, GIF;
	}

	public static void filter(String originalFilename) {
		String suffix = getSuffix(originalFilename);
		try {
			include.valueOf(suffix.toUpperCase());
		} catch (Exception e) {
			throw new RuntimeException(suffix + " is not allowed.", e);
		}
	}

	static String getSuffix(String originalFilename) {
		if (originalFilename == null || originalFilename.length() == 0) {
			throw new RuntimeException("Empty origin file name.");
		}
		int start = originalFilename.lastIndexOf(".");
		if (start == -1) {
			throw new RuntimeException("Can not identify suffix.");
		}
		String suffix = originalFilename.substring(start + 1,
				originalFilename.length());
		if (suffix == null || suffix.length() == 0) {
			throw new RuntimeException("Can not identify suffix.");
		}
		return suffix;
	}
}
