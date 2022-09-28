package com.sist.dao;

import java.io.Reader;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class MemberDAO {
	@Autowired
	private MemberMapper mapper;
	
	 private static SqlSessionFactory ssf;
	   static
	   {
		   try
		   {
			   // XML 읽기 
			   // src/main/java => Config.xml  (classpath영역=>마이바티스 자동인식)
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	
	//회원가입
	public void memberJoinInsert(MemberVO vo)
	{
		mapper.memberJoinInsert(vo);
	}
	
	//아이디체크
	public int memberIdCheck(String id)
	{
		return mapper.memberIdCheck(id);
	}
	//이메일체크
	public int memberEmailCheck(String email)
	{
		return mapper.memberEmailCheck(email);
	}
	//전화번호체크
	public int memberTelCheck(String tel)
	{
		return mapper.memberEmailCheck(tel);
	}
	//로그인
	public MemberVO memberJoinInfoData(String id)
    {
    	return mapper.memberJoinInfoData(id);
    }
	// 회원정보 수정
	 public String memberGetPassword(String id)
     {
    	 return mapper.memberGetPassword(id);
     }
     
     public MemberVO memberUpdateData(String id)
     {
    	 return mapper.memberUpdateData(id);
     }
     
  	public void memberUpdate(MemberVO vo)
  	{
  		mapper.memberUpdate(vo);
  	}
  	//탈퇴하기
	
  
	
  	
  	
  	

}
