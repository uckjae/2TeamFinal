<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<c:import url="/common/Top.jsp" />
	<c:set var="photoContent" value="${requestScope.photoContent }"/>
	
		<section class="ftco-section">
			<div class="container">
				<div class="text">
			
					<table border="1" style="width: 800px; height: 800px" >
					
						<tr>
							<td rowspan="3" style="background-color: lightgray" height="0">
						
							<img id="viewPhoto" name="viewPhoto" src="" style="max-width: 100%; height: auto; display: block">
						
							</td>
							<td>
							<input type="text" name="title" id="title" value="${photoContent.title }" style="width: 100%">
							</td>
						</tr>
						
						<tr>
						<td rowspan="2">				
							<textarea rows="12" cols="30" id="content" name="content">
								${photoContent.content }
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
							<c:if test="${photoContent.id == sessionScope.memberId || (sessionScope.memberId!=null && sessionScope.isAdmin == 'true')}">
							<input type="button" class="btn btn-primary" value="수정" onclick="location.href='QnABoardWrite.do?cmd=edit&bidx=${qnaDetail.bIdx}'">
							<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='PhotoBoardDelete.do?bidx=${photoContent.bIdx}'">
							</c:if>
							<input type="reset" value="수정취소" class="btn-danger" style="width: 50%; height: 100%">	
							</td>
						</tr>
					</table>
		
				</div>
			</div>

		</section>
	
</body>
</html>