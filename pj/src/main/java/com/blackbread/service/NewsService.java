package com.blackbread.service;

import org.springframework.web.multipart.MultipartFile;

import com.blackbread.model.News;
import com.blackbread.utils.Pagination;

public interface NewsService {
	public void insert(MultipartFile file, News news, String path);

	public Pagination query(Pagination pagination, News news);

	public void modify(MultipartFile file, News news, String path);

	public void delete(News news);

	public News queryByID(News news);
}
