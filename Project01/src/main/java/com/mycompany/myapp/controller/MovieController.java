package com.mycompany.myapp.controller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.myapp.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	MovieService movieService;
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@ResponseBody
	@RequestMapping(value = "/getMovieList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String getMovieList(String keyword) {
		logger.info("Controller : getMovieList");
		String result = null;
		
		result = movieService.searchMovie(keyword);

		return result;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String title, Model model) {
		String result = null;
		
		result = movieService.searchMovie(title);
		//model.addAttribute("searchList", result);
		
		JSONParser parser = new JSONParser();
		Object obj=null;
		try {
			obj = parser.parse( result );
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONObject jsonObj = (JSONObject) obj;
		model.addAttribute("searchList", jsonObj);
	
		return "movie/searchList";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(String title, Model model) {
		String result = null;
		System.out.println("title : "+title);
		
		result = movieService.getMovie(title);
		
		JSONParser parser = new JSONParser();
		Object obj=null;
		try {
			obj = parser.parse( result );
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONObject jsonObj = (JSONObject) obj;
		model.addAttribute("movie",jsonObj);
		
		return "movie/readMovie";
	}
}