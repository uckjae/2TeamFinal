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
		<h1><i class="flaticon-world mr-3"></i>나의 여행 리스트</h1>
	<br>	 
	<c:set var="mTLContentList" value ="${requestScope.mTLContent}"/>
    		   <ul class="comment-list">
                <li class="comment">
              <!--     <div class="vcard bio">  --> 
              
              <!--  -->
                  
                   <c:forEach var="mTLContent" items="${mTLContentList}" >
                   
						<div class="vcard bio">
							<!--이미지 경로 나중에 다시 설정하기 -->
							<img src="upload/${mTLContent.image}" alt="trip image">
						</div>
							<div class="comment-body">
							<h4>${ mTLContent.spotName}</h4>
							<div class="meta">${mTLContent.spotDate}</div>
							<p>
								${ mTLContent.spotAddr} <a href="${ mTLContent.spotLink}"
									class="btn btn-primary ml-3 mr-3">${ mTLContent.spotLink}</a> <a
									href="MTListDelete.do?tLCidx=${mTLContent.tLCidx}&tLidx=${ mTLContent.tLidx}"
									class="btn btn-secondary">삭제 </a>
							</p>
						</div>
					</c:forEach> 
                  
                </li>
    		</ul>
    		
    		
    		
		   </div>		
	  </div>
	
	<script src="js/main.js"></script>
</body>
</html>