<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/common/HeadTag.jsp" />
	<meta charset="UTF-8">
	<title>상세보기</title>

	<!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <style type="text/css">
        html,
        body {
            height: 100%;
        }
         .ds{
        	width: 100%;
        	height: 280px;
        	border: 1px solid #ced4da;
        	border-radius:5px;
        }
    </style>
    
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<!-- Top -->
    <c:import url="/common/Top.jsp" />
     <!-- Contant -->
    <c:set var="noticeDetail" value="${requestScope.noticeBoard}"/>
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">공지사항 게시판</h1>
                <input type="text" class="form-control mb-3" id="title" name="title" value="${noticeDetail.title}" readonly>
                <div id="content" rows="10" class="ds">
                	<c:out value="${noticeDetail.content}" escapeXml="false"/>
                </div>
                <div class="text-right">
                <br>
                	<c:if test="${noticeDetail.id == sessionScope.memberId || (sessionScope.memberId!=null && sessionScope.isAdmin == 'true')}">
                		  <input type="button" class="btn btn-primary" value="수정" onclick="location.href='NoticeBoardWrite.do?cmd=edit&bIdx=${noticeDetail.bIdx}'">
                  		  <input type="button" class="btn btn-primary" value="삭제" onclick="deleteAlert('NoticeBoardDelete.do?',${noticeDetail.bIdx})">
                	</c:if>
                    <input type="button" class="btn btn-primary" value="목록" onclick="location.href='NoticeBoardList.do'" >
                </div>
        </div>
    </div>   
</body>
</html>