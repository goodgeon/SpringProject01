package com.mycompany.myapp.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.myapp.dao.ReviewDAO;
import com.mycompany.myapp.service.MovieService;
import com.mycompany.myapp.vo.MovieVO;
import com.mycompany.myapp.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewDAO dao;
	
	@Autowired
	MovieService movieService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@ResponseBody
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public String insertReview(ReviewVO review) {
		review.setMoviename(review.getMoviename().replaceAll("<(/)?([a-zA-Z]*)(\\\\\\\\s[a-zA-Z]*=[^>]*)?(\\\\\\\\s)*(/)?>", ""));
		
		dao.insertReview(review);

		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	public ArrayList<ReviewVO> getList(String moviename, Model model) {
		ArrayList<ReviewVO> list;
		
		moviename = moviename.replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		
		list = dao.getList(moviename);
		model.addAttribute("reviewList", list);
		return list;
	}
	
	@RequestMapping(value = "/myreview", method = RequestMethod.GET)
	public String myReview(String username, Model model) {
		ArrayList<ReviewVO> rlist;
		
		rlist = dao.getListByUsername(username);
		
		
		model.addAttribute("myreview", rlist);
		
		return "review/myreview";
	}
	
	@RequestMapping(value = "/allreview", method = RequestMethod.GET)
	public String allReview(Model model) {
		ArrayList<ReviewVO> rlist;
		
		rlist = dao.getAllList();
		
		model.addAttribute("reviews", rlist);
		
		return "review/allreview";
	}
	@ResponseBody
	@RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
	public String deleteReview(int reviewNum) {
		dao.deleteReview(reviewNum);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getMyList", method = RequestMethod.GET)
	public ArrayList<ReviewVO> getMyList(String username, Model model) {
		ArrayList<ReviewVO> list;
		
		list = dao.getListByUsername(username);

		return list;
	}

}
