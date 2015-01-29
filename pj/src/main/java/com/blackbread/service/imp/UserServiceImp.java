package com.blackbread.service.imp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.blackbread.dao.UserDAO;
import com.blackbread.model.User;
import com.blackbread.service.UserService;

@Service
public class UserServiceImp implements UserService {
	@Autowired
	UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void insert(User user) {
		userDAO.insert(user);
	}

	public List<Map<String, Object>> list(int type) {
		return userDAO.list();
	}

}
