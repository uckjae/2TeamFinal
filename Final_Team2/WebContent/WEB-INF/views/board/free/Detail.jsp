<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    </style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<!-- Top -->
    <c:import url="/common/Top.jsp" />
    <!-- Contant -->
    <c:set var="freeDetail" value="${requestScope.freeBoardDetail}"/>
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">자유 게시판</h1>
                <input type="text" class="form-control mb-3" id="title" name="title" value="${freeDetail.title}" readonly>
                <textarea id="content" rows="10" style="width: 100%" readonly>
                	<c:out value="${freeDetail.content}" escapeXml="false"/>
                </textarea>
                <div class="text-right">
                	<c:if test="${freeDetail.id == sessionScope.memberId || (sessionScope.memberId!=null && sessionScope.isAdmin == 'true')}">
                		  <input type="button" class="btn btn-primary" value="수정" onclick="location.href='FreeBoardWrite.do?cmd=edit&bIdx=${freeDetail.bIdx}'">
                  		  <input type="button" class="btn btn-primary" value="삭제" onclick="location.href='FreeBoardDelete.do?bIdx=${freeDetail.bIdx}'">
                	</c:if>
                	<input type="button" class="btn btn-primary" value="답글" onclick="location.href='FreeBoardReWrite.do?bIdx=${freeDetail.bIdx}'" >
                    <input type="button" class="btn btn-primary" value="목록" onclick="location.href='FreeBoardList.do'" >
                </div>
        </div>
        
          <!-- Reply  -->
        <c:set var="replies" value="${freeDetail.replies}" scope="request"/>
        <jsp:include page="../common/Reply.jsp">
        	<jsp:param name="bIdx" value="${freeDetail.bIdx}"/>
        </jsp:include>
    </div>
</body>
</html>