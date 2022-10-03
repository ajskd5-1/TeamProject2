<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
<%--- 아이디 확인 --%>
    $('#myBtn').click(function(){
    	let id=$('#id').val();
    	if(id.trim()==="")
    	{
    		$('#id').focus();
    		$('#iPrint').text("아이디를 입력하세요")
    	    $('#iPrint').css("color","black");
    		return;
    	}
    	
    	$.ajax({
    		type:'post',
    		url:'../member/idcheck.do',
    		data:{"id":id},
    		success:function(result)
    		{
    			let res=result.trim();
    			if(res==='YES')
    			{
    				$('#iPrint').text("사용 가능한 아이디입니다");
    				$('#iPrint').css("color","blue");
    				//$('#id').attr('readonly',true);
    				$('#icheck').text("확인");
    				$('#icheck').css("color","orange");
    			}
    			else
    			{
    				
    				$('#iPrint').text("사용 중인 아이디입니다");
    				$('#iPrint').css("color","red");
    				$('#id').var("");
    				$('#id').focus();
    			}
    		}
    	})	
  })
<%--- 비밀번호 확인 --%>
    $('#pwdBtn').click(function(){
    	let pwd_1=$('#pwd_1').val();
      	let pwd=$('#pwd').val();
    	if(pwd_1.trim()==="")
    	{
    		$('#pwd_1').focus();
    		$('#pwdPrint').text("비밀번호를 입력해 주세요");
			$('#pwdPrint').css("color","black");
    		return;
    	}
    	if(pwd.trim()==="")
    	{
    		$('#pwd').focus();
    		$('#pwdPrint').text("비밀번호를 다시 한번 입력해 주세요");
			$('#pwdPrint').css("color","black");
    		return;
    	}
    	if(pwd_1!=pwd)
    	{
    		$('#pwdPrint').text("비밀번호가 틀립니다");
			$('#pwdPrint').css("color","red");
			$('#pwd').var("");
			//$('#pwd2').focus();
    	}
    	else
    	{

    		$('#pwdPrint').text("비밀번호가 같습니다");
			$('#pwdPrint').css("color","blue");
			//$('#pwd').attr('readonly',true);
			$('#pcheck').text("확인");
			$('#pcheck').css("color","orange");
    		
    	}
    	
  })
<%--- 이메일 확인 --%>
    $('#emailBtn').click(function(){
    	let email=$('#email').val();
    	if(email.trim()==="")
    	{
    		$('#email').focus();
    		$('#ePrint').text("이메일를 입력하세요")
    	    $('#ePrint').css("color","black");
    		return;
    	}
    	
    	$.ajax({
    		type:'post',
    		url:'../member/emailcheck.do',
    		data:{"email":email},
    		success:function(result)
    		{
    			let res=result.trim();
    			if(res==='YES')
    			{
    				$('#ePrint').text("사용 가능한 이메일입니다");
    				$('#ePrint').css("color","blue");
    				//$('#email').attr('readonly',true);
    				$('#echeck').text("확인");
    				$('#echeck').css("color","orange");
    			}
    			else
    			{
    				
    				$('#ePrint').text("사용이 불가능한 이메일입니다");
    				$('#ePrint').css("color","red");
    				$('#email').var("");
    				$('#email').focus();
    			}
    		}
    	})	
  })
<%--- 전화번호 확인 --%>
    $('#telBtn').click(function(){
    	let tel=$('#tel').val();
    	var test="-";
    	if(tel.trim()==="")
    	{
    		$('#tel').focus();
    		$('#tPrint').text("전화번호를 입력하세요")
    	    $('#tPrint').css("color","black");
    		return;
    	}
    	if(tel.indexOf(test)===-1)
    	{
    		$('#tPrint').text("-를 포함해서 입력해 주세요")
    	    $('#tPrint').css("color","red");
    		return;
    	}
    	
    	$.ajax({
    		type:'post',
    		url:'../member/telcheck.do',
    		data:{"tel":tel},
    		success:function(result)
    		{
    			let res=result.trim();
    			if(res==='YES')
    			{
    				$('#tPrint').text("사용 가능한 전화번호입니다");
    				$('#tPrint').css("color","blue");
    				//$('#tel').attr('readonly',true);
    				$('#tcheck').text("확인");
    				$('#tcheck').css("color","orange");
    			}
    			else
    			{
    				
    				$('#tPrint').text("사용이 불가능한 전화번호입니다");
    				$('#tPrint').css("color","red");
    				$('#tel').var("");
    				$('#tel').focus();
    			}
    		}
    	})	
  })
