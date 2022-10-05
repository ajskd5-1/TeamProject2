package com.sist.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.vo.DetailReplyVO;

import oracle.jdbc.OracleTypes;
 
@Repository
public class DetailReplyDAO {
	private Connection conn;
	private CallableStatement cs;
	private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
	
	public DetailReplyDAO()
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
	public void DetailreplyInsert(DetailReplyVO vo)
	{
		try
		{
			System.out.println(vo.getType());
			System.out.println(vo.getPno());
			System.out.println(vo.getContent());
			System.out.println(vo.getName());
			System.out.println(vo.getId());
			System.out.println("==========================");
			getConnection();
			String sql="{CALL replyInsert1_2(?,?,?,?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getType());
			cs.setInt(2, vo.getPno());
			cs.setString(3, vo.getContent());
			cs.setString(4, vo.getName());
			cs.setString(5, vo.getId());
			cs.executeQuery();
		}catch(Exception ex)
		{
			System.out.println("DetailreplyInsert: 에러");
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	// 댓글 select
	public List<DetailReplyVO> breplyListData(DetailReplyVO vo)
	{
		List<DetailReplyVO> list=new ArrayList<DetailReplyVO>();
		try
		{
			getConnection();
			String sql="{CALL replyListData1_2(?,?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getPno());
			cs.setInt(2, vo.getType());
			cs.registerOutParameter(3, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs=(ResultSet)cs.getObject(3);
			
			
			while(rs.next())
			{
				DetailReplyVO rvo=new DetailReplyVO();
				rvo.setNo(rs.getInt(1));
				rvo.setPno(rs.getInt(2));
				rvo.setType(rs.getInt(3));
				rvo.setId(rs.getString(4));
				rvo.setName(rs.getString(5));
				rvo.setContent(rs.getString(6));
				rvo.setDbday(rs.getString(7));
				list.add(rvo);
			}
			rs.close();
		}catch(Exception ex)
		{
			System.out.println();
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return list;
	}
	// 댓글 update 
	public void DetailreplyUpdate(DetailReplyVO vo)
	{
		try
		{
			System.out.println("dao update");
			System.out.println(vo.getNo());
			System.out.println(vo.getContent());
			getConnection();
			String sql="{CALL replyUpdate1_2(?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getNo());
			cs.setString(2, vo.getContent());
			cs.executeQuery();
		}catch(Exception ex)
		{
			System.out.println("DetailreplyUpdate :에러");
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	// 댓글 delete
	public void DetailreplyDelete(int no)
	{
		try
		{
			getConnection();
			String sql="{CALL replyDelete1_2(?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, no);
			cs.executeQuery();
		}catch(Exception ex)
		{
			System.out.println("DetailreplyDelete: 에러");
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	
	
}

