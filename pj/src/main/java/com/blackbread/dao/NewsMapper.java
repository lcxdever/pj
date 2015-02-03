package com.blackbread.dao;

import java.util.List;
import java.util.Map;

import com.blackbread.model.News;

public interface NewsMapper {

	public List<News> query(Map<String, Object> map);

	public long count(Map<String, Object> map);

	public void insert(News news);

	public void modify(News news);

	public void delete(News news);
}
