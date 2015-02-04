package com.blackbread.service.imp;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.blackbread.dao.NewsMapper;
import com.blackbread.model.News;
import com.blackbread.model.User;
import com.blackbread.service.NewsService;
import com.blackbread.utils.MapHelper;
import com.blackbread.utils.Pagination;
import com.blackbread.utils.UploadFileUtil;

@Service
public class NewsServiceImp implements NewsService {
	@Autowired
	NewsMapper newsMapper;

	public void insert(MultipartFile file, News news, String path) {
		if (news.getType() == 4)
			UploadFileUtil.filter(file.getOriginalFilename());
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

	public Pagination query(Pagination pagination, News news) {
		if (pagination == null)
			pagination = new Pagination(1, 10000);
		Map<String, Object> map = MapHelper.Bean2Map(news);
		map.put("start", pagination.getStart());
		map.put("end", pagination.getEnd());
		long totolCount = newsMapper.count(map);
		pagination.setTotalCount(totolCount);
		List<News> list = newsMapper.query(map);
		pagination.setValuesList(list);
		return pagination;
	}

	@Override
	public void modify(MultipartFile file, News news, String path) {
		if (news.getType() == 4)
			UploadFileUtil.filter(file.getOriginalFilename());
		if (!file.isEmpty()) {
			String realFile = UploadFileUtil.saveFile(file, path + "upload");
			news.setUrl("/upload/" + realFile);
			news.setFileName(file.getOriginalFilename());
		} else {
			news.setUrl("");
			news.setFileName("");
		}
		newsMapper.modify(news);
	}

	@Override
	public void delete(News news) {
		newsMapper.delete(news);
	}

	@Override
	public News queryByID(News news) {
		return newsMapper.queryByID(news);
	}

	@Override
	public List<News> list(Pagination pagination, News news) {
		if (pagination == null)
			throw new RuntimeException("分页参数不能为空");
		Map<String, Object> map = MapHelper.Bean2Map(news);
		map.put("start", pagination.getStart());
		map.put("end", pagination.getEnd());
		List<News> list = newsMapper.query(map);
		return list;
	}

}
