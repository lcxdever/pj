package com.blackbread.dao.imp;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.blackbread.dao.UserDAO;
import com.blackbread.model.User;

@Repository
public class UserDAOImp implements UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Map<String, Object>> list() {
		String sql = "select * from t_user";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		return list;
	}

	public void add(final List<User> list) {
		String sqlStr = "insert into  t_user (id,name,password)values(?,?,?)";
		jdbcTemplate.batchUpdate(sqlStr, new BatchPreparedStatementSetter() {
			public int getBatchSize() {
				return list.size();
			}

			public void setValues(PreparedStatement ps, int i)
					throws SQLException {
				ps.setString(2, list.get(i).getUsername());
				ps.setString(3, list.get(i).getPassword());
			}
		});
	}

	public void query() {
		

	}

	@Override
	public void insert(final User user) {
		String sqlStr = "insert into  t_user (id,username,password)values(?,?,?)";
		jdbcTemplate.update(sqlStr, new PreparedStatementSetter(){

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, user.getId());
				ps.setString(2, user.getUsername());
				ps.setString(3, user.getPassword());
			}
			
		});
		
	}

}
