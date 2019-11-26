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
<c:set var="replies" value="${board.replies }" scope="request"/>
<script type="text/javascript">
$(function(){
	setReadNum(${board.bIdx});
	
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
			<div class="container">
				<div class="text">
			
					<table border="1" style="width: 800px; height: 800px" >
						<tr>
						<td colspan="3">
							${board.title }
							</td>
							
						</tr>
						<tr>
							<td rowspan="4" style="background-color: lightgray" height="0">
							<img id="viewPhoto" name="viewPhoto" src="upload/${photo.photoName }" style="max-width: 100%; height: auto; display: block">
								</td>
							<td colspan="2">${board.wDate }</td>
							
						</tr>
						
						<tr>
						
						<td>${board.bIdx }</td>
						<td>${board.rNum }</td>
						
						</tr>
						<tr>
							<td colspan="2" rowspan="2" rows="12" cols="30">				
								<textarea rows="12" cols="30" readonly>

								${board.content }
								</textarea>								
							
							</td>
						</tr>
						<tr>
							
							<jsp:include page="../common/Reply.jsp">
								<jsp:param value="${board.bIdx }" name="bIdx"/>		
							</jsp:include>
						</tr>
						<tr>
						<td>
							${photo.photoName }
							</td>
							<td colspan="2">
							<c:if test="${board.id == sessionScope.memberId || (sessionScope.memberId!=null && sessionScope.isAdmin == 'true')}">
							<input type="button" class="btn btn-primary" value="수정" onclick="location.href='PhotoWrite.do?cmd=edit&bidx=${board.bIdx}'">
							<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='PhotoBoardDelete.do?bidx=${board.bIdx}'">
							</c:if>
							<input type="reset" value="목록" class="btn-danger" style="width: 50%; height: 100%" onclick="location.href='PhotoBoardList.do'">	
							</td>
						</tr>
					</table>
		
				</div>
			</div>

		</section>
	
</body>
</html>