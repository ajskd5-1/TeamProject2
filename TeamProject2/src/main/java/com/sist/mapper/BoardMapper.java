package com.sist.mapper;
import java.util.List;
import java.util.Map;

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

import com.sist.vo.BoardVO;

public interface BoardMapper {
	@Select("SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,recount,jeadmin,num "
			  +"FROM (SELECT no,subject,name,regdate,hit,recount,jeadmin,rownum as num "
			  +"FROM (SELECT no,subject,name,regdate,hit,recount,jeadmin "
			  +"FROM jeju_board_1_2 ORDER BY jeadmin DESC, no DESC)) "
			  +"WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/2.0) FROM jeju_board_1_2")
	public int boardTotalpage();
		
}
