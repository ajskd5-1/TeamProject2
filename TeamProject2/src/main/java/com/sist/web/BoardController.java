package com.sist.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.vo.*;
import com.sist.dao.BoardReplyDAO;
import com.sist.service.BoardService;

@Controller
public class BoardController {
	@Autowired
    private BoardService service;
	
	@Autowired
	private BoardReplyDAO dao;
	
	@GetMapping("board/list.do")
	public String board_list()
	{
		return "board/list";
	}
	@GetMapping("board/insert.do")
	public String board_insert()
	{
		return "board/insert";
	}
	@PostMapping("board/find.do")
    public String board_find(String[] fd,String ss,Model model)
    {
    	Map map=new HashMap();
    	map.put("fsArr", fd);
    	map.put("ss", ss);
    	List<BoardVO> list=service.boardFindData(map);
    	model.addAttribute("list", list);
    	model.addAttribute("ss",ss);
    	return "board/find";
    }
    @PostMapping("board/insert_ok.do")
    public String board_insert_ok(BoardVO vo,HttpServletRequest request)
    {
    	HttpSession session=request.getSession();
    	String name=(String)session.getAttribute("id");
    	List<MultipartFile> list=vo.getFiles();
    	String path="c:\\download\\";
    	try {
    		if(list==null) // 업로드된 파일이 없는 경우 
    		{
    			vo.setFilename("");
    			vo.setFilesize("");
    			vo.setFilecount(0);
    			vo.setName(name);
    		}
    		else // 업로드가 된 상태 
			{
				String temp1="";
				String temp2="";
				for(MultipartFile mf:list)
				{
					String filename=mf.getOriginalFilename(); // 사용자가 선택한 파일명
					mf.transferTo(new File(path+filename));// 업로드 
					//업로드가 된거를 가지구
					temp1+=filename+",";
					File f=new File(path+filename);
					long len=f.length();
					temp2+=len+",";
				}
				temp1=temp1.substring(0,temp1.lastIndexOf(","));
				temp2=temp2.substring(0,temp2.lastIndexOf(","));
				vo.setFilename(temp1);
				vo.setFilesize(temp2);
				vo.setFilecount(list.size());
				vo.setName(name);
			}
    		service.boardInsert(vo);
    	}catch(Exception ex)
    	{
    		System.out.println("board_insert_ok : error");
    		ex.printStackTrace();
    	}
    	return "redirect:list.do";
    	
    }
    
    @GetMapping("board/detail.do")
    public String databoard_detail(int no,Model model)
	{
		//DAO연동 ==> 다운로드 
		BoardVO vo=service.boardDetailData(no);
		model.addAttribute("vo",vo);
		
		if(vo.getFilecount()!=0) //업로드된 파일이 있는 경우에만 전송 
		{
			List<String> fList=new ArrayList<String>();
			List<String> sList=new ArrayList<String>();
			StringTokenizer st=new StringTokenizer(vo.getFilename(),",");
			while(st.hasMoreTokens())
			{
				fList.add(st.nextToken());
			}
			st=new StringTokenizer(vo.getFilesize(),",");
			while(st.hasMoreTokens())
			{
				sList.add(st.nextToken());
			}
			model.addAttribute("fList",fList);
			model.addAttribute("sList",sList);
		}
		List<BoardVO> plist=service.boardPrevData(no);
		model.addAttribute("plist",plist);
		List<BoardVO> nlist=service.boardNextData(no);
		model.addAttribute("nlist",nlist);
		
		BoardReplyVO rvo=new BoardReplyVO();
		rvo.setCno(no);
		List<BoardReplyVO> rlist=dao.breplyListData(rvo);
		model.addAttribute("rlist",rlist);
		
		return "board/detail";
	}
    @GetMapping("board/download.do")
	public void databoard_download(String fn,HttpServletResponse response)
	{
		try
		{
			File file=new File("c:\\download\\"+fn);
			response.setContentLength((int)file.length());
			response.setHeader("Content-Disposition", "attachment;filename="
								+URLEncoder.encode(fn,"UTF-8"));
			//다운로드 창을 보여준다 
			BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file)); //서버 
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream()); //클라이언트 
			byte[] buffer=new byte[1024];
			int i=0; //읽은 바이트 수 
			while((i=bis.read(buffer,0,1024))!=-1) //-1은 (EOF) 파일이 끝날 때 까지 읽으라는거임 
			{
				bos.write(buffer,0,i);
			}
			bis.close();
			bis.close();
			
		}catch(Exception ex) {}
	}
    @GetMapping("board/update.do")
	public String board_update(int no,Model model)
	{	
		model.addAttribute("no",no);
		return "board/update";
	}
    @PostMapping("board/update_ok.do")
    public String board_update_ok(BoardVO vo)
    {
    	service.boardUpdate(vo);
    	return "redirect:list.do";
    }
    @GetMapping("board/delete.do")
    public String board_delete(int no)
    {
    	service.boardDelete(no);
    	return "redirect:list.do";
    }
    // 관리자-공지사항    
    @GetMapping("board/notice.do")
    public String board_notice()
    {
    	return "board/notice";
    }
    @PostMapping("board/notice_ok.do")
    public String board_notice_ok(BoardVO vo,HttpServletRequest request)
    {
    	HttpSession session=request.getSession();
    	String name=(String)session.getAttribute("id");
    	List<MultipartFile> list=vo.getFiles();
    	String path="c:\\download\\";
    	try {
    		if(list==null) // 업로드된 파일이 없는 경우 
    		{
    			vo.setFilename("");
    			vo.setFilesize("");
    			vo.setFilecount(0);
    			vo.setName(name);
    		}
    		else // 업로드가 된 상태 
			{
				String temp1="";
				String temp2="";
				for(MultipartFile mf:list)
				{
					String filename=mf.getOriginalFilename(); // 사용자가 선택한 파일명
					mf.transferTo(new File(path+filename));// 업로드 
					//업로드가 된거를 가지구
					temp1+=filename+",";
					File f=new File(path+filename);
					long len=f.length();
					temp2+=len+",";
				}
				temp1=temp1.substring(0,temp1.lastIndexOf(","));
				temp2=temp2.substring(0,temp2.lastIndexOf(","));
				vo.setFilename(temp1);
				vo.setFilesize(temp2);
				vo.setFilecount(list.size());
				vo.setName(name);
			}
    		service.boardNoticeInsert(vo);
    	}catch(Exception ex)
    	{
    		System.out.println("board_notice_ok 에러");
    		ex.printStackTrace();
    	}
    	return "redirect:list.do";
    	
    }
    
 // 채팅
    @GetMapping("chat/chat.do")
    public String board_chat()
    {
    	return "site/chat/chat";
    }

}
