package com.blackbread.dao;

import java.util.List;
import java.util.Map;

import com.blackbread.model.User;

public interface UserDAO {
	public void query();

	public List<User> list(int page);

	public void add(final List<User> list);
	
	public void insert(User user);
}
