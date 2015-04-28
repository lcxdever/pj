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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blackbread.model.User;
import com.blackbread.service.UserService;
import com.blackbread.utils.Pagination;

@Controller
@RequestMapping(value = "/back/user")
public class UserController {
	private static final Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	UserService userService;
	private final String listPage="redirect:/back/user/list?pageSize=10&pageNo=1";
	@RequestMapping(value = "/list")
	public ModelAndView list(@RequestParam int pageSize,
			@RequestParam int pageNo, @ModelAttribute("user") User user,
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		User loginUser = (User) request.getSession().getAttribute("user");
		Map<String, Object> model = new HashMap<String, Object>();
		if(loginUser==null||!"1".equals(loginUser.getRoleID())){
			modelMap.put("message", "您无权查看此模块");
		}else{
			Pagination pagination = new Pagination(pageNo, pageSize);
			pagination = userService.query(pagination, user);
			model.put("pagination", pagination);
		}
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
		return new ModelAndView(listPage, model);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modify(@ModelAttribute("user") User user,
			HttpServletRequest request, ModelMap modelMap) {
		userService.modify(user);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "修改成功");
		return new ModelAndView(listPage, model);
	}
	@RequestMapping(value = "/modifyRole", method = RequestMethod.POST)
	@ResponseBody
	public Object modifyRole(@ModelAttribute("user") User user,
			HttpServletRequest request, ModelMap modelMap) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			userService.modify(user);
			model.put("desc", "修改成功");
			model.put("success", true);
		} catch (Exception e) {
			model.put("desc", "修改失败");
			model.put("success", false);
		}
		return model;
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute("user") User user,
			HttpServletRequest request, ModelMap modelMap) {
		userService.delete(user);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("msg", "删除成功");
		return new ModelAndView(listPage, model);
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
		user = userService.login(user);
		Map<String, Object> model = new HashMap<String, Object>();
		if (user!=null) {
			model.put("msg", "登录成功");
			request.getSession().setAttribute("user", user);
			return new ModelAndView(listPage, model);
		} else {
			model.put("msg", "用户名密码不符合");
			model.put("status", "error");
			return new ModelAndView("/login", model);
		}
	}
}
