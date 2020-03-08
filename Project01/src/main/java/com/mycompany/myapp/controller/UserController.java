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
		String username = user.getUsername();
		UserVO u = userdao.getUser(username);
		
		if(u != null && u.getPassword().equals(user.getPassword())) {
			session.setAttribute("loginUser", u);
			return "success"; 
		}
		
		return "fail";
	}
	
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String insertUser(UserVO user) {
		logger.info(user.toString());
		userdao.insertUser(user);
		
		return "redirect:/user/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "user/join";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		
		return "redirect:/user/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
	public String checkUsername(String username) {
		logger.info(username);
		String str="";
		
		UserVO u = userdao.getUser(username);
		
		if(u == null) {
			logger.info("success");
			str = "success";
		}else {
			logger.info("fail");
			str = "fail";
		}
		
		return str;
	}
	
	@RequestMapping(value = "/updateInfo", method = RequestMethod.GET)
	public String updateInfo(UserVO user) {
		
		return "user/updateInfo";
	}
	
	@RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
	public String updateInfo2(UserVO user) {
		
		userdao.updateInfo(user);
		
		return "redirect:/user/login";
	}
	
	
	
}
