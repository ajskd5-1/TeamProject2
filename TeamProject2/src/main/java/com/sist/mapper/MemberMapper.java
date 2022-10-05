package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
/*
 * private String id;
private String pwd;
private String name;
private String sex;
private String birthday;
private String email;
private String tel;
private String sessionid;
private Date limited;
private String role;
 */
public interface MemberMapper {

	// 회원가입
	// 아이디 중복 찾기
	@Select("SELECT COUNT(*) FROM jeju_member_1_2 WHERE id=#{id}")
	public int memberIdCheck(String id);
	// 이메일 중복 찾기
	@Select("SELECT COUNT(*) FROM jeju_member_1_2 WHERE email=#{email}")
	public int memberEmailCheck(String email);
	// 전화번호 중복 찾기
	@Select("SELECT COUNT(*) FROM jeju_member_1_2 WHERE tel=#{tel}")
	public int memberTelCheck(String tel);
	//회원가입 삽입
	@Insert("INSERT INTO jeju_member_1_2 VALUES("
			  +"#{id},#{pwd},#{name},#{sex},#{birthday},#{email},"
			  +"#{tel},'',null,'ROLE_USER')")
	public void memberJoinInsert(MemberVO vo);
	// 이름 중복 찾기
	@Select("SELECT COUNT(*) FROM jeju_member_1_2 WHERE name=#{name}")
	public int memberNameCheck(String name);
	// 로그인    ==> 복호화 ====> 자동로그인
	@Select("SELECT pwd,name,role FROM jeju_member_1_2 "
			  +"WHERE id=#{id}")
	public MemberVO memberJoinInfoData(String id);
	//회원정보 수정
	@Select("SELECT pwd FROM jeju_member_1_2 "
			+"WHERE id=#{id}")
	public String memberGetPassword(String id);
	@Select("SELECT * FROM jeju_member_1_2 "
			+"WHERE id=#{id}")
	public MemberVO memberUpdateData(String id);
	
	@Update("UPDATE jeju_member_1_2 SET "
			   +"name=#{name},sex=#{sex},email=#{email},"
			   +"tel=#{tel} "
			   +"WHERE id=#{id}")
	 public void memberUpdate(MemberVO vo);
	
	//아이디 찾기
	@Select("SELECT id FROM jeju_member_1_2 WHERE name=#{name} and tel=#{tel}")
	public String idfind(Map map);
	
	//회원정보 탈퇴
	@Delete("DELETE jeju_member_1_2 "
			   +"WHERE id=#{id}")
	 public void memberDelete(String id);

	@Select("SELECT name, email FROM jeju_member_1_2 where id=#{id}")
	public MemberVO memberEmail(String id);

	
	
	
	
	
	


	
}
