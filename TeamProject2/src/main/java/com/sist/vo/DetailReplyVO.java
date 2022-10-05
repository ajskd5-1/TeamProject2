package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/*
 * NO      NOT NULL NUMBER       
TYPE             NUMBER       
PNO              NUMBER       
CONTENT          CLOB         
REGDATE          DATE         
NAME             VARCHAR2(34) 
ID               VARCHAR2(20)
 * 
 * */
@Getter
@Setter
public class DetailReplyVO {
	private int no,type,pno;
	private String id,name,content,dbday;
	private Date regdate;
}
