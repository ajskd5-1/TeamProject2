<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
    <!-- <div class="row">
      <form class="inline text-center" method="post" action="../search/search.do">
      <select name="type" id="type" style="color: black; width: 60px; height: 30px">
	    <option value="no">선택</option>
		<option value="location">관광지</option>
	    <option value="food">맛집</option>
	    <option value="board">게시판</option>
	  </select>
	  <input type="text" class="input-md" style="color:black; height:30px;" name="ss">
	  <input type="submit" class="btn btn-md btn-info" value="검색">
    </form>
    </div> -->
    <div style="height: 20px;"></div>
    <div class="row">
      <h1>{{ty}} : ${ss }</h1>
      <div class="col-md-3" v-for="vo in search_list">
	    <div class="thumbnail">
	      <a href="#">
	        <img :src="vo.poster" alt="Lights" style="width:100%">
	        <div class="caption">
	          <p>{{vo.title }}</p>
	        </div>
	      </a>
	    </div>
	  </div>
    </div>
    <div style="height: 20px;"></div>
    <div class="row">
      <div class="text-center">
          <input type="button" class="btn btn-lg btn-warning" value="이전" @click="prev()">
            {{curpage}} page / {{totalpage}} pages
          <input type="button" class="btn btn-lg btn-success" value="다음" @click="next()">
        </div>
      </div>
    </div>
  </div>
  <script>
    new Vue({
    	el : '.container',
    	data : {
    		curpage : 1,
    		totalpage : 0,
    		type : '${type}',
    		ss : '${ss}',
    		ty : '',
    		search_list : []
    	},
    	mounted : function(){
    		this.send();
    	},
    	methods : {
    		send : function(){
    			let _this = this;
    			axios.get('http://localhost:8080/web/search/search_vue.do', {
    				params : {
    					page : _this.curpage,
    					type : _this.type,
    					ss : _this.ss
    				}
    			}).then(function(result){
    				_this.search_list = result.data;
    				_this.curpage = _this.search_list[0].curpage;
    				_this.totalpage = _this.search_list[0].totalpage;
    				_this.ty = _this.search_list[0].ty;
    				console.log(_this.curpage);
    			})
    		},
    		prev:function(){
    			let _this = this;
    			_this.curpage = _this.curpage>1?_this.curpage-1:_this.curpage;
    			_this.send();
    		},
    		next:function(){
    			let _this = this;
    			_this.curpage = _this.curpage<_this.totalpage?_this.curpage+1:_this.curpage;
    			_this.send();
    		}
    	}
    	
    })
  </script>
</body>
</html>