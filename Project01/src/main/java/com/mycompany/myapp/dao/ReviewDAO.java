package com.mycompany.myapp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.vo.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	SqlSession session;
	
	public void insertReview(ReviewVO review) {
		ReviewMapper mapper = session.getMapper(ReviewMapper.class);
		
		mapper.insertReview(review);
	}

	public ArrayList<ReviewVO> getList(String moviename) {
		ReviewMapper mapper = session.getMapper(ReviewMapper.class);
		ArrayList<ReviewVO> list;
		list = mapper.getList(moviename);
		
		System.out.println(list);
		
		return list;
	}

	public ArrayList<ReviewVO> getListByUsername(String username) {
		ReviewMapper mapper = session.getMapper(ReviewMapper.class);
		ArrayList<ReviewVO> list;
		list = mapper.getListByUsername(username);
		
		return list;
	}

	public ArrayList<ReviewVO> getAllList() {
		ReviewMapper mapper = session.getMapper(ReviewMapper.class);
		ArrayList<ReviewVO> list;
		list = mapper.getAllList();
		
		return list;
	}

	public void deleteReview(int reviewNum) {
		ReviewMapper mapper = session.getMapper(ReviewMapper.class);
		
		mapper.deleteReview(reviewNum);
	}

}
