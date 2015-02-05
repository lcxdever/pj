package com.blackbread.service.imp;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackbread.dao.UserMapper;
import com.blackbread.model.User;
import com.blackbread.service.UserService;
import com.blackbread.utils.Coder;
import com.blackbread.utils.Pagination;

@Service
public class UserServiceImp implements UserService {

	UserMapper userMapper;

	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public void insert(User user) {
		user.setCreateTime(new Date());
		user.setCreateUser("张三");
		user.setPassWord(Coder.generatePassword(user.getPassWord()));
		user.setId(UUID.randomUUID().toString());
		userMapper.insert(user);
	}

	public Pagination  query(Pagination pagination, User user) {
		if (pagination == null)
			pagination = new Pagination(1, 10000);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pagination.getStart());
		map.put("end", pagination.getEnd());
		long totolCount = userMapper.count(map);
		pagination.setTotalCount(totolCount);
		List<User> list = userMapper.query(map);
		pagination.setValuesList(list);
		return pagination;
	}

	@Override
	public void modify(User user) {
		if (user.getPassWord() != null)
			user.setPassWord(Coder.generatePassword(user.getPassWord()));
		userMapper.modify(user);
	}

	@Override
	public void delete(User user) {
		userMapper.delete(user);
	}

	@Override
	public boolean login(User user) {
		String passWord=user.getPassWord();
		user=userMapper.queryByID(user);
		return Coder.validatePassword(user.getPassWord(), passWord);
	}

}
