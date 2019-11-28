<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<title>Insert title here</title>
<style type="text/css">
textarea{ 
		  resize:none;
}
	/*  img {
		max-width: 100%;
		height:auto;
		background-size: cover;	
		overflow: auto;
		overflow: hidden;
	}  */
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#PhotoGo").click(function(){
		if($("#title").val() == ""){
			alert("제목을 입력해주세요.");
			$("#title").focus();
		}else if($('#content').val() == ""){
			alert("내용을 입력해주세요.");
			$("#content").focus();
		}else if($('#Photo').val() == ""){
			alert("사진 1장을 첨부 해야합니다.");
		}else if($('#Photo').val() !=""){
			return true;
		}
		return false;
		
	});
	
	$('#Photo').change(function(){
		var reader = new FileReader();
		
		reader.onload = function(e) {
			
			document.getElementById("viewPhoto").src = e.target.result;
		};
		
		reader.readAsDataURL(this.files[0]);
	});
	
	 $('#content').keyup(function() {
	        if($(this).val().length > 200) {
	            $(this).val($(this).val().substring(0, 200));
	        }
	    });
	 

	
});
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<c:import url="/common/Top.jsp" />
	<c:set var="photowrite" value="${requestScope.photowrite }"/>
	<c:set var="photo" value="${requestScope.photo }"/>
	<c:choose>
		<c:when test="${photowrite.bIdx > 0 }">
			<c:set var="Edit" value="true"/>
		</c:when>
		<c:otherwise>
			<c:set var="Edit" value="false"/>
		</c:otherwise>
	</c:choose>
		<section class="ftco-section">
			<div class="container">
				<div class="text">
				<h3>
				<c:choose>
					<c:when test="${Edit }">
						포토 게시판 글 수정
					</c:when>
					<c:otherwise>
						포토 게시판 글 작성
					</c:otherwise>
				</c:choose>
				</h3>
	<form action="PhotoWriteOk.do?cmd=<c:choose>
			<c:when test="${Edit }">edit&bidx=${photowrite.bIdx} </c:when>
			<c:otherwise>write </c:otherwise>
		</c:choose>" method="post" enctype="multipart/form-data">
	
					<table border="1" style="width: 800px; height: 800px" >
					
						<tr>
							<td rowspan="3" style="background-color: lightgray" height="0">
						
							<img id="viewPhoto" name="viewPhoto" src="upload/${photo.photoName }" style="max-width: 100%; height: auto; display: block">
						
							</td>
							<td>
							<input type="text" name="title" id="title" value="${photowrite.title }" style="width: 100%" >
							</td>
						</tr>
						
						<tr>
						<td rowspan="2" colspan="2" rows="12" cols="48">				
							<textarea rows="15" cols="48" id="content" name="content">${photowrite.content }</textarea>
							</td>
						
						</tr>
						<tr>
							
						</tr>
						
						<tr>
						<c:choose>
							<c:when test="${Edit }">
							<td>
							<input id="PhotoGo" type="submit" value="수정" class="btn btn-primary" >
							<input type="reset" value="수정취소" class="btn btn-danger"  onclick="'PhotoBoardList.do'">
							</td>
							</c:when>
							<c:otherwise>
							<td>
							<input type="file" name="Photo" id="Photo" accept="image/*">
							</td>
							</c:otherwise>
							</c:choose>
							<td>
							<input id="PhotoGo" type="submit" value="작성완료" class="btn btn-primary">
							<input type="reset" value="작성취소" class="btn btn-danger"  onclick="'PhotoBoardList.do'">
							</td>
						</tr>
						
					</table>
	</form>
		
				</div>
			</div>

		</section>







</body>
</html>