<%-- joinBtn --%>
    $('#joinBtn').click(function(){
    	if($("#icheck").text() == '확인' && $("#pcheck").text() == '확인' && $("#echeck").text() == '확인' && $("#tcheck").text() == '확인')
    	{   
    		if($("#id").val() == "" || $("#pwd_1").val() == "" || $("#pwd").val() == "" || $("#name").val() == "" || $("#sex").val() != "남성" && $("#sex").val() != "여성" ||
        			$("#birthday").val() == "" || $("#email").val() == "" || $("#tel").val() == "" )
    		{
    			$('#jPrint').text("모든 값을 입력해주세요");
    			$('#jPrint').css("color","red");
    			return;
    		}
    		else
    		{
    			
    			$('#join_frm').submit();
    			return;
    			
    		}	
    	}
    	
    	else if($("#icheck").text() != '확인' || $("#pcheck").text() != '확인' || $("#echeck").text() != '확인' || $("#tcheck").text() != '확인')
    	{
    			$('#jPrint').text("모든 확인을 확인해주세요");
    			$('#jPrint').css("color","red");
        		return;

    	}

    })
     

})<%-- 마무리 태그 --%>

</script>
<style type="text/css">
	hr {
		
		height: 1px;
		background-color:orange;
	}
</style>
</head>
<body>
<%-- body 시작 --%><div class="container">
    <div class="row">
	 <h1 style="margin-top:-10px;" class="font_title">회원가입<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABmJLR0QA/wD/AP+gvaeTAAACi0lEQVRYhe2WQUhUURSGvzNv0DJRB8GiqEULKbCMQNq0StLJIimISCSIWgRJ6KgI2UKKwEwskgxqkatEwYUWmGgUFGGWaemicCe4qMzJUYJ05p0WPUHLec57M+DGf/fuOff/v3sf3HthXWsscTOpv8p/Xk3Zcrip58bS8dyh8pOqchbYDWQCGcCQJiX7R/fWB1fy8rgBkIiOquiZZeHvK66rSidQDGQDmSK8NTzhY9HCXQMcut37DkjvDxRlA+QOBUoVri6DRFtnQun5w/ubv9t5ed0ACGgfdCt6PHekok3D2mKVTGBQVa99yrvTE4uXK4C/EPJC0VIW5DlQpoY5jnfDZ7vtTiiAehcGCXubP+Y1DQPDbn3iUl+lf7I3ULB9TcIB3lSc2hivh6NzQO+SzG/fCUQLUT2ASBaQivAV5QvwBA23S/Xct4QCqCI0+S6iWgtss0bbpGqmBEAbMx4CF6z2WZB65oINUkc4bgCt96VjmI8RKYoFdgn1M5KN03J5OmTXZnsQad3WFLz61AofA62JGUDEz7x2aAeGawBSfzUAB62vHJCbzkC0kAmfbW/UX6C3fDmIjsCyFXQD+cCm2AAACDEf2SlXZn+sVLTZAT33TzgI6iB4UWkkGaXRitEBhIL/mSjG2eoXddQ5AOxwERRNu9wAJFJZbgAmEpevrh4kvfGmonQCIDLuHEClFYi4j5cHeDyNFkqXYwCpDo4h3HcZ38dCuBY1W4ApPOYjxwAAzKbUAK8dhldBpIQkox3Yh2iZBELT0Zpju4y8ZhvIkVVaRy2/AZRiBB8i5VIZvGc3KY7reEUAgD0IH8BzSSqnB1bzjvdBshlIA50CmUR4hUmXVP986cR3XWuqP+ws4oLLZjWJAAAAAElFTkSuQmCC"></h1>
     	<hr>
     	<div class="col-md-offset-4">
     	<form method="post" action="../member/join_ok.do" name="join_frm" id="join_frm">
         <div class="col-md-6">
			<%-- 아이디 --%>
			  <h4 class="font_title">아이디&nbsp;&nbsp;<%-- 아이디 중복체크--%><button type="button" class="btn btn-success" id=myBtn name=myBtn>아이디중복체크</button>&nbsp;<span id="icheck"></span></h4>
			  <input class="form-control text-center" type="text" id=id name="id" size=35 placeholder="아이디를 입력하세요"><div style="margin-top:10px;"><span id="iPrint"></span></div><br>
			  <br>
			<%-- 비밀번호 --%>
			  <h4 class="font_title">비밀번호</h4>
			  <input class="form-control text-center" type="password" id=pwd_1 name="pwd_1" size=35 placeholder="비밀번호를 입력하세요"><br>
			<%-- 비밀번호 재확인 --%>
			  <h4 class="font_title">비밀번호 재확인&nbsp;&nbsp;<%-- 비밀번호 확인--%><button type="button" class="btn btn-success" id=pwdBtn>비밀번호확인</button>&nbsp;<span id="pcheck"></span></h4>
			  <input class="form-control text-center" type="password" id=pwd name="pwd" size=35 placeholder="비밀번호를 다시 입력하세요"><div style="margin-top:10px;"><span id="pwdPrint"></span></div><br>
			  <br>
			<%-- 이름 --%>
			  <h4 class="font_title">이름</h4>
			  <input class="form-control text-center" type="text" id=name name="name" size=35 placeholder="이름을 입력하세요"><br>
			<%-- 성별--%>
			  <h4 class="font_title">성별</h4>
			  <select class="form-control text-center" aria-label="Default select example" id=sex name="sex">
			  	<option selected id=sex name="sex">--- 성별을 선택해 주세요 ---</option>
				  <option value="남성" id=sex name="sex">남성</option>
				  <option value="여성" id=sex name="sex">여성</option>
              </select><br>
            <%-- 생년월일 --%>
			  <h4 class="font_title">생년월일</h4>
			  <input class="form-control text-center" type="date" id=birthday name="birthday" size=35 placeholder="생년월일을 입력하세요"><br>
			<%-- 이메일 --%>
			  <h4 class="font_title">이메일&nbsp;&nbsp;<%-- 이메일 중복확인 --%><button type="button" class="btn btn-success" id=emailBtn>이메일중복체크</button>&nbsp;<span id="echeck"></span></h4>
			  <input class="form-control text-center" type="text" id=email name="email" size=35 placeholder="이메일을 입력하세요"><div style="margin-top:10px;"><span id="ePrint"></span></div><br>
			  <br>
			<%-- 전화번호 --%>
			  <h4 class="font_title">전화번호&nbsp;&nbsp;<%-- 전화번호 확인 --%><button type="button" class="btn btn-success" id=telBtn>전화번호확인</button>&nbsp;<span id="tcheck"></span></h4>
			  <input class="form-control text-center" type="text" id=tel name="tel" size=35 placeholder="-를 사용하여 전화번호를 입력하세요"><div style="margin-top:10px;"><span id="tPrint"></span></div><br>
			  <br>
			  
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
			<%--회원가입/취소--%>
			  <div class="text-center">
			    <%-- 회원가입 --%><input type=submit id=joinBtn class="btn btn-primary" value="회원가입">
			    <%-- 취소 --%><a href="../main/main.do"><button type=button class="btn btn-warning">취소</button></a>
			    <br>
			    <div style="margin-top:10px;"><span id="jPrint" id=""></span></div>
			  </div>
			 </div>
			</form>
   </div>
   </div>
   </div>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>      
  		  <%-- 중복체크 --%>

</body>
</html>




