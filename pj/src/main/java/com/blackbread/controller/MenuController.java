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

import com.blackbread.model.Menu;
import com.blackbread.model.Suggestion;
import com.blackbread.model.User;
import com.blackbread.service.SuggestionService;
import com.blackbread.service.UserService;
import com.blackbread.utils.Pagination;

@Controller
@RequestMapping(value = "/back/menu")
public class MenuController {
	private static final Logger logger = Logger.getLogger(MenuController.class);
	@Autowired
	SuggestionService suggestionService;
	private final String listPage="redirect:/back/menu/list";

	@RequestMapping(value = "/list")
	public ModelAndView list(@ModelAttribute("menu") Menu menu,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		Map<String, Object> model = new HashMap<String, Object>();
		return new ModelAndView("/pages/menu/list", model);
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
