<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
   width: 100%;
}
.row {
   margin: 0px auto;
   width:50%;
   text-align: center;
}
.table{
	width: 100%;
}
.img{
	margin-left: 50%;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;
$(function(){
	$('.up').click(function(){
		$('.updates').hide();
		let no=$(this).attr("data-no");
		if(u==0)
		{
			$('#u'+no).show();
			$(this).text("취소");
			u=1;
		}
		else
		{
			$('#u'+no).hide();
			$(this).text("수정");
			u=0;
		}
	})
})
</script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
   <div class="container">
     <div class="row" id="location_detail"> 
       <table class="table">
        <tr>
          <td width=30% class="text-center" rowspan="6">
            <img src="${vo.poster }" style="width: 100%">
          </td>
          <td width=70%>
            <h3>${vo.title }</h3>
          </td>
        </tr>
        <tr>
          <td width=30%>${vo.content }</td>
        </tr>
        <tr>
          <td width=30%>${vo.addr }</td>
        </tr>
        <tr>
          <td width=30%>${vo.price }</td>
        </tr>
	  </table>
     </div>
     <div style="height: 20px"></div>
     <div class="row" id="location_reply">
       <table class="table">
        <tr>
          <td>
           <c:forEach var="rvo" items="${list }">
             <table class="table">
               <tr>
                 <td class="text-left">
                                        ◑<span style="color:orange">${rvo.name }</span>&nbsp;(${rvo.dbday })
                 </td>
                 <td class="text-right">
                   <c:if test="${sessionScope.id==rvo.id }">
                     <span class="btn btn-xs btn-info up" data-no="${rvo.no }">수정</span>
                     <a href="../reply/delete.do?no=${rvo.no }&pno=${vo.no }" class="btn btn-xs btn-success">삭제</a>
                   </c:if>
                 </td>
               </tr>
               <tr>
                 <td colspan="2" valign="top">
                  <pre style="white-space: pre-wrap;background-color: white;border:none">${rvo.content }</pre>
                 </td>
               </tr>
               <tr style="display:none" id="u${rvo.no }" class="updates"> 
		          <td>
		           <form method="post" action="../reply/update.do">
		            <textarea rows="5" cols="80" style="float: left" name="content">${rvo.content }</textarea>
		            <input type=hidden name="no" value="${rvo.no }">
		            <input type="hidden" name="pno" value="${no }">
		            <input type="hidden" name="type" value="1">
		            <input type=submit value="댓글수정" class="btn btn-sm btn-danger" style="height: 105px;float: left">
		           </form>
		          </td>
		        </tr>
             </table>
           </c:forEach>
          </td>
        </tr>
      </table>
      <c:if test="${sessionScope.id!=null }"><%--로그인시에만  --%>
	      <table class="table">
	        <tr>
	          <td>
	           <form method="post" action="../reply/insert.do">
	            <textarea rows="5" cols="93" style="float: left" name="content"></textarea>
	            <input type="hidden" name="pno" value="${no }">
	            <input type="hidden" name="type" value="1">
	            <input type=submit value="댓글쓰기" class="btn btn-sm btn-danger" style="height: 105px;float: left">
	           </form>
	          </td>
	        </tr>
	      </table>
      </c:if>
     </div>
   </div> 
</body>
</html>