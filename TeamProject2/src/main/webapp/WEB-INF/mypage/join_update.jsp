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
		background-color:#353535;
	}
</style>
</head>
<body>
<%-- body 시작 --%><div class="container">
    <div class="row">
	 <h1 style="margin-top:-10px;" class="font_title">회원수정<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABmJLR0QA/wD/AP+gvaeTAAAEsklEQVR4nO2aXYhVVRTHf/fah96shog+INJC7WG0qYZ8uAlKRD5EQVE9mPRgJUEg6oNWPigiaFASFDa9VDCROU8RRB+U00thKBTS+GIGmdnH5Ndkk2gz14d1Nmftw7n3nnPP2nfuOPOHBefO7P1fa+199jp777VgGtOYxjSmMEoTpHcu0A3cpuQWoAuYAVwLlKPfi4ChiTHTDlcCjwL9wHGglkO2TIC9ZqgAm4Dfyee0lkk7+8uAX2jdcS3dbba9MFYBF7BxftItg0eA/7FzflItgxuAYWydd3IUeKZ9rrSG1wjjvJaH2uZNTswEzhB+AIaYuP1LQzxGeOed3GtldNmKCFhiyNUMy62ILrMiAu5K/H4XeBG4M5LbgTmRXI1sd2cjM/ovcAo4CfwMHAEOAN8Ba4ANCe5eQ7vNcIT4Fb0A3GTEWwb24S+Bg0bcphghNnDQmPtB/AE4ZsxvgvPEBr5szF1C9gGOf9SK2DIIXq6erXduNeAz9XuWFbHlAGgcDsD5QwDOYAMwHICzIwOfhg5Slp9Xh1sTOjoOoY27KoQOyz21NirUXt1ch1UMqBrxdLrOuthD/GruDqhnt9KzJ6Ce3NA3vSHv7xYqPccD6smNc8SGVQLqqSg95ywIrWLAr+p5oRFnGhap56MB9eTGe8Qz8wlhNlhl4FOl550AOlrGPcAYsXF9AXT0Kf4x4O4AOgrhFXwD5xtyL8Af4O2G3GYoA3uJjdxlyK1nfy/hzjCF8QCxoefxg1ar6MHPMt1vwBkUXxAbuw//niAvrgD2K77PC1vXBtwBnCU2+s0CXG8pnn+QWDAp8BT+yW1NCxzrEhwrzKxrE/TsjQOrc/R9PuoTIqC2DTfiz+A4sJXGx9gSsC3RrxZxFUUVuU0+DQwgZTpBMY/0tNb7SB4xiZnAB3X6zCtoy3341/Y14A8CD8Ji0p2pAT/iZ3d6kZvkeu0XF7AjzXknAwV4m2K5UjQIvI6/ruvJeNR2UP2tSC7wowa6ToTcUV2nnv8E1gKPIyn0ejgTtVkb9UnjyosVyO4xDf8V4K2LLuAF/FdaR/G5SBwYVf8fRUro5qh2u9T/hyLOrow2VJGyPIcK8BX+7I9geK1WQqrC+vEdc/IhUgCZFTOiPkkeN1DLqP81qSLOnUCKLx30IIwgsaEwbgZeQjJBzdb2AbKltXujts34DiNpcz0QznnX5kv8g1MFiQmFnC8jh54B/IRoFhkD3gauSeGtADvIXmE2Djyr+ldJL9FZX8RZjflIvZ5F8eNvwNOK++EWeDdmcL6G3B32tOr0LGAl8knK8gnLI7r4cUvOvq+qvo2+806+yet4N/I6/m3stJPNKTo3ZuzbT7zuG828k7PA0rwD8Fcgx508kaLzyQz9PiZOvCYDnpnzAF8HHoBh/APO9cjevFGfb4lzDkGdB3gj8ADUgJ1K384mbb9Hqsog25ovvMnRd3uhRM/OkgbtfiKuOAs+8w4l/ISntaRVkQ3WaeucyTrzJjs8kAvJDcAhbGv/k7PvsDSl3SFkMmYjhZRtc77TsJo2vPadjEZng0ve+R6msPPgp8W0nOISXvMax/Ad3w88hwTGKYEdSAFGH5KGN8VFTxuROw+EFnwAAAAASUVORK5CYII="
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




