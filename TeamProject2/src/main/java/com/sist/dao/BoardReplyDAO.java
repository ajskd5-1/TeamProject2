package com.sist.dao;

import java.util.*;

import org.springframework.stereotype.Repository;

import com.sist.vo.*;

import oracle.jdbc.OracleTypes;

import java.sql.*;
@Repository
public class BoardReplyDAO {
	private Connection conn;
	private CallableStatement cs;
	private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
	
	public BoardReplyDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	
	public void disConnection()
	{
		try
		{
			if(cs!=null) cs.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	//  댓글 insert
	public void breplyInsert(BoardReplyVO vo)
	{
		try
		{
			getConnection();
			String sql="{CALL JEJU_breplyInsert(?,?,?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getCno());
			cs.setString(2, vo.getId());
			cs.setString(3, vo.getName());
			cs.setString(4, vo.getMsg());
			cs.executeQuery();
		}catch(Exception ex)
		{
			System.out.println("breplyListData :에러");
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	// 댓글 select
	public List<BoardReplyVO> breplyListData(BoardReplyVO vo)
	{
		List<BoardReplyVO> list=new ArrayList<BoardReplyVO>();
		try
		{
			getConnection();
			String sql="{CALL JEJU_breplyListData(?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getCno());
			cs.registerOutParameter(2, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs=(ResultSet)cs.getObject(2);
			while(rs.next())
			{
				BoardReplyVO rvo=new BoardReplyVO();
				rvo.setNo(rs.getInt(1));
				rvo.setCno(rs.getInt(2));
				rvo.setId(rs.getString(3));
				rvo.setName(rs.getString(4));
				rvo.setMsg(rs.getString(5));
				rvo.setDbday(rs.getString(6));
				list.add(rvo);
			}
			rs.close();
		}catch(Exception ex)
		{
			System.out.println("breplyListData :에러");
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return list;
	}
	// 댓글 update 
	public void breplyUpdate(BoardReplyVO vo)
	{
		try
		{
			getConnection();
			String sql="{CALL JEJU_breplyUpdate(?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getNo());
			cs.setString(2, vo.getMsg());
			cs.executeQuery();
		}catch(Exception ex)
		{
			System.out.println("breplyUpdate :에러");
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	// 댓글 delete
	public void breplyDelete(int no)
	{
		try
		{
			getConnection();
			String sql="{CALL JEJU_breplyDelete(?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, no);
			cs.executeQuery();
			
		}catch(Exception ex)
		{
			System.out.println("breplyDelete :에러");
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	
	
}
