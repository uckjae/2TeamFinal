<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행리스트</title>
    <c:import url="/common/HeadTag.jsp" />
 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
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
		<h1><i class="flaticon-world mr-3"></i> 나의 여행 리스트 폴더</h1>
		
		<button type="button" class="btn btn-primary mt-1 mb-3" data-toggle="modal" data-target="#editModal1" data-cmd="add">폴더 추가하기</button>
	<c:set var="mTFolderList" value ="${requestScope.mTList}"/>
			<table class="table">
				<tr>
					<th class="pl-5">NO</th>
					<th>폴더 리스트</th>
					<th></th>
					<th></th>
				</tr>
				<c:forEach var="mTFolder" items="${ mTFolderList}" varStatus="status">
					<tr>
						<td class="pl-5">${status.count}</td>
						<td><a href="MTList.do?tLidx=${mTFolder.tLidx}">${ mTFolder.tLName}</a></td>
						<td><a href="#" id="editbtn" class="btn btn-primary"
							data-toggle="modal" data-target="#editModal1" data-cmd="edit"
							data-edit-tlidx="${mTFolder.tLidx}"
							data-edit-tlname="${mTFolder.tLName}">수정 </a></td>
						<td><a href="MTFolderListDelete.do?tLidx=${mTFolder.tLidx}" class="btn btn-secondary"> 삭제 </a></td>
					</tr>
				</c:forEach>
			</table>
		</div>		
	 </div>


	<!-- Modal-->
	 <c:import url="MyTravelListFolderModal.jsp" />
	<script src="js/main.js"></script>
</body>
</html>