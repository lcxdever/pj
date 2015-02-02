package com.blackbread.dao;

import java.util.List;

import com.blackbread.model.News;

public interface NewsMapper {

	public List<News> list(int page);

	public void insert(News news);

	public void modify(News news);

	public void delete(News news);
}
