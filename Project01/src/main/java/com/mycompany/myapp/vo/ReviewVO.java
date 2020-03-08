package com.mycompany.myapp.vo;

import lombok.Data;

@Data
public class ReviewVO {
	int reviewNum;
	String username;
	String moviename;
	String contents;
	String movielink;
	String inputdate;

}