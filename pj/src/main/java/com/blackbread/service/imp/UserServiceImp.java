package com.blackbread.service.imp;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.aspectj.apache.bcel.classfile.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackbread.dao.UserDAO;
import com.blackbread.model.User;
import com.blackbread.service.UserService;
import com.blackbread.utils.Coder;

@Service
public class UserServiceImp implements UserService {
	@Autowired
	UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void insert(User user) {
		user.setCreateTime(new Date());
		user.setCreateUser("张三");
		user.setPassWord(Coder.generatePassword(user.getPassWord()));
		user.setId(UUID.randomUUID().toString());
		userDAO.insert(user);
	}

	public List<User> list(int page) {
		return userDAO.list(page);
	}

}
