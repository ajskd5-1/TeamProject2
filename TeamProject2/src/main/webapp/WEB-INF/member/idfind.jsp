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
		background-color:#1F51B7;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<%-- body 시작 --%><div class="container">
    <div class="row">
	 <h1 style="margin-top:-10px;" class="font_title">아이디 찾기<img src="data:image/png;base64,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"
	 style="height:50px; width:50px"></h1>
     	<hr>
     	<div class="col-md-offset-4">
         <div class="col-md-6">
			<%-- 이름 --%>
			  <h4 class="font_title">이름</h4>
			  <input class="form-control text-center" type="text" size=35 placeholder="이름을 입력하세요" ref=name v-model="name"><br>
			<%-- 비밀번호 --%>
			  <h4 class="font_title">전화번호</h4>
			  <input class="form-control text-center" type="text" size=35 placeholder="전화번호를 입력하세요" ref=tel v-model="tel"><br>
			  
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
			<%--확인--%>
			  <div class="text-center">
			    <%-- 확인 --%><input type=button class="btn btn-primary" value="아이디 찾기" v-on:click="idfind(name, tel)">
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
	   		name:'',
	   		tel:'',
	   		id:'${id}'
	   	},
	   	methods:{
	   		idfind:function(name, tel){
	   			if(this.name==="")
	   			{
	   			    $('#jPrint').text("이름을 입력해 주세요")
				    $('#jPrint').css("color","red")
	   				this.$refs.name.focus();//$('#id명').focus()
	   				return;
	   			}
	   			if(this.tel==="")
	   			{
	   			    $('#jPrint').text("전화번호를 입력하여 주세요")
				    $('#jPrint').css("color","red")
	   				this.$refs.tel.focus();//$('#id명').focus()
	   				return;
	   			}
	   			// 비밀번호 입력
	   			let _this=this;
	   			//axios.post() axios.get()
	   			axios.get('http://localhost:8080/web/member/idfind_ok.do',{
	   				params:{
	   					name:_this.name,
	   					tel:_this.tel
	   				}
	   			}).then(function(result){
	   				let res=result.data;
	   				if(res==='NOID')
	   				{
	   					$('#jPrint').text("전화번호가 틀립니다")
					    $('#jPrint').css("color","red")
	   					_this.tel="";
	   					_this.$refs.tel.focus();
	   				}
	   				else
	   				{
	   					console.log(res);
	   				 	$('#jPrint').text("아이디는:" +" "+ res + " "+"입니다");
	   				    $('#jPrint').css("color","blue")
	   				}
	   			})
	   		}
	   	}
	   })
   </script>
</body>
</html>