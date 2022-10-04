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
  height: 2000px;
  margin: 0px auto;
}
.table {
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
  background-color: white;
  border: none;
}
.table.table-hover{
  border-color: white;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let u=0;
$(function(){
	$('#insertBtn').click(function(){
		var id='<%=(String)session.getAttribute("id")%>';
		if(id==="null")
		{
			alert("로그인 후 작성 가능합니다.")
			return;
		}
		else
		{
			$('#frmin').submit();
		}
	})
	$('#updateBtn').click(function(){
		let upmsg=$('#upmsg').val();
		if(upmsg.trim()==="")
		{
			$('#upmsg').focus();
			return;
		}
		else
		{
			$('#frmup').submit();
		}
	})
	$('.up').click(function(){
		$('.breplyupdate').hide();
		let no=$(this).attr("data-no");
		if(u==0)
		{
			$('#br'+no).show();
			$(this).text("취소");
			u=1;
		}
		else
		{
			$('#br'+no).hide();
			$(this).text("수정");
			u=0;
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
  	  <c:if test="${vo.jeadmin==0 }">
       <h3 class="text-left font_title">제목 : &nbsp;&nbsp;${vo.subject }</h3>
      </c:if>
  	  <c:if test="${vo.jeadmin>0 }">
       <h3 class="text-left font_title"><img src="https://img.icons8.com/cotton/64/000000/commercial--v1.png">
        &nbsp;&nbsp;${vo.subject }</h3>
      </c:if>
      <br>
      <table class="table">
        <tr>
         <th width=20% class="text-center">번호</th>
         <td width=30% class="text-left">${vo.no }</td>
         <th width=20% class="text-center">작성일</th>
         <td width=30% class="text-left">${vo.dbday }</td>
        </tr>
        <tr>
         <th width=20% class="text-center">작성자</th>
         <td width=30% class="text-left">${vo.name }</td>
         <th width=20% class="text-center">조회수</th>
         <td width=30% class="text-left">${vo.hit }</td>
        </tr>
        <c:if test="${vo.filecount!=0 }">
        	<tr>
        		<th width=20% class="text-center">첨부파일</th>
        		<td colspan="3">
        			<ul>
        				<c:forEach var="fname" items="${fList }" varStatus="s">
        					<li><a href="download.do?fn=${fname }">${fname }</a>(${sList[s.index]}Bytes)</li>
        				</c:forEach>
        			</ul>
        		</td>
        	</tr>
        </c:if>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">
           <pre style="white-space: pre-wrap;border:none;background-color: white;">${vo.content }</pre>
          </td>
        </tr>
        
        <tr>
          <td colspan="4" class="text-right">
           <c:if test="${sessionScope.id==vo.name }">
            <a href="update.do?no=${vo.no }" class="btn btn-sm btn-info">수정</a>
            <a href="delete.do?no=${vo.no }" class="btn btn-sm btn-warning">삭제</a>
           </c:if>
            <a href="list.do" class="btn btn-sm btn-success">목록</a>
          </td>
        </tr>
      </table>
 	  <div class="text-left">
	       <div class="prev">
	         <c:forEach items="${plist }" var="plist" end="0">
	         	  이전글 &nbsp;&nbsp; <a href="../board/detail.do?no=${plist.no }">${plist.subject }_${plist.no }</a>
	         </c:forEach>
	       </div>
        <hr>
	       <div class="next" style="background-color: inherit;">
	         <c:forEach items="${nlist }" var="nlist" end="0">
	         	  다음글 &nbsp;&nbsp; <a href="../board/detail.do?no=${nlist.no }">${nlist.subject }_${nlist.no }</a>
	         </c:forEach>
	       </div>
      </div>
    <div class="row row1">
      <div id="comments">
        <h3 class="font_title">&nbsp;게시판 댓글&nbsp;<img src="https://img.icons8.com/color/48/000000/enter-key.png"/></h3><br>
        <ul>
         <c:forEach var="rvo" items="${rlist }">
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By ${rvo.name }
                </address>
                ${rvo.dbday }
              </header>
              <div class="comcont">
                <p style="color: #161392; font-size:13pt;">${rvo.msg }</p>
              </div>
              <div class="text-right">
                   <c:if test="${sessionScope.id==rvo.id }">
                     <span class="btn btn-sm up" data-no="${rvo.no }">수정</span>
                     <a href="../breply/delete.do?no=${rvo.no }&cno=${vo.no}" class="btn btn-sm">삭제</a>
                   </c:if>
                 <div class="breplyupdate" id="br${rvo.no }" style="margin-top: 10px; display: none"  >
                     <form action="../breply/update.do" method="post" id="frmup">
			          <div class="block clear">
			            <textarea name="msg" id="upmsg" cols="25" rows="3">${rvo.msg }</textarea>
			            <input type="hidden" name="no" value="${rvo.no }">
			            <input type="hidden" name="cno" value="${vo.no }">
			          </div>
			        </form>
			      <input type="submit" name="submit" id="updateBtn" class="btn btn-sm" value="수정하기">
			     </div>
              </div>
            </article>
          </li>
         </c:forEach>
        </ul>
        <form action="../breply/insert.do" method="post" id="frmin">
          <div class="block clear">
            <textarea name="msg" id="msg" cols="25" rows="8"></textarea>
            <input type="hidden" name="cno" value="${vo.no }">
          </div>
        </form>
          <div>
            <input type="submit" name="submit" id="insertBtn" value="댓글 작성">
          </div>
      </div>
    </div>
    </div>
</body>
</html>
