<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<html>
<head>
<c:import url="/common/HeadTag.jsp" /> 	
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="board" value="${requestScope.board }"/>
<c:set var="photo" value="${requestScope.photo }"/>
<style type="text/css">
	img {
		width:100%;
		height:464px;
		background-size: cover;	
		overflow: auto;
		overflow: hidden;
		
	}
		.position {
	position: relative;
	margin-top: 3em;
	margin-left: 10em;
	margin-right: 10em;
} 
</style>
<script type="text/javascript">
$(function(){
	setReadNum(${board.bIdx} );
	
});


</script>
<style type="text/css">
textarea{ 
		  resize:none;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<c:import url="/common/Top.jsp" />
			<section class="ftco-section">
					<div class="col-md-12 heading-section text-center ftco-animate fadeInUp ftco-animated">
            		<h1 class="mb-3 bread">상세보기</h1>
        			</div>
	<div class="position" style="height: 550px">
			<div class="col-lg-6" style="float: left">
			<br>
				<img id="viewPhoto" name="viewPhoto" src="upload/${photo.photoName }">
						</div>
			<div class="col-lg-6" style="display: table-caption;">
			<table border="1">
			<td style="width: 225px">글 번호 : ${board.bIdx }</td>
			<td style="width: 225px">조회 수 : ${board.rNum }</td>
			</table>
			<input type="text" name="title" id="title" value="${board.title }" style="width: 550px;" readonly>
			<textarea style="width: 550px; height: 400px;" id="content" name="content" readonly>${board.content }</textarea>
			<c:if test="${board.id == sessionScope.memberId || (sessionScope.memberId!=null && sessionScope.isAdmin == 'true')}">
			<input type="button" class="btn btn-primary" value="수정" onclick="location.href='PhotoWrite.do?cmd=edit&bidx=${board.bIdx}'" >
			<input type="button" class="btn btn-danger" value="삭제" onclick="deleteAlert('PhotoBoardDelete.do?',${board.bIdx})" >
			</c:if>
			<input type="reset" value="목록" class="btn btn-primary" onclick="location.href='PhotoBoardList.do'">
			
			
			
			</div>						
				
				
       		
    		
    		<c:set var="replies" value="${board.replies }" scope="request"/>
							<jsp:include page="../common/Reply.jsp">
								<jsp:param value="${board.bIdx }" name="bIdx"/>		
							</jsp:include>
				
			</div>	
		</section>
		
	
</body>
</html>