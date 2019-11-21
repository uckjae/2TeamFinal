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
      <h3 style="text-align:center;">
             공지사항 게시판
      </h3>
      <hr>
    </div>
    
    
	<div class="container">
	 <table id="datatable" class="table table-bordered">
        <thead>
            <tr>
               <th>No</th>
               <th>제목</th>
               <th>작성일</th>
               <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <tr>
               <td>1</td>
               <td>어쩌구</td>
               <td>1109</td>
               <td>100</td>
            </tr>
        </tbody>
        <tbody>
            <c:forEach var="reply" items="${replylist}">
				<tr>
				  <td class="reply_main"><a href="MemberDetail.do?empno=${reply.ridx }">${reply.ridx}</a></td>
				  <td>${reply.ridx}</td>
				  <td>${reply.rcontent}</td>
				  <td>${reply.id}</td>
				  <td>${reply.rwdate}</td>
				</tr>
			</c:forEach>
        </tbody>
      </table>
      <div class="text-center">
         <a class="d-block small mt-3" href="NoticeBoardDetail.do">상세보기
            Account</a>
      </div>
	</div>
	  
</body>
</html>