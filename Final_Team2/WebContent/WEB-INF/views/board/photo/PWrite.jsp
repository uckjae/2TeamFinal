<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		if($("#Psubject").val() == ""){
			alert("제목을 입력해주세요");
			$("Psubject").focus();
		}
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
	<form action="PWriteOk.do" method="post" enctype="multipart/form-data"
		name="boardform">
		<section class="ftco-section">
			<div class="container">
				<div class="text">
				<center>
					<table border="1" style="width: 800px; height: 800px" >
					
						<tr>
							<td rowspan="3" style="background-color: lightgray" height="0">
						
							<img id="viewPhoto" name="viewName" src="" style="max-width: 100%; height: auto; display: block">
						
							</td>
							<td>
							<input type="text" name="Psubject" id="Psubject" value="" style="width: 100%">
							</td>
						</tr>
						
						<tr>
						<td rowspan="2">
							
							<textarea rows="12" cols="30" id="content" name="content"></textarea>
							</td>
						
						</tr>
						<tr>
							
						</tr>
						<tr>
							<td>
							<input type="file" name="Filename" id="Photo" aceept="image/*">
							</td>
							<td>
							<input id="PhotoGo" type="submit" value="작성완료" class="btn-primary" style="width: 50%;height: 100%">
							<input type="reset" value="작성취소" class="btn-danger" style="width: 50%; height: 100%">
							</td>
						</tr>
					</table>
		</center>
				</div>
			</div>

		</section>
	</form>







</body>
</html>