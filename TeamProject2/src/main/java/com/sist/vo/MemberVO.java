package com.sist.vo;
import java.util.Date;

/*
 *  ID        NOT NULL VARCHAR2(20)  
	PWD       NOT NULL VARCHAR2(100) 
	NAME      NOT NULL VARCHAR2(34)  
	SEX                VARCHAR2(10)  
	BIRTHDAY  NOT NULL VARCHAR2(30)  
	EMAIL              VARCHAR2(100) 
	TEL                VARCHAR2(20)  
	SESSIONID          VARCHAR2(100) 
	LIMITED            DATE          
	ROLE               VARCHAR2(10)  
 */
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String sex;
	private String birthday;
	private String email;
	private String tel;
	private String role;
	private String msg;


}
