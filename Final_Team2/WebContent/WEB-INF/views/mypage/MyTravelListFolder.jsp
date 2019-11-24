<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행리스트</title>
    <c:import url="/common/HeadTag.jsp" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style type="text/css">
    	html, body{
    	height: 100%;
    	}
    	#main{
	<!--	background-image: url("images/bg_1.jpg"); -->
		width: 100%; 
		height: 100%;
		}
    </style>
<script type="text/javascript">

</script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <div class="container">
    <div id="main">
	<br><br><br><br>
		<h1><i class="flaticon-world mr-3"></i> 나의 여행 리스트 폴더</h1>
		
		<button type="button" class="btn btn-primary mt-1 mb-3" onclick="location.href='MTFolderListAddForm.do'">폴더 추가하기</button>
	<c:set var="mTFolderList" value ="${requestScope.mTList}"/>
    				<table class="table">				    
					      <tr>					      
				      	  <th class="pl-5" >NO</th>
				      	  <th >폴더 리스트</th>
				      	  <th></th>
				      	  <th></th>
					      </tr>
						<c:forEach var="mTFolder" items = "${ mTFolderList}">
					      <tr>					      	
					        <td class="pl-5">${mTFolder.tLidx}</td>
					       <td> <a href="MTList.do" >${ mTFolder.tLName}</a></td>
					        <td>
					        <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#editModal">수정 </a></td>	
					      <td><button type="button" class="btn btn-secondary">삭제</button></td>					       
					      </tr>
					    </c:forEach>  			  				  
					  </table>					   
		   		</div>		
	 			 </div>

<!--  edit modal -->	 			 
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">폴더 이름 수정</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">   		
        	<input type="text" name="editFolder"> 
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-primary" onclick="location.href='MTFolderListEdit.do?tLidx=${mTFolder.tLidx}'" value="수정">
          <button id="deletebtn" class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
	
	<script src="js/main.js"></script>
</body>
</html>