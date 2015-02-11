package com.blackbread.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blackbread.model.News;
import com.blackbread.service.NewsService;
import com.blackbread.utils.JsonUtil;
import com.blackbread.utils.LoginUtil;
import com.blackbread.utils.Pagination;

@Controller
public class FrontController {
	private static final Logger logger = Logger
			.getLogger(FrontController.class);
	@Autowired
	NewsService newsService;
	public FrontController(){
		System.out.println("初始化了几次");
	}
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) throws Exception {
		Pagination pagination = new Pagination(1, 1);
		News news = new News();
		news.setType(1);
		List<News> newsList = newsService.list(pagination, news);
		Pagination pagination2 = new Pagination(1, 6);
		news.setType(2);
		List<News> noticList = newsService.list(pagination2, news);
		news.setType(3);
		List<News> ruleList = newsService.list(pagination2, news);
		news.setType(4);
		List<News> topList = newsService.list(pagination2, news);
		
		if(newsList.size()>0){
			modelMap.put("news", newsList.get(0));
		}
		modelMap.put("noticList", noticList);
		modelMap.put("ruleList", ruleList);
		modelMap.put("topList", topList);
		LoginUtil util = new LoginUtil();
		modelMap.put("register", util.getRegistUrl());
		return new ModelAndView("/front/index", modelMap);
	}
	@RequestMapping(value = "/list/{pageSize}/{pageNo}")
	public ModelAndView list(@PathVariable int pageSize,
			@PathVariable int pageNo, @ModelAttribute("news") News news,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		Pagination pagination = new Pagination(pageNo, pageSize);
		pagination = newsService.query(pagination, news);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("pagination", pagination);
		model.put("type", news.getType());
		return new ModelAndView("/front/list", model);
	}
	@RequestMapping(value = "/detail")
	public ModelAndView news(HttpServletRequest request,@ModelAttribute("news") News news,
			HttpServletResponse response, ModelMap modelMap) throws Exception {
		news= newsService.queryByID(news);
		modelMap.put("news", news);
		return new ModelAndView("/front/detail", modelMap);
	}
	@RequestMapping(value = "/login")
	@ResponseBody
	public String login(@RequestParam String username,
			@RequestParam String password, @RequestParam String language,
			ModelMap modelMap) throws Exception {
		LoginUtil util = new LoginUtil();
		String url=util.getUrl(language, username, password);
		modelMap.put("url", url);
		return JsonUtil.jsonFromObject(modelMap);
	}
}
