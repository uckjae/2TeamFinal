<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

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

    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <c:set var="qnaDetail" value="${requestScope.qnaDetail}"/>
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
        
        
        <div class="p-5 bg-light mt-3">
	        <form action="BoardReplyWrite.do?bIdx=${qnaDetail.bIdx}" method="post">
	        	<div class="form-group">
		        	<textarea name="content" id="content" cols="30" rows="3" class="form-control" placeholder="Message"></textarea>
	             </div>
	             <div class="text-right">
	             	 <input type="submit" class="btn btn-primary " value="REPLY" >
	             </div>
	        </form>
        </div>
        
        <!-- Reply  -->
        <c:if test="${ qnaDetail.replies.size() > 0}">
        	<div class="col-md-12 tour-wrap">
				<div class="pt-5">
					<h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;">${ qnaDetail.replies.size() } Reply</h3>
					<ul class="comment-list">
					
					<c:forEach var="reply" items="${ qnaDetail.replies }">
						<li class="comment box p-2 px-3 bg-light d-flex">
							<div class="comment-body">
								<h3 class="bold">${ reply.id }</h3>
								<div class="meta">${ reply.rWDate }</div>
								<p>${ reply.rContent }</p>
								<p>
									<a href="#" class="reply">Reply</a>
								</p>
							</div>
						</li>
					</c:forEach>
					
					</ul>
				</div>
			</div>
        </c:if>	
	</div>

</body>

</html>