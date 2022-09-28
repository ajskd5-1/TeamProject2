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
.row {
   margin: 0px auto;
   width:100%
}
.row1{
	width: 100%;
}
.img{
	position: relative;
}
#text_box{
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
}
.col-md-4{
	padding: 5px;
}
.caption{
	margin-top: 10px;
	text-align:center;
}
.search-bar{
	display:inline-block;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container">
   <div class="img"> 
    <p> 
   	   <img src="../resources/img/food.jpg" style="width:100%; height:400px;">
   	</p>
       <h1 class="font_title" id="text_box" style="font-size:50px; color:#F3F3F3; font-weight: bold;">맛집</h1>
   </div>
   <div class="row search-bar">
        Search:<input type=text size=20 class="input-sm" :value="ss" ref="ss" v-model="ss">
        <input type=button value="검색" class="btn btn-sm btn-primary" v-on:click="foodFind()">
   </div> 
   <div id="food_list">
    <div style="height: 20px"></div>
    <div class="row" >
       <div class="col-md-4" v-for="vo in food_list">
		    <div class="thumbnail">
		      <a :href="'../food/food_detail.do?no='+vo.no">
		        <img :src="vo.poster" alt="Lights" style="width:400px;height:300px;">
		        <div class="caption">
		          <p>{{vo.title }}</p>
		        </div>
		      </a>
		    </div>
		  </div>
    </div>
    <div class="row">
       <div class="text-center">
         <input type=button class="btn btn-lg btn-warning" value="이전" @click="prev()">
          {{curpage}} page / {{totalpage}} pages
         <input type=button class="btn btn-lg btn-success" value="다음" @click="next()">
       </div>
    </div>
   </div>
    <div style="height: 20px"></div>
    <div class="row" id="food_cookie">
    
    </div>
  </div>
  <script>
    const list=new Vue({
    	el:'#food_list',
    	data:{
    		curpage:1,
    		totalpage:0,
    		food_list:[]
    	},
    	mounted:function(){
    		this.send()
    	},
    	methods:{
    		send:function(){
    			let _this=this;
        		axios.get("http://localhost:8080/web/food/food_list.do",{
        			params:{
        				page:_this.curpage
        			}
        		}).then(function(result){
        			console.log(result.data);
        			_this.food_list=result.data;
        			_this.curpage=result.data[0].curpage;
        			_this.totalpage=result.data[0].totalpage
        		})
    		},
    		foodChange:function(no){
    			this.type=no;
    			this.curpage=1;
    			this.send();
    		},
    		prev:function(){
    			this.curpage=this.curpage>1?this.curpage-1:this.curpage;
    			this.send();
    		},
    		next:function(){
    			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
    			this.send();
    		}
    	}
    })
  </script>
</body>
</html>