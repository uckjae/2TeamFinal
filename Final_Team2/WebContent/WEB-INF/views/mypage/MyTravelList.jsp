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
			<c:set var="mTLContentList" value="${requestScope.mTLContent}" />
			<c:forEach var="mTLContent" items="${mTLContentList}">
				<div class="row mb-3">
					<div class="col-md-4 offset-md-2">

						<div class="image">
							<img src="${mTLContent.image}" alt="trip image"
								style="max-height: 200px; border-radius: 50%; width: 100%;">
						</div>
					</div>
					<div class="col-md-5 pl-5">
						<h4>${ mTLContent.spotName}</h4>
						<div class="meta">${mTLContent.spotDate}</div>
						<p>주소 : ${ mTLContent.spotAddr}</p>
						<p>링크 : ${ mTLContent.spotLink}</p>
						<a
							href="MTListDelete.do?tLCidx=${mTLContent.tLCidx}&tLidx=${ mTLContent.tLidx}"
							class="btn btn-secondary">삭제 </a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script src="js/main.js"></script>
</body>
</html>