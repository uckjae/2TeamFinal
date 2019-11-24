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
        	<div class="form-group">
	        	<textarea name="" id="" cols="30" rows="3" class="form-control" placeholder="Message"></textarea>
             </div>
             <div class="text-right">
             	 <input type="button" class="btn btn-primary " value="REPLY" onclick="location.href='QnABoardWrite.do?cmd=edit&bidx=${qnaDetail.bIdx}'">
             </div>
        </div>
        
        <!-- Reply  -->
		<div class="col-md-12 tour-wrap">
			<div class="pt-5">
				<h3 class="mb-5" style="border-bottom: 1px solid #f2f2f2;">3 Reply</h3>
				
				<ul class="comment-list">
					<li class="comment box p-2 px-3 bg-light d-flex">
						<div class="comment-body">
							<h3>관리자</h3>
							<div class="meta">October 03, 2018 at 2:21pm</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Pariatur quidem laborum necessitatibus, ipsam impedit vitae
								autem, eum officia, fugiat saepe enim sapiente iste iure! Quam
								voluptas earum impedit necessitatibus, nihil?</p>
							<p>
								<a href="#" class="reply">Reply</a>
							</p>
						</div>
					</li>

					<li class="comment">
						<div class="comment-body">
							<h3>John Doe</h3>
							<div class="meta">October 03, 2018 at 2:21pm</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Pariatur quidem laborum necessitatibus, ipsam impedit vitae
								autem, eum officia, fugiat saepe enim sapiente iste iure! Quam
								voluptas earum impedit necessitatibus, nihil?</p>
							<p>
								<a href="#" class="reply">Reply</a>
							</p>
						</div>
				</ul>
			</div>
		</div>
	</div>


</body>

</html>