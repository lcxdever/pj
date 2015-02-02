package com.blackbread.service.imp;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.blackbread.dao.NewsMapper;
import com.blackbread.model.News;
import com.blackbread.service.NewsService;
import com.blackbread.utils.UploadFileUtil;

@Service
public class NewsServiceImp implements NewsService {
	@Autowired
	NewsMapper newsMapper;

	public void insert(MultipartFile file, News news, String path) {
		if (!file.isEmpty()) {
			String realFile = UploadFileUtil.saveFile(file, path + "upload");
			news.setUrl("/upload/" + realFile);
			news.setFileName(file.getOriginalFilename());
		} else {
			news.setUrl("");
			news.setFileName("");
		}
		news.setCreateTime(new Date());
		news.setCreateUser("张三");
		news.setId(UUID.randomUUID().toString());
		news.setIsHot(0);
		newsMapper.insert(news);
	}

	public List<News> list(int page) {
		return newsMapper.list(page);
	}

	@Override
	public void modify(News news) {
		newsMapper.modify(news);
	}

	@Override
	public void delete(News news) {
		newsMapper.delete(news);
	}

}
