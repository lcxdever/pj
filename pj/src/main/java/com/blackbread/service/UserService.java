package com.blackbread.service;

import java.util.List;
import java.util.Map;

import com.blackbread.model.User;
import com.blackbread.utils.Pagination;

public interface UserService {
	public void insert(User user);

	public Pagination query(Pagination pagination, User user);

	public void modify(User user);

	public void delete(User user);
}
