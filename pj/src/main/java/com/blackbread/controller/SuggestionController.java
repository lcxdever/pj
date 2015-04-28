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
	private final String listPage="redirect:/back/suggestion/list?pageSize=10&pageNo=1";

	@RequestMapping(value = "/list")
	public ModelAndView list(@RequestParam int pageSize,
			@RequestParam int pageNo, @ModelAttribute("suggestion") Suggestion suggestion,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		Map<String, Object> model = new HashMap<String, Object>();
		if(user==null||(!"1".equals(user.getRoleID())&&!"2".equals(user.getRoleID()))){
			modelMap.put("message", "您无权查看此模块");
		}else{
			Pagination pagination = new Pagination(pageNo, pageSize);
			pagination = suggestionService.query(pagination, suggestion);
			model.put("pagination", pagination);
		}
		return new ModelAndView("/pages/suggestion/list", model);
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("suggestion") Suggestion suggestion,
			HttpServletRequest request, ModelMap modelMap) {
		suggestionService.insert(suggestion);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "投诉或建议成功");
		return new ModelAndView("/front/suggestions", model);
	}

	@RequestMapping(value = "/detail")
	public ModelAndView query(@ModelAttribute("suggestion") Suggestion suggestion,
			HttpServletRequest request, ModelMap modelMap) {
		suggestion=suggestionService.queryByID(suggestion);
		Map<String, Object> model = new HashMap<String, Object>();
		modelMap.put("suggestion", suggestion);
		return new ModelAndView("/pages/suggestion/detail", model);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute("suggestion") Suggestion suggestion,
			HttpServletRequest request, ModelMap modelMap) {
		suggestionService.delete(suggestion);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "删除成功");
		return new ModelAndView(listPage, model);
	}
}
