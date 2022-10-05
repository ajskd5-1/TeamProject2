<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<%-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
--%>
<%-- 
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()==="")
		{
			$('#id').focus();
			$('#jPrint').text("아이디를 입력해 주세요");
			$('#jPrint').css("color","red");
			return;
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			$('#jPrint').text("비밀번호를 입력해 주세요");
			$('#jPrint').css("color","red");
			return;
		}
		let ck=$("#ck").is(":checked");
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{"id":id,"pwd":pwd,"ck":ck},
			success:function(result)
			{
				let res=result.trim();
				if(res==='NOID')
				{
					$('#jPrint').text("아이디가 존재하지 않습니다!!")
					$('#jPrint').css("color","red")
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
				else if(res==='NOPWD')
				{
					$('#jPrint').text("비밀번호가 틀립니다!!")
					$('#jPrint').css("color","red")
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href="../main/main.do";
				}
			}
		})
	})
})
</script>
--%>
<style type="text/css">
	hr {
		
		height: 1px;
		background-color:#DF4D4D;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<%-- body 시작 --%><div class="container">
    <div class="row">
	 <h1 style="margin-top:-10px;" class="font_title">로그인<img src="data:image/png;base64,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"
	 style="height:35px; width:35px"></h1>
     	<hr>
     	<div class="col-md-offset-4">
         <div class="col-md-6">
			<%-- 아이디 --%>
			  <h4 class="font_title">아이디</h4>
			  <input class="form-control text-center" type="text" size=35 placeholder="아이디를 입력하세요" ref="id" v-model="id"><div style="margin-top:10px;"></div><br>
			<%-- 비밀번호 --%>
			  <h4 class="font_title">비밀번호</h4>
			  <input class="form-control text-center" type="password" size=35 placeholder="비밀번호를 입력하세요" ref="pwd" v-model="pwd"><br>
			<%-- 아이디 저장 --%>
			<div class="alert alert-warning">
			<h4 class="font_title">아이디저장</h4>
  				<input type=checkbox id="ck" style="margin-left:90px; margin-top:-27px">
			</div>
			 
			  
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
			<%--로그인/취소--%>
			  <div class="text-center">
			    <%-- 로그인--%><input type=submit id=loginBtn class="btn btn-danger" value="로그인" @click="login()">
			    <%-- 회원가입--%><a href="../member/join.do"><input type=submit id=joinBtn class="btn btn-primary" value="회원가입"></a>
			    <%-- 취소 --%><a href="../main/main.do"><button type=button class="btn btn-success">취소</button></a>
			
			    <hr style="height:0px; background-color:#353535;">
			    <%-- 아이디 찾기--%><a href="../member/idfind.do"><input type=submit id=idsearch class="btn btn-warning" value="아이디 찾기"></a>
			    <!--  <%-- 비밀번호 찾기--%><input type=submit id=idsearch class="btn btn-warning" value="비밀번호찾기">-->
			    <br>
			    <div style="margin-top:10px;"><span id="jPrint" ref="jPrint"></span></div>
			  </div>
    </div>
    </div>
    </div>
    </div>
   <script>
   new Vue({
 	  el:'.container',  //el (element = 태그) 
 	  data:{
 		  id:'${id}',
 		  pwd:'',
 		  res:''
 	  },
 	  // 사용자 정의 함수 => 자바스크립트 문법 적용 
 	  methods:{
 		  // login(){}
 		  login:function(){
 			  let ck = $('#ck').is(":checked");
 			  //alert(ck);
 			  if(this.id.trim()==="")
 			  {
 				  this.$refs.id.focus();
 				 $('#jPrint').text("아이디를 입력해 주세요")
			     $('#jPrint').css("color","red")
 				  return;
 			  }
 			  if(this.pwd.trim()==="")
 			  {
 				 $('#jPrint').text("비밀번호를 입력해 주세요")
			     $('#jPrint').css("color","red")
 				  this.$refs.pwd.focus();
 				  return;
 			  }
 			  // 데이터 전송 (스프링 서버) => 전송 / 응답 
 			  let _this=this;
 			  axios.get("http://localhost:8080/web/member/login_vue.do",{
 				  params:{
 					  id:_this.id,
 					  pwd:_this.pwd,
 					  ck : ck
 				  }
 			  }).then(function(result){ // callback (시스템에 의해 자동 호출 success:function(result))
 				  _this.res=result.data;
 			  
 				  if(_this.res==='NOID')
 				  {
 					 $('#jPrint').text("ID가 존재하지 않습니다")
 				     $('#jPrint').css("color","red")
 					  _this.id="";
 					  _this.pwd="";
 					  _this.$refs.id.focus();
 				  }
 				  else if(_this.res==='NOPWD')
 				  {
 					 $('#jPrint').text("비밀번호가 틀립니다")
 				     $('#jPrint').css("color","red")
 					  _this.pwd="";
 					  _this.$refs.pwd.focus();
 				  }
 				  else
 				  {
 					  location.href="../main/main.do";
 				  }
 			  })
 		  }
 	  }
   })
   </script>
</body>
</html>