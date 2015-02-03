package com.blackbread.service;

import org.springframework.web.multipart.MultipartFile;

import com.blackbread.model.News;
import com.blackbread.utils.Pagination;

public interface NewsService {
	public void insert(MultipartFile file, News news, String path);

	public Pagination query(Pagination pagination, News news);

	public void modify(News news);

	public void delete(News news);
}
