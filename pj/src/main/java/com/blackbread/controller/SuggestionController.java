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
import org.springframework.web.servlet.ModelAndView;

import com.blackbread.model.Suggestion;
import com.blackbread.model.User;
import com.blackbread.service.SuggestionService;
import com.blackbread.service.UserService;
import com.blackbread.utils.Pagination;

@Controller
@RequestMapping(value = "/back/suggestion")
public class SuggestionController {
	private static final Logger logger = Logger.getLogger(SuggestionController.class);
	@Autowired
	SuggestionService suggestionService;

	@RequestMapping(value = "/list/{pageSize}/{pageNo}")
	public ModelAndView list(@PathVariable int pageSize,
			@PathVariable int pageNo, @ModelAttribute("suggestion") Suggestion suggestion,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		Pagination pagination = new Pagination(pageNo, pageSize);
		pagination = suggestionService.query(pagination, suggestion);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("pagination", pagination);
		return new ModelAndView("/pages/suggestion/list", model);
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("suggestion") Suggestion suggestion,
			HttpServletRequest request, ModelMap modelMap) {
		suggestionService.insert(suggestion);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "添加成功");
		return new ModelAndView("redirect:/suggestion/list/10/1", model);
	}


	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute("suggestion") Suggestion suggestion,
			HttpServletRequest request, ModelMap modelMap) {
		suggestionService.delete(suggestion);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "删除成功");
		return new ModelAndView("redirect:/suggestion/list/10/1", model);
	}
}
