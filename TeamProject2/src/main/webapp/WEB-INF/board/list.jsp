<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div.container.boardContainer{
  width: 960px;
  height: 1024px;
  margin: 0px auto;
}
.Search {
  border: none;
}
.Search tr{
  background-color: white;
}
.aa{
  border: none;
}
th{
  background-color: inherit;
  border: none;
  color: #333333;
}
td{
  border: none;
}
.table.table-hover{
  border-color: white;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#findBtn').click(function(){
		let find=$('#find').val();
		if(find.trim()=="")
		{
			$('#find').focus();
			return;
		}
		else if($('#N').is(":checked")==false && $('#S').is(":checked")==false && $('#C').is(":checked")==false)
		{
			alert("체크박스를 선택해주세요.")
			$('#find').focus();
			return;
		}
		$('#frm').submit();
	})
	$('#insertBtn').click(function(){
		var id='<%=(String)session.getAttribute("id")%>';
		if(id==="null")
		{
			alert("로그인 시 작성 가능합니다.")
			return;
		}
		else
		{
			location.href="../board/insert.do";
		}
	})
})
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container boardContainer">
      <h1 class="text-center">자유게시판</h1>
      <br><br><br>
      <form action="find.do" method="post" id="frm">
      <table class="Search">
        <tr>
            <td width="60%" class="aa" style="text-align: left;">
              <a href="#" class="btn btn-Lg btn-primary" id="insertBtn">게시물 작성</a>
            </td>
            <td width="5%" class="aa"><input type="checkbox" name=fd value="N" id="N">이름</td>
            <td width="5%" class="aa"><input type="checkbox" name=fd value="S" id="S">제목</td>
            <td width="5%" class="aa"><input type="checkbox" name=fd value="C" id="C">내용</td>
            <td width="15%" class="aa"><input type=text name=ss size=40 class="input-sm" id="find"></td>
            <td width="10%" class="aa" style="text-align: center;"><input type=button class="btn btn-sm btn-info" id="findBtn" value="검색"></td>
        </tr>
      </table>
      </form>
      <hr>
      <br><br>
      <table class="table table-hover">
       <thead>
        <tr>
          <th width=10% class="text-center">게시물번호</th>
          <th width=45% class="text-center">제목(댓글수)</th>
          <th width=15% class="text-center">작성자</th>
          <th width=20% class="text-center">작성일</th>
          <th width=10% class="text-center">조회수</th>
        </tr>
       </thead>
       <tbody>
        <tr v-for="vo in board_list">
          <td width=10% class="text-center">{{vo.no}}</td>
          <td v-if="vo.jeadmin!==0" width=45%>
            <img src="https://img.icons8.com/tiny-color/16/000000/commercial.png">
            <a :href="'../board/detail.do?no='+vo.no"><span style="color: green; font-weight: bold;">&nbsp;(공지사항)&nbsp;{{vo.subject}}</span>
            <span style="color: gray;"> ({{vo.recount}})</span></a>
          </td>
          <td v-if="vo.jeadmin==0" width=45%>
            <a :href="'../board/detail.do?no='+vo.no">{{vo.subject}}<span style="color: gray;"> ({{vo.recount}})</span></a>
          </td>
          <td width=15% class="text-center">{{vo.name}}</td>
          <td width=20% class="text-center">{{vo.dbday}}</td>
          <td width=10% class="text-center">{{vo.hit}}</td>
        </tr>
       </tbody>
      </table>
        <div class="text-center">
           <input type=button value="이전" class="btn btn-sm" @click="prev()">
           {{curpage}} page / {{totalpage}} pages
           <input type=button value="다음" class="btn btn-sm" @click="next()">
        </div>
    </div>
  </div>
  <script>
    const list=new Vue({
    	el:'.boardContainer',
    	data:{
    		board_list:[],
    		curpage:1,
    		totalpage:0
    	},
    	mounted:function(){
	    	this.list();
    	},
    	methods:{
    		list:function(){
    			let _this=this;
    	    	axios.get("http://localhost:8080/web/board/list_vue.do",{
    	    		params:{
    	    			page:_this.curpage
    	    		}
    	    	}).then(function(result){
    	    		console.log(result.data);
    	    		_this.board_list=result.data;
    	    		_this.curpage=result.data[0].curpage;
    	    		_this.totalpage=result.data[0].totalpage;
    	    	})
    		},
    		prev:function(){
    			this.curpage=this.curpage>1?this.curpage-1:this.curpage;
    			this.list();
    		},
    		next:function(){
    			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
    			this.list();
    		}
    	}
	})
  </script>
</body>
</html>
<!-- 확성기 링크
https://img.icons8.com/cotton/64/000000/commercial--v1.png
https://img.icons8.com/external-anggara-flat-anggara-putra/32/000000/external-megaphone-ecommerce-interaface-anggara-flat-anggara-putra.png
https://img.icons8.com/tiny-color/16/000000/commercial.png
 -->