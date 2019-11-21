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
	공지사항 게시판 상세 화면
</body>
</html>