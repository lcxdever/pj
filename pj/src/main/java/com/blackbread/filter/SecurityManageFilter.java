package com.blackbread.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blackbread.model.User;

/**
 * <p>
 * 过滤器，用于验证登录的信息，判断session是否存在
 * </p>
 *          <p>
 *          9.99 9999/99/99 修改者姓名 修改内容说明
 *          </p>
 * @see 参考类1
 */
public class SecurityManageFilter implements Filter {

	public static final int ADMIN_CODE = 0;
	protected FilterConfig config;

	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

	public void doFilter(ServletRequest srequest, ServletResponse sresponse,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) srequest;
		HttpServletResponse response = (HttpServletResponse) sresponse;

		String url = request.getRequestURI();
		if ((url.indexOf("user") != -1 || url.indexOf("news") != -1)&&!url.endsWith("/user/login")) {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null)
				response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
		chain.doFilter(srequest, sresponse);

	}

	/*
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
	}

}
