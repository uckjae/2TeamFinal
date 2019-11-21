<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행리스트</title>
    <c:import url="/common/HeadTag.jsp" />
    <style type="text/css">
    	html, body{
    	height: 100%;
    	}
    	#main{
	<!--	background-image: url("images/bg_1.jpg"); -->
		width: 100%; 
		height: 100%;
		}
    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <div class="container">
    <div id="main">
	<br><br><br><br><br>
		<h1> 마이 트레블 리스트 </h1>
		<button type="button" class="btn btn-primary">폴더 추가하기</button>
		    <!--  	<div class="col-md-12 tour-wrap">-->
    				<table class="table" style ="text-align:center;">
					    
					      <tr>
				      	  <th >NO</th>
				      	  <th >이미지</th>
				      	  <th >여행지</th>
				      	  <th >날짜</th>
					      <th >장소</th>
					      <th >참조사이트</th>
					      </tr>
					      <tr>
					        <td>1</td>
					        <td>이미지</td>
					        <td>딸기축제</td>
					        <td>2/12</td>
					        <td>성남</td>
					        <td>www.berry.com</td>
					      </tr>				  
					  </table>
    		<!-- 	</div> -->
    		   <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="images/berry.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h4>딸기축제</h4>
                    <div class="meta">2/12</div>
                    <p> 경기도 성남시 이조네 딸기밭</p>
                    <a href="#" class="reply">www.berry.com</a>
                  </div>
                </li>
    		</ul>
    		
		   </div>		
	  </div>
	
	<script src="js/main.js"></script>
</body>
</html>