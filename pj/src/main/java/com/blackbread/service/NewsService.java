package com.blackbread.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.blackbread.model.News;

public interface NewsService {
	public void insert(MultipartFile file,News news,String path);

	public List<News> list(int page);

	public void modify(News news);

	public void delete(News news);
}
