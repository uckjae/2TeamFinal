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
	img {
		width:600px;
		height:600px;
		background-size: cover;	
		overflow: auto;
		overflow: hidden;
		
	} 
	.position {
	position: relative;
	margin-top: 3em;
	margin-left: 10em;
	margin-right: 10em;
	border: 1px solid black;
}
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
	
	$('#content').on('keyup', function() {
		if(stringToByte($(this).val()) > 200) {
			 errorAlert("글자수를 초과하셨습니다.");
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
				<c:choose>
					<c:when test="${Edit }">
					<div class="col-md-12 heading-section text-center ftco-animate fadeInUp ftco-animated">
            		<h1 class="mb-3 bread">게시판 수정</h1>
        			</div>
					</c:when>
					<c:otherwise>
					<div class="col-md-12 heading-section text-center ftco-animate fadeInUp ftco-animated">
            		<h1 class="mb-3 bread">게시판 작성</h1>
        			</div>
        			</c:otherwise>
				</c:choose>
<form action="PhotoWriteOk.do?cmd=<c:choose>
			<c:when test="${Edit }">edit&bidx=${photowrite.bIdx} </c:when>
				<c:otherwise>write </c:otherwise>
				</c:choose>" method="post" enctype="multipart/form-data">
	<div class="position" style="height: 720px">
		<input type="text" class="form-control mb-3 input" id="title" name="title" value="${photowrite.title}"  placeholder="제목을 입력하세요">
		<div class="col-lg-6" style="float: left">
			
				<img id="viewPhoto" name="viewPhoto" src="upload/${photo.photoName }">
				<label class="btn btn-primary btn-file">
				 <input type="file" name="Photo" id="Photo" accept="image/*">
				</label>
		</div>
			<div class="col-lg-6" style="display: table-caption;">
			
			<textarea style="width: 600px; height: 600px;" placeholder="내용을 입력하세요" id="content" name="content">${photowrite.content }</textarea>
			
			<c:choose>
				<c:when test="${Edit }">
			<input type="reset" value="수정취소" class="btn btn-danger" onclick="location.href='PhotoBoardList.do'" style="float: right;margin-left: 50px">
			<input id="PhotoGo" type="submit" value="수정" class="btn btn-primary" style=" float: right;">
			</c:when>
			<c:otherwise>
			<input type="reset" value="작성취소" class="btn btn-danger"  onclick="location.href='PhotoBoardList.do'" style="float: right;margin-left: 50px">
    		<input id="PhotoGo" type="submit" value="작성완료" class="btn btn-primary" style=" float: right;">
			</c:otherwise>
			</c:choose>
			
			
			
			
			</div>						
				
				
       		
    		
				
			</div>	
    		</form>
		</section>
	






</body>
</html>