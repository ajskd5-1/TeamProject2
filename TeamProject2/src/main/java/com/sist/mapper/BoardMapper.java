package com.sist.mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
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
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.BoardVO;

public interface BoardMapper {
	@Select("SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,recount,jeadmin,num "
			  +"FROM (SELECT no,subject,name,regdate,hit,recount,jeadmin,rownum as num "
			  +"FROM (SELECT no,subject,name,regdate,hit,recount,jeadmin "
			  +"FROM jeju_board_1_2 ORDER BY jeadmin DESC, no DESC)) "
			  +"WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM jeju_board_1_2")
	public int boardTotalpage();
	
	//<select id="boardFindData" resultType="com.sist.vo.BoardVO" parameterType="hashmap">
	public List<BoardVO> boardFindData(Map map);
	
	@Insert("INSERT INTO jeju_board_1_2(no,name,subject,content,regdate,"
			+ "filename,filesize,filecount,group_id) VALUES("
			+"(SELECT NVL(MAX(no)+1,1) FROM jeju_board_1_2),#{name},#{subject},#{content},"
			+ "SYSDATE,#{filename},#{filesize},#{filecount},(SELECT NVL(MAX(group_id)+1,1) FROM jeju_board_1_2))")
	public void boardInsert(BoardVO vo);
	@Insert("INSERT INTO jeju_board_1_2(no,name,subject,content,regdate,"
			+ "group_id) VALUES("
			+"(SELECT NVL(MAX(no)+1,1) FROM jeju_board_1_2),#{name},#{subject},#{content},"
			+ "SYSDATE,(SELECT NVL(MAX(group_id)+1,1) FROM jeju_board_1_2))")
	public void boardInsert2(BoardVO vo);
	
	@Update("UPDATE jeju_board_1_2 SET "
			+ "hit=hit+1 "
			+ "WHERE no=#{no}")
	public void hitIncrement(int no);
	
	@Select("SELECT no,subject,name,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,recount,jeadmin,filename,filesize,filecount "
			  +"FROM jeju_board_1_2 "
			  + "WHERE no=#{no}")
	public BoardVO boardDetailData(int no);
	
	@Update("UPDATE jeju_board_1_2 SET "
			+ "subject=#{subject},content=#{content} "
			+ "WHERE no=#{no}")
	public void boardUpdate(BoardVO vo);
	
	@Delete("DELETE FROM jeju_board_1_2 "
			+ "WHERE no=#{no}")
	public void boardDelete(int no);
		
}
