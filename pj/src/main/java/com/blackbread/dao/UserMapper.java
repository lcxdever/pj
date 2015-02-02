package com.blackbread.dao;

import java.util.List;
import java.util.Map;

import com.blackbread.model.User;

public interface UserMapper {

	public List<User> list(int page);

	public void insert(User user);

	public void modify(User user);

	public void delete(User user);
}
