<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/common/HeadTag.jsp"/>
	<meta charset="UTF-8">
	<title>Free Board</title>
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <style type="text/css">
    	html, body{
    	height: 100%;
    	}
    </style>
    <script>
        jQuery(function($){
            $("#datatable").DataTable();
        });
</script>
</head>
<body>
	<!-- Top -->
	<c:import url="/common/Top.jsp"/>
	<div class="container">
		<h3>자유 게시판</h3>
	</div>
	<div class="container">
		<table id="datatable" class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>글쓴이</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Test</td>
					<td>19-11-21</td>
					<td>홍길동</td>
					<td>123</td>
				</tr>
			</tbody>
		</table>
	</div>
	
</body>
</html>

