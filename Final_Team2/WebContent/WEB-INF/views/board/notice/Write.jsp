<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 	<c:import url="/common/HeadTag.jsp"/>
	<meta charset="UTF-8">
	<title>Free Board</title>
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
    <style type="text/css">
    	html, body{
    	height: 100%;
    	}
    </style>
    <script>
        jQuery(function($){
            $("#datatable").DataTable();
        });
</script>
<script type="text/javascript">
	$(document).ready(function() {
		  $('#summernote').summernote();
	});
</script>
</head>
<body>
	<!-- Top -->
   <c:import url="/common/Top.jsp"/>
    <div class="container">
      <h3 style="text-align:center;">공지사항 게시판 상세화면</h3>
      <hr>
    </div>
    
    
    <div id="pageContainer">
       <div style="padding-top: 40px; text-align: center">
    <form name="NTB" action="WriteOk.jsp" method="POST">
      <table width="80%" border="0" align="center">
         <tr>
            
            <td width="80%" align="left">
               <input type="text"name="subject" size="150">
            </td>
         </tr>
         <tr>
            
            <td width="80%" align="left"><textarea id="summernote" rows="10" cols="60" name="content" class="ckeditor"></textarea></td>
         </tr>
         <tr>
            
            <td width="80%" align="left"><input type="file" name="filename"></td>
         </tr>
         <tr>
             <td colspan="2" align="center">
                 <input type="button" value="글쓰기" onclick="check();" /> 
                 <input type="button"  value="취소" />
             </td>
         </tr>
      </table>
    </form>
    </div>
    </div>
    
</body>
</html>