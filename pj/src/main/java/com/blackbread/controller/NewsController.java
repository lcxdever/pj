package com.blackbread.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blackbread.model.News;
import com.blackbread.service.NewsService;
import com.blackbread.utils.Pagination;

@Controller
@RequestMapping(value = "/news")
public class NewsController {
	private static final Logger logger = Logger.getLogger(NewsController.class);
	@Autowired
	NewsService newsService;

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
		return new ModelAndView(dispart(news), model);
	}

	private String dispart(News news) {
		String url = "/pages/news/news";
		switch (news.getType()) {
		case 1:
			url = "/pages/news/news";
			break;
		case 2:
			url = "/pages/news/notices";
			break;
		case 3:
			url = "/pages/news/rules";
			break;
		case 4:
			url = "/pages/news/tops";
			break;
		default:
			break;
		}
		return url;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(
			@RequestParam(value = "file", required = false) MultipartFile file,
			@ModelAttribute("news") News news, HttpServletRequest request,
			ModelMap modelMap) {
		newsService.insert(file, news, request.getSession().getServletContext()
				.getRealPath("/"));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "添加成功");
		return new ModelAndView("redirect:/news/list/10/1?type="+news.getType(), model);
	}

	@RequestMapping(value = "/query4modify", method = RequestMethod.POST)
	public ModelAndView query4modify(@ModelAttribute("news") News news,
			HttpServletRequest request, ModelMap modelMap) {
		news = newsService.queryByID(news);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("news", news);
		return new ModelAndView("/pages/news/modify", model);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(
			@RequestParam(value = "file", required = false) MultipartFile file,
			@ModelAttribute("news") News news, HttpServletRequest request,
			ModelMap modelMap) {
		newsService.modify(file, news, request.getSession().getServletContext()
				.getRealPath("/"));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "修改成功");
		return new ModelAndView("redirect:/news/list/10/1?type="+news.getType(), model);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute("news") News news,
			HttpServletRequest request, ModelMap modelMap) {
		newsService.delete(news);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "删除成功");
		return new ModelAndView("redirect:/news/list/10/1?type="+news.getType(), model);
	}
}
