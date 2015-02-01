package com.blackbread.service;

import java.util.List;
import java.util.Map;

import com.blackbread.model.User;

public interface UserService {
	public void insert(User user);

	public List<User> list(int page);
}
