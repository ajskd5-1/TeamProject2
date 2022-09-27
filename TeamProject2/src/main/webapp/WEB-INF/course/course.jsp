<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.images:hover{
	cursor: pointer;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <table class="table">
        <tr>
          <td width="20%">
            <h3 class="font_title">예약일</h3>
            <input type="date" size="20" name="rday" v-model="rday" style="font-size: 20px;">
          </td>
          <td width="20%">
            <h3 class="font_title">인원</h3>
            <select v-model="inwon" style="width: 100px;"  style="font-size: 20px;">
              <option value="1">1명</option>
              <option value="2">2명</option>
              <option value="3">3명</option>
              <option value="4">4명</option>
              <option value="5">5명</option>
              <option value="6">6명</option>
              <option value="7">7명</option>
              <option value="8">8명</option>
              <option value="9">9명</option>
              <option value="10">10명</option>
            </select>
          </td>
          <td width="60%">
            <h3 class="font_title">예약내역</h3><br>
            <h3>인원 : {{inwon}}명 / 예약일 : {{rday}} / 장소 : {{loc}}</h3>
          </td>
          <td width="10%" style="text-align: center">
            <br>
            <button class="btn btn-sm btn-primary" @click="save(inwon, rday, loc, addr)">코스저장</button>
          </td>
        </tr>
      </table>
    </div>
    <div class="row place">
	  <div class="row inline">
	      <select name="type" id="type" style="color: black; width: 60px; height: 30px" v-model="type">
			<option value="location">관광지</option> 
		    <option value="food">맛집</option>
		  </select>
		  <input type="text" class="input-md" style="color:black; height:30px;" name="ss" v-model="ss">
		  <input type="submit" class="btn btn-md btn-info" value="검색" v-on:click="placeFind()">
	  </div>
	  <div style="height: 20px;"></div>
	    <div class="row">
	      <div class="col-md-3" v-for="vo in search_list">
		    <div class="thumbnail">
		      <!-- <a href="#"> -->
		        <img :src="vo.poster" alt="Lights" style="width:100%" class="images" v-on:click="saveData(vo.title, vo.addr)" v-model="loc">
		        <div class="caption">
		          <p>{{vo.t }}</p>
		        </div>
		      <!-- </a> -->
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
    		ss : '',
    		ty : '',
    		inwon : 1,
    		rday : '',
    		loc : '',
    		addr : '',
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
    		},
    		placeFind:function(){
    			let _this = this;
    			if(_this.ss===""){
					alert("검색어를 입력하세요!!");
					_this.$refs.ss.focus();
					return;
				}
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
    			})
    		},
    		saveData:function(title, addr){
    			let _this = this;
    			_this.loc = title;
    			_this.addr = addr;
    		},
    		save:function(inwon, rday, loc, addr){
    			let _this = this;
    			if(_this.inwon===""){
    				alert("인원을 선택해주세요!!");
    				return;
    			}
    			if(_this.rday===""){
    				alert("예약일을 선택해주세요!!");
    				return;
    			}
    			if(_this.loc===""){
    				alert("장소를 선택해주세요!!");
    				return;
    			}
    			axios.get('http://localhost:8080/web/course/course_ok.do', {
    				params : {
    					inwon : _this.inwon,
    					rday : _this.rday,
    					place : _this.loc,
    					addr : _this.addr
    				}
    			}).then(function(result){
    				alert("코스가 저장되었습니다!!");
    				//location.href="../course/course.do";
    			})
    		}
    	}
    	
    })
  </script>
</body>
</html>