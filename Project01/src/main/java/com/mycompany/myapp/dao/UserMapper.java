package com.mycompany.myapp.dao;

import com.mycompany.myapp.vo.UserVO;

public interface UserMapper {

	void insertUser(UserVO user);

	UserVO getUser(String username);

}
