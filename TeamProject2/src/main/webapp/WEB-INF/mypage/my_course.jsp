<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="row">
      <table class="table">
        <tr>
          <td>예약일</td>
        </tr>
        <tr v-for="vo in course_list">
          <td>
            <table class="table">
              <tr>
                <td>{{vo.rday}}</td>
                <td>
                  <input type="text" class="btn btn-sm btn-info" value="상세보기" @click="detail(vo.rday)">
                </td>
              </tr>
              <tr>
                <td colspan="2">
                <table class="table">
                  <tr>
                    <td>장소</td>
                    <td>주소</td>
                    <td>인원</td>
                  </tr>
                  <tr v-for="dvo in course_detail">
                    <td>{{dvo.place}}</td>
                    <td>{{dvo.addr}}</td>
                    <td>{{dvo.inwon}}</td>
                  </tr>
                </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </div>
    <div class="detail">
    
    </div>
  </div>
  <script>
    new Vue({
    	el : '.container',
    	data : {
    		rday : '',
    		course_list:[],
    		course_detail:[]
    	},
    	mounted : function(){
    		let _this = this;
    		axios.get('http://localhost:8080/web/mypage/my_course_vue.do',{
    			params:{
    				
    			}
    		}).then(function(result){
    			console.log(result);
    			_this.course_list = result.data;
    		})
    		
    	},
    	methods : {
    		detail:function(rday){
    			let _this = this;
    			alert(rday);
    			axios.get('http://localhost:8080/web/mypage/my_course_detail.do', {
    				params : {
    					rday : rday
    				}
    			}).then(function(result){
    				console.log(result);
    				_this.course_detail = result.data;
    			})
    		}
    	}
    })
  </script>
</body>
</html>