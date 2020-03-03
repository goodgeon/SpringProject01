package com.mycompany.myapp.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.myapp.dao.UserDAO;
import com.mycompany.myapp.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserDAO userdao;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		
		return "user/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO user, HttpSession session) {
		logger.info(user.toString());
		String username = user.getUsername();
		UserVO u = userdao.getUser(username);
		//logger.info(u.toString());
		/*
		 * if(u.getPassword().equals(user.getPassword())) { return "success"; }
		 */
		
		return "fail";
	}
	
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String insertUser(UserVO user) {
		logger.info(user.toString());
		userdao.insertUser(user);
		
		return "redirect:/";
	}
	
	
	
}
