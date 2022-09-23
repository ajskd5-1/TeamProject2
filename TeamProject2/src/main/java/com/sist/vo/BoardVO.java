package com.sist.vo;
/*
NO         NOT NULL NUMBER         
NAME       NOT NULL VARCHAR2(34)   
SUBJECT    NOT NULL VARCHAR2(1000) 
CONTENT    NOT NULL CLOB           
REGDATE             DATE           
HIT                 NUMBER         
FILENAME            VARCHAR2(2000) 
FILESIZE            VARCHAR2(1000) 
FILECOUNT           NUMBER         
RECOUNT             NUMBER         
GROUP_ID            NUMBER         
GROUP_STEP          NUMBER         
GROUP_TAB           NUMBER         
ROOT                NUMBER         
DEPTH               NUMBER         
JEADMIN               NUMBER 
 */
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class BoardVO {
	int no,hit,filecount,recount,group_id,group_step,group_tab,root,depth,jeadmin;
	String name,subject,content,filename,filesize,dbday;
	Date regdate;
}
