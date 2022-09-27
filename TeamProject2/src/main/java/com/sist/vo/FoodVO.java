package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
NO         NUMBER         
TITLE      VARCHAR2(200)  
POSTER     VARCHAR2(1000) 
IMAGE      CLOB           
ADDR1      VARCHAR2(500)  
ADDR2      VARCHAR2(500)  
TEL        VARCHAR2(100)  
TYPE       VARCHAR2(100)  
PARKING    VARCHAR2(100)  
TIME       VARCHAR2(500)  
MENU       VARCHAR2(2000) 
SCORE      VARCHAR2(50)   

 * 
 * */
@Getter
@Setter
public class FoodVO {
	private int no;
	private String title,poster,image,addr,addr2,tel,type,parking,time,menu,score;	
}
