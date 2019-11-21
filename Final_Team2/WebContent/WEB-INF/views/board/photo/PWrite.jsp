<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<title>Insert title here</title>

<script type="text/javascript">
$(function(){
	("#PhotoGo").click(function(){
		if($("#Psubject").val() == " "){
			alert("제목을 입력해주세요");
			$("Psubject").focus();
		}
	})
		
	
});

</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<c:import url="/common/Top.jsp" />
<form action="PWriteOk.do" method="post" enctype="multipart/form-data" name="boardform">
<section class="ftco-section">
<div class="container">
<div class="text">
<table border="1">
	<tr>
		<td rowspan="4"><input type="file"><td>
		<td ><input type="text" name="Psubject" id="Psubject" value="" ></td>
	</tr>
	<tr>
	<td></td>
	<td rowspan="2"><textarea rows="10" cols="30"></textarea></td>
	</tr>
	<tr>
	<td></td>

	</tr>
	<tr>
	<td></td>
	<td><input id="PhotoGo" type="submit" value="작성완료" ></td>
	</tr>
</table>	

</div>
</div>

</section>
	</form>		    					
	    		
	    	
	
	
	

	
</body>
</html>