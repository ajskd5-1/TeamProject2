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
</head>
<body>
  <div class="container">
    <h1 class="font_title">실시간 뉴스 : {{ss}}</h1>
    <div class="row inline">
      <input type="text" class="input-sm" v-model="ss">
      <input type="submit" class="btn btn-sm btn-info" value="검색" @click="search()">
    </div>
    
    <div style="height: 20px;"></div>
    <div class="row">
      <table class="table">
        <tr v-for="vo in news_list">
          <td>
            <table class="table">
              <tr>
                <td><a :href="vo.link" target="_blank" style="color: orange">{{vo.title}}</a></td>
              </tr>
              <tr>
                <td><a :href="vo.link" target="_blank">{{vo.description}}</a></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </div>
  </div>
  <script>
    new Vue({
    	el : '.container',
    	data : {
    		ss : '제주도',
    		news_list : []
    	},
    	mounted : function(){
    		this.find();
    	},
    	methods : {
    		find : function(){
    			let _this = this;
    			axios.get('http://localhost:8080/web/news/news_vue.do', {
    				params : {
    					ss : _this.ss
    				}
    			}).then(function(result){
    				_this.news_list = result.data;
    			})
    			
    		},
    		search:function(){
    			let _this = this;
    			if(_this.ss===""){
					alert("검색어를 입력하세요!!");
					_this.$refs.ss.focus();
					return;
				}
    			_this.find();
    		}
    	}
    })
  </script>
</body>
</html>