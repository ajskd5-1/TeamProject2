<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	hr {
		
		height: 1px;
		background-color:#B2CCFF;
	}
</style>
</head>
<body>
<%-- body 시작 --%><div class="container">
    <div class="row">
	 <h1 style="margin-top:-10px;" class="font_title">회원수정<img src="data:image/png;base64,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"
	 style="height: 45px; width: 45px;"></h1>
     	<hr>
     	<div class="col-md-offset-4">
     	 <form method="post" action="../member/join_update_ok.do">
         <div class="col-md-6">
			<%-- 아이디 --%>
			  <h4 class="font_title">아이디</h4>
			  <input class="form-control text-center" type="text" id=id name="id" size=35 readonly="readonly" value="${vo.id }"><br>
			  <br>
			<%-- 이름 --%>
			  <h4 class="font_title">이름</h4>
			  <input class="form-control text-center" type="text" id=name name="name" size=35 value="${vo.name }"><br>
			<%-- 성별--%>
			  <h4 class="font_title">성별</h4>
			  <select class="form-control text-center" aria-label="Default select example" id=sex name="sex">
			  	<option selected value="${vo.sex }">--- 성별을 선택해 주세요 ---</option>
				  <option value="남성" ${vo.sex=='남성'?"selected":"" }>남성</option>
				  <option value="여성" ${vo.sex=='여성'?"selected":"" }>여성</option>
              </select><br>
			<%-- 이메일 --%>
			  <h4 class="font_title">이메일</h4>
			  <input class="form-control text-center" type="text" id=email name="email" size=35 value="${vo.email }">
			  <br>
			<%-- 전화번호 --%>
			  <h4 class="font_title">전화번호</h4>
			  <input class="form-control text-center" type="text" id=tel name="tel" size=35 value="${vo.tel }">
			  <br>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
<%-------------------------------------------------------------------------------------------------------------------------------%>
			<%--회원수정/취소--%>
			  <div class="text-center">
			    <%-- 회원수정 --%><input type=submit value="회원수정" class="btn btn-primary">
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




