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
				
		<div class="col-lg-6" style="float: left">
				<img id="viewPhoto" name="viewPhoto" src="upload/${photo.photoName }" style="max-width: 100%; height: auto; display: block">
				<input type="file" name="Photo" id="Photo" accept="image/*">
		</div>
			<div class="col-lg-6" style="display: table-caption;">
			<input type="text" name="title" id="title" value="${photowrite.title }" >
			<br><br>
			<input type="text" name="title" id="title" >
			
						</div>						
				
					
				
			
		</section>







</body>
</html>