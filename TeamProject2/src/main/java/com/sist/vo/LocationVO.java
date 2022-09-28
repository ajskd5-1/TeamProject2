package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * TITLE      VARCHAR2(300)  
POSTER     VARCHAR2(300)  
CONTENT    VARCHAR2(500)  
PRICE      VARCHAR2(50)   
PRICE2     NUMBER(38)     
IMAGE      VARCHAR2(4000) 
INFO       VARCHAR2(4000) 
NO         NUMBER         
ADDR       VARCHAR2(200)  
TYPE       VARCHAR2(200)
 * 
 * */
@Getter
@Setter
public class LocationVO {
	private int no,price2; 
	private String title,poster,content,price,image,info,addr,type;
}
