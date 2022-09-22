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
}
.row {
   margin: 0px auto;
   width:100%;
   text-align: center;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
   <div class="container">
     <div class="row" id="location_detail">
       <table class="table">
         <tr>
           <td class="text-center">
            <img :src="location_detail.poster" style="width: 400px;height: 400px">
           </td> 
         </tr>
         <tr>
           <td><h3>{{location_detail.title}}</h3></td>
         </tr>
         <tr>
           <td><h4>{{location_detail.addr}}</h4></td>
         </tr>
         <tr>
           <td><h4>{{location_detail.content}}</h4></td>
         </tr>
         <tr>
           <td class="text-right">
             <input type=button class="btn btn-sm btn-primary" value="목록"
              @click="javascript:history.back()"
             >
           </td>
         </tr>
       </table>
     </div>
     <div style="height: 20px"></div>
     <div class="row" id="location_reply">
     
     </div>
   </div>
   <script>
    new Vue({
    	el:'#location_detail',
    	data:{
    		no:${no},
    		location_detail:{}
    	},
    	mounted:function(){
    		let _this=this;
    		axios.get("http://localhost:8080/web/location/location_detail.do",{
    			params:{
    				no:_this.no,
    			}
    		}).then(function(result){
    			_this.location_detail=result.data
    		})
    	}  
    })  
   </script>
</body>
</html>