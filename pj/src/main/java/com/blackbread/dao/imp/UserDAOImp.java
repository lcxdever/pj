package com.blackbread.dao.imp;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.blackbread.dao.UserDAO;
import com.blackbread.model.User;

@Repository
public class UserDAOImp implements UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<User> list(int page) {
		return sqlSessionTemplate.selectList("user-list");
	}

	public void add(final List<User> list) {
	}

	public void query() {

	}

	@Override
	public void insert(final User user) {
		  sqlSessionTemplate.insert("user-insert",user);
	}

}
