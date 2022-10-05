package com.sist.dao;
import com.sist.mapper.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;

@Repository
public class MemberDAO {
	
	@Autowired
	private MemberMapper mapper;
	
	
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
		return mapper.memberTelCheck(tel);
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
	
  	
  	//아이디 찾기
	public String idfind(Map map)
	{
		return mapper.idfind(map);
	}
	public int memberNameCheck(String name)
	{
		return mapper.memberNameCheck(name);
	}
	
  	//탈퇴하기
 	/*
 	 * @Select("SELECT pwd FROM jeju_member_1_2 "
			+"WHERE id=#{id}")
		public String memberGetPassword_delete(String id);
		@Delete("DELETE jeju_member_1_2 "
				   +"WHERE id=#{id}")
		 public void memberDelete(MemberVO vo);
 	 */
	 public void memberDelete(String id)
	 {
		 mapper.memberDelete(id);
	 }
	 
	 // 이메일 출력
	 public MemberVO memberEmail(String id) {
		 return mapper.memberEmail(id);
	 }
}