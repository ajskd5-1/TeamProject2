<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
.row1{
   margin: 0px auto;
   width:100%;
}
.col-sm-8{
	margin-left: 300px;
}
</style>
</head>
<body>
  <div class="container">
   <div style="height: 20px"></div>
     <%-- 이미지 5개 --%>
      <table class="table1">
        <tr>
          <c:forTokens items="${vo.image }" delims="^" var="image">
            <td>
              <img src="${image }" style="width: 100%">
            </td>
          </c:forTokens>
        </tr>
      </table>
   <div class="row1">
	   <div class="col-sm-8">
	     <%-- 정보 --%>
	     <table class="table">
	       <tr>
	         <td colspan="2"><h3>${vo.title }&nbsp;<span style="color:orange">${vo.score }</span></h3></td>
	       </tr>
	       <tr>
	         <td width="30%" style="color:gray">주소</td>
	         <td width="70%">${vo.addr }</td>
	       </tr>
	       <tr>
	         <td width="30%" style="color:gray">전화번호</td>
	         <td width="70%">${vo.tel }</td>
	       </tr>
	       <tr>
	         <td width="30%" style="color:gray">음식종류</td>
	         <td width="70%">${vo.type }</td>
	       </tr>
	       <tr>
	         <td width="30%" style="color:gray">영업시간</td>
	         <td width="70%">${vo.time }</td>
	       </tr>
	       <tr>
	         <td width="30%" style="color:gray">주차</td>
	         <td width="70%">${vo.parking }</td>
	       </tr>
	       <c:if test="${vo.menu!='no' }">
		       <tr>
		         <td width="30%" style="color:gray">메뉴</td>
		         <td width="70%">
		           <ul>
		             <c:forTokens items="${vo.menu }" delims="원" var="m">
		               <li>${m }원</li>
		             </c:forTokens>
		           </ul>
		         </td>
		       </tr> 
	       </c:if>
	       <tr>
	         <td colspan="2" class="text-right">
	           <input type=button value="목록" class="btn btn-xs btn-warning"
	            onclick="javascript:history.back()"
	           > 
	         </td>
	       </tr>
	     </table>
	   </div>
	  </div>
	</div>
  <script>
  new Vue({
	  	el:'.container',
	  	data:{
	  		no:${no},
	  		vo:{}
	  	},
	  	mounted:function(){ 
	  		axios.get("http://localhost:8080/web/food/food_detail.do",{
	  			params:{
	  				no:this.no
	  			}
	  		}).then(result=>{ 
	  			console.log(result.data);
	  			this.vo=result.data;  
	  		})
	  	}
	  }) 
  </script>
</body>
</html>





