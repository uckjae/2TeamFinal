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
	<br><br><br><br>
		<h1><i class="flaticon-world mr-3"></i> 나의 여행 리스트 폴더</h1>
		
		<button type="button" class="btn btn-primary mt-1 mb-3">폴더 추가하기</button>

    				<table class="table" style ="text-align:center;">				    
					      <tr>					      
				      	  <th class="pl-5" >NO</th>
				      	  <th >폴더 제목</th>
				      	  <th></th>
					      </tr>
					      <tr>					      	
					        <td class="pl-5">1</td>
					       <td> <a href="MTList.do">가족과 함께</a></td>
					        <td><button type="button" class="btn btn-primary mr-3">수정</button> 
					       <button type="button" class="btn btn-secondary">삭제</button></td>					       
					      </tr>
					      <tr>
					        <td class="pl-5">2</td>
					       <td> <a href="MTList.do">친구와 함께</a></td>
					       <td><button type="button" class="btn btn-primary mr-3">수정</button> 
					       <button type="button" class="btn btn-secondary">삭제</button></td>					       
					      </tr>
					      			  				  
					  </table>					   

    			
    		
    		  		
		   </div>		
	  </div>
	
	<script src="js/main.js"></script>
</body>
</html>