<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	 <h1 style="margin-top:-10px;" class="font_title">탈퇴하기<img src="data:image/png;base64,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"
	 style="height:50px; width:50px"><h3>*비밀번호를 입력하여 주십시오* </h3></h1>
     	<hr>
     	<div class="col-md-offset-4">
         <div class="col-md-6">
			<%-- 비밀번호 --%>
			  <h4 class="font_title">비밀번호</h4>
			  <input class="form-control text-center" type="password" size=35 placeholder="비밀번호를 입력하세요" ref=pwd v-model="pwd"><br>
			 
			  
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
			<%--탈퇴--%>
			  <div class="text-center">
			    <%-- 탈퇴 --%><input type=button class="btn btn-danger" value="탈퇴하기" v-on:click="ok()">
			    <%-- 취소--%><a href="../main/main.do"><input type=button class="btn btn-warning" value="취소"></a>
			    <br>
			    <div style="margin-top:10px;"><span id="jPrint"></span></div>
			  </div>
    </div>
    </div>
    </div>
    </div>
   <script>
   new Vue({
	   	el:'.container',
	   	data:{
	   		pwd:''
	   	},
	   	methods:{
	   		ok:function(){
	   			if(this.pwd==="")
	   			{
	   			    $('#jPrint').text("비밀번호를 입력해 주세요")
				    $('#jPrint').css("color","red")
	   				this.$refs.pwd.focus();//$('#id명').focus()
	   				return;
	   			}
	   			
	   			// 비밀번호 입력
	   			let _this=this;
	   			//axios.post() axios.get()
	   			axios.get('http://localhost:8080/web/member/member_ok.do',{
	   				params:{
	   					pwd:this.pwd
	   				}
	   			}).then(function(result){
	   				let res=result.data;
	   				if(res==='yes')
	   				{
	   					location.href="../member/Delete.do";
	   				}
	   				else
	   				{
	   					 $('#jPrint').text("비밀번호가 틀립니다")
					     $('#jPrint').css("color","red")
	   					_this.pwd="";
	   					_this.$refs.pwd.focus();
	   				}
	   			})
	   		}
	   	}
	   })
   </script>
</body>
</html>