package com.mycompany.myapp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	SqlSession session;

	public void insertUser(UserVO user) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		mapper.insertUser(user);
	}

	public UserVO getUser(String username) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		UserVO user;
		user = mapper.getUser(username);
		return user;
	}
}
