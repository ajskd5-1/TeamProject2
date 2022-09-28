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
		background-color:#CEF279;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<%-- body 시작 --%><div class="container">
    <div class="row">
	 <h1 style="margin-top:-10px;" class="font_title">비밀번호 확인<img src="data:image/png;base64,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"
	 style="height:50px; width:50px"></h1>
     	<hr>
     	<div class="col-md-offset-4">
         <div class="col-md-6">
			<%-- 비밀번호 --%>
			  <h4 class="font_title">비밀번호</h4>
			  <input class="form-control text-center" type="password" size=35 placeholder="비밀번호를 입력하세요" ref=pwd v-model="pwd"><br>
			 
			  
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
			<%--확인--%>
			  <div class="text-center">
			    <%-- 확인 --%><input type=button class="btn btn-success" value="확인" v-on:click="ok()">
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
	   			axios.get('http://localhost:8080/web/member/join_before_ok.do',{
	   				params:{
	   					pwd:this.pwd
	   				}
	   			}).then(function(result){
	   				let res=result.data;
	   				if(res==='yes')
	   				{
	   					location.href="../member/join_update.do";
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