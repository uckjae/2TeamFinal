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
	<div class="container mt-7">
		<div id="main">
			<h1>
				<i class="flaticon-world mr-3"></i>나의 여행 리스트
			</h1>
			<br>
			<div class="col-md-10 offset-md-2">
				<c:set var="mTLContentList" value="${requestScope.mTLContent}" />
				<ul class="comment-list" >
					<li class="comment">
						<!--     <div class="vcard bio">  --> <!--  --> <c:forEach
							var="mTLContent" items="${mTLContentList}">

							<div class="vcard bio mb-3">
								<img src="${mTLContent.image}" alt="trip image">
							</div>
							<div class="comment-body mb-3">
								<h4>${ mTLContent.spotName}</h4>
								<div class="meta">${mTLContent.spotDate}</div>
								<p>주소 : ${ mTLContent.spotAddr}</p>
								<p>링크 : ${ mTLContent.spotLink}</p>
								<a
									href="MTListDelete.do?tLCidx=${mTLContent.tLCidx}&tLidx=${ mTLContent.tLidx}"
									class="btn btn-secondary">삭제 </a>

							</div>
						</c:forEach>

					</li>
				</ul>

			</div>

		</div>
	</div>

	<script src="js/main.js"></script>
</body>
</html>