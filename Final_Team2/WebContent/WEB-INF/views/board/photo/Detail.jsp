<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/common/HeadTag.jsp" />
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<c:import url="/common/Top.jsp" />
	
	<c:set var="board" value="${requestScope.board }"/>
	<c:set var="photo" value="${requestScope.photo }"/>
		<section class="ftco-section">
			<div class="container">
				<div class="text">
			
					<table border="1" style="width: 800px; height: 800px" >
					
						<tr>
							<td rowspan="3" style="background-color: lightgray" height="0">
						
							<img id="viewPhoto" name="viewPhoto" src="upload/${photo.photoName }" style="max-width: 100%; height: auto; display: block">
						
							</td>
							<td>
							${board.title }
							</td>
							
						</tr>
						
						<tr>
						<td>${board.wDate }</td>
						<td>${board.bIdx }</td>
						
						
						</tr>
						<tr>
							<td rowspan="2" rows="12" cols="30">				
								<textarea rows="12" cols="30" readonly>

								${board.content }
								</textarea>								
							
							</td>
						</tr>
						<tr>
							
						</tr>
						<tr>
						<td>
							<input type="file" name="Photo" id="Photo" aceept="image/*">
							</td>
							<td>
							<c:if test="${board.id == sessionScope.memberId || (sessionScope.memberId!=null && sessionScope.isAdmin == 'true')}">
							<input type="button" class="btn btn-primary" value="수정" onclick="location.href='PhotoWrite.do?cmd=edit&bidx=${board.bIdx}'">
							<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='PhotoBoardDelete.do?bidx=${board.bIdx}'">
							</c:if>
							<a href="PhotoBoardList.do"><input type="reset" value="목록" class="btn-danger" style="width: 50%; height: 100%"></a>	
							</td>
						</tr>
					</table>
		
				</div>
			</div>

		</section>
	
</body>
</html>