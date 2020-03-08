package com.mycompany.myapp.dao;

import java.util.ArrayList;

import com.mycompany.myapp.vo.ReviewVO;

public interface ReviewMapper {

	void insertReview(ReviewVO review);

	ArrayList<ReviewVO> getList(String moviename);

	ArrayList<ReviewVO> getListByUsername(String username);

	ArrayList<ReviewVO> getAllList();

	void deleteReview(int reviewNum);


}
