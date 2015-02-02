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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blackbread.model.News;
import com.blackbread.service.NewsService;
import com.blackbread.utils.UploadFileUtil;

@Controller
@RequestMapping(value = "/news")
public class NewsController {
	private static final Logger logger = Logger.getLogger(NewsController.class);
	@Autowired
	NewsService newsService;

	@RequestMapping(value = "/list/{page}")
	public ModelAndView list(@PathVariable int page,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		List<News> list = newsService.list(page);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		return new ModelAndView("/pages/user/list", model);
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
		return new ModelAndView("redirect:/user/list/1", model);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(@ModelAttribute("user") News user,
			HttpServletRequest request, ModelMap modelMap) {
		newsService.modify(user);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "修改成功");
		return new ModelAndView("redirect:/user/list/1", model);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute("user") News user,
			HttpServletRequest request, ModelMap modelMap) {
		newsService.delete(user);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "删除成功");
		return new ModelAndView("redirect:/user/list/1", model);
	}
}
