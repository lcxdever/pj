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
import com.blackbread.utils.DateUtil;
import com.blackbread.utils.ImageUtil;
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
			String relaPath = "upload/files/" + DateUtil.formart(new Date(), "yyyyMMdd")
					+ "/";
			String realFile = UploadFileUtil.saveFile(file, path+relaPath);
			news.setUrl(relaPath + realFile);
			news.setFileName(file.getOriginalFilename());
		} else {
			news.setUrl("");
			news.setFileName("");
		}
		news.setCreateTime(new Date());
		news.setId(UUID.randomUUID().toString());
		news.setIsHot(0);
		newsProcess(news);
		newsMapper.insert(news);
	}

	private void newsProcess(News news) {
		String onlyTxt = news.getOnlyTxt();
		news.setSummary(onlyTxt.substring(0, onlyTxt.length() > 50 ? 50
				: onlyTxt.length()));
		List<String> imageUrlList = ImageUtil.getImageUrl(news.getContent());
		List<String> imageSrcList = ImageUtil.getImageSrc(imageUrlList);
		if (imageSrcList.size() > 0)
			news.setShowPicUrl(imageSrcList.get(0));
		else
			news.setShowPicUrl("");
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
		if (news.getType() == 4 && file != null && file.getSize() != 0)
			UploadFileUtil.filter(file.getOriginalFilename());
		if (!file.isEmpty()) {
			String relaPath = "upload/files/" + DateUtil.formart(new Date(), "yyyyMMdd")
					+ "/";
			String realFile = UploadFileUtil.saveFile(file, path+relaPath);
			news.setUrl(relaPath + realFile);
			news.setFileName(file.getOriginalFilename());
		} else {
			news.setUrl("");
			news.setFileName("");
		}
		newsProcess(news);
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
