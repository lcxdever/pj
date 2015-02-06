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

import com.blackbread.model.User;
import com.blackbread.service.UserService;
import com.blackbread.utils.Pagination;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	private static final Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	UserService userService;

	@RequestMapping(value = "/list/{pageSize}/{pageNo}")
	public ModelAndView list(@PathVariable int pageSize,
			@PathVariable int pageNo, @ModelAttribute("user") User user,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		Pagination pagination = new Pagination(pageNo, pageSize);
		pagination = userService.query(pagination, user);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("pagination", pagination);
		return new ModelAndView("/pages/user/list", model);
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("user") User user,
			HttpServletRequest request, ModelMap modelMap) {
		User login=(User)request.getSession().getAttribute("user");
		user.setCreateUser(login.getUserName());
		userService.insert(user);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "添加成功");
		return new ModelAndView("redirect:/user/list/10/1", model);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(@ModelAttribute("user") User user,
			HttpServletRequest request, ModelMap modelMap) {
		userService.modify(user);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "修改成功");
		return new ModelAndView("redirect:/user/list/10/1", model);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute("user") User user,
			HttpServletRequest request, ModelMap modelMap) {
		userService.delete(user);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "删除成功");
		return new ModelAndView("redirect:/user/list/10/1", model);
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(
			HttpServletRequest request, ModelMap modelMap) {
		request.getSession().removeAttribute("user");
		return new ModelAndView("/login", modelMap);
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user") User user,
			HttpServletRequest request, ModelMap modelMap) {
		boolean success = userService.login(user);
		Map<String, Object> model = new HashMap<String, Object>();
		if (success) {
			model.put("msg", "登录成功");
			request.getSession().setAttribute("user", user);
			return new ModelAndView("redirect:/user/list/10/1", model);
		} else {
			model.put("msg", "用户名密码不符合");
			model.put("status", "error");
			return new ModelAndView("/login", model);
		}
	}
}
