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
		background-color:#F2CB61;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$('#idsearch').on('click',function(){
		//1. 이름 입력여부 
		let name=$('#name').val();
		if(name.trim()==="") //!==  ES6
		{
			$('#name').focus();
			$('#jPrint').text("이름을 입력하세요");
			return; // 종료
		}
		//2. 전화번호 입력 여부 
		let tel=$('#tel').val();
		if(tel.trim()==="")
		{
			$('#tel').focus()
			$('#jPrint').text("전화번호를 입력하세요");
			return;
		}
		//3. ajax => 이름 => 전화번호 전송 ====> 결과값을 출력 ==> axios.get() , axios.post()
		$.ajax({
			type:'post',
			url:'telfind_ok.do',
			data:{"name":name,"tel":tel},//?tel=1111
			success:function(result)
			{
				$('#jPrint').text(result);
			}
		})
		//4. 출력된 결과값을 읽어 온다 
	})
})
</script>
</head>
<body>
<%-- body 시작 --%><div class="container">
    <div class="row">
	 <h1 style="margin-top:-10px;" class="font_title">아이디 찾기<img src="data:image/png;base64,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"
	 style="height:50px; width:50px"></h1>
     	<hr>
     	<div class="col-md-offset-4">
         <div class="col-md-6">
			<%-- 아이디 --%>
			  <h4 class="font_title">이름</h4>
			  <input class="form-control text-center" type="text" id=name name="name" size=35 placeholder="이름을 입력하세요"><div style="margin-top:10px;"><span id="iPrint"></span></div><br>
			<%-- 비밀번호 --%>
			  <h4 class="font_title">전화번호</h4>
			  <input class="form-control text-center" type="text" id=tel name="tel" size=35 placeholder="전화번호를 입력하세요"><br>
			  
	<%--로그인/취소--%>
			  <div class="text-center">
			    <%-- 아이디 찾기--%><input type=submit id=idsearch name="idsearch" class="btn btn-success" value="아이디 찾기">
			    <%-- 취소 --%><a href="../member/login.do"><button type=button class="btn btn-primary">취소</button></a>
			    <br>
			    <div style="margin-top:10px;"><span id="jPrint" id=""></span></div>
			  </div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>