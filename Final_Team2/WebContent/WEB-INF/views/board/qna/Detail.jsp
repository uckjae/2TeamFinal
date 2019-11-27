<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<c:set var="qnaDetail" value="${requestScope.qnaDetail}"/>
<head>
    <c:import url="/common/HeadTag.jsp" />

    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

    <title>Main</title>
    <style type="text/css">
        html,
        body {
            height: 100%;
        }
    </style>
    <script type="text/javascript">
    	$(function(){
    		setReadNum(${qnaDetail.bIdx});
    	});
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Content -->
    
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">Q & A</h1>
                <input type="text" class="form-control mb-3" id="title" name="title" value="${ qnaDetail.title}" readonly>
                <textarea id="content" rows="10" style="width: 100%" readonly>
                	<c:out value="${qnaDetail.content}" escapeXml="false"/>
                </textarea>
                <div class="text-right">
                	<c:if test="${qnaDetail.id == sessionScope.memberId || (sessionScope.memberId!=null && sessionScope.isAdmin == 'true')}">
                		  <input type="button" class="btn btn-primary" value="수정" onclick="location.href='QnABoardWrite.do?cmd=edit&bidx=${qnaDetail.bIdx}'">
                  		  <input type="button" class="btn btn-primary" value="삭제" onclick="location.href='QnABoardDelete.do?bidx=${qnaDetail.bIdx}'">
                	</c:if>
                    <input type="button" class="btn btn-primary" value="목록" onclick="location.href='QnABoardList.do'" >
                </div>
        </div>
        
        
      
        
        <!-- Reply  -->
        <c:set var="replies" value="${qnaDetail.replies}" scope="request"/>
        <jsp:include page="../common/Reply.jsp">
        	<jsp:param name="bIdx" value="${ qnaDetail.bIdx }"/>
        </jsp:include>
	</div>

</body>

</html>