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
		<h1><i class="flaticon-world"></i> &nbsp; &nbsp;나의 여행 리스트 폴더</h1>
		<button type="button" class="btn btn-primary">폴더 추가하기</button>
		    <!--  	<div class="col-md-12 tour-wrap">-->
    				<table class="table" style ="text-align:center;">
					    
					      <tr>
					      <th><i class="flaticon-folder"></i></th>
				      	  <th >NO</th>
				      	  <th >폴더 제목</th>
				      	  <th> </th>
					      </tr>
					      <tr>
					      	<td> </td>
					        <td>1</td>
					       <td> <a href="MTList.do">가족과 함께</a></td>
					       <td><button type="button" class="btn btn-secondary">삭제</button></td>
					      </tr>				  
					  </table>					   
    		<!-- 	</div> -->
    		 
    		   <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="images/berry.jpg" alt="trip image">
                  </div>
                  <div class="comment-body">
                    <h4>가족과 함께</h4>
                    
                    <p> <button type="button" class="btn btn-secondary">삭제</button>                    
                    </p>
                  </div>
                </li>
    		</ul> 
    		
    		    <div class="col-md-12 tour-wrap">
    				<table class="table" style ="text-align:center;">
					    <tbody>
					      <tr>
				      	  <th scope="row">1</th>
					        <td>
					        	<a href="MTList.do">가족과 함께</a>
					        </td>
					        <td><button type="button" class="btn btn-secondary">삭제</button>
					        </td>
					        <td></td>
					      </tr><!-- END TR-->

					      <tr>
				      	  <th scope="row">Departure Time</th>
					        <td>
					        	<p>Please arrive by 10:20 AM for a prompt departure at 10:50 AM</p>
					        </td>
					        <td></td>
					      </tr><!-- END TR-->

					      <tr>
				      	  <th scope="row">Return Time</th>
					        <td>
					        	<p>Approximately 8:30 PM</p>
					        </td>
					        <td></td>
					      </tr><!-- END TR-->

					      <tr>
				      	  <th scope="row">Included</th>
					        <td class="d-flex">
					        	<ul>
					        		<li>Airfare</li>
					        		<li>5 star accomodation</li>
					        	</ul>
					        	<ul>
					        		<li>Local transportation</li>
					        		<li>Private Professional Guide</li>
					        	</ul>
					        </td>
					        <td></td>
					      </tr><!-- END TR-->


					      
					    </tbody>
					  </table>
    			</div>
    		
    		  		
		   </div>		
	  </div>
	
	<script src="js/main.js"></script>
</body>
</html>