package com.blackbread.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.blackbread.model.News;
import com.blackbread.service.NewsService;
import com.blackbread.utils.Pagination;

@Controller
public class FrontController {
	private static final Logger logger = Logger.getLogger(FrontController.class);
	@Autowired
	NewsService newsService;

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) throws Exception {
		Pagination pagination=new Pagination(1, 1);
		News news=new News();
		news.setType(1);
		List<News> newsList = newsService.list(pagination, news);
		Pagination pagination2=new Pagination(1, 6);
		news.setType(2);
		List<News> noticList = newsService.list(pagination2, news);
		news.setType(3);
		List<News> ruleList = newsService.list(pagination2, news);
		news.setType(4);
		List<News> topList = newsService.list(pagination2, news);
		
		modelMap.put("newsList", newsList);
		modelMap.put("noticList",noticList);
		modelMap.put("ruleList",ruleList);
		modelMap.put("topList",topList);
		return new ModelAndView("/pages/news/list", modelMap);
	}
}
