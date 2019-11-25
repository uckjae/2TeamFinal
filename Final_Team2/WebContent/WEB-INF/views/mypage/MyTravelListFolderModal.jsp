<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  edit modal -->	
<c:set var="mTList" value="${requestScope.mTList}"/> 			 
<div class="modal fade" id="editModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <c:choose> 
        	<c:when test="${mTList.tLidx >0}">
        		<c:set var = "isEdit" value="true"/>
        	</c:when>
        	<c:otherwise>
        		<c:set var ="isEdit" value="false"/>
        	</c:otherwise>
        </c:choose> 
          <h5 class="modal-title" id="exampleModalLabel">
          <c:choose> 
          <c:when test="${isEdit}">
                    폴더 이름 수정
           </c:when>
           <c:otherwise>
                     폴더 만들기 
           </c:otherwise>        
             </c:choose>      
                   </h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form id="frm" method = "post">
        <div class="modal-body" id="innerModal">   		
        	<input type="text" name="editFolder" id="inputInnerModal"> 
        </div>
        <div class="modal-footer">
        <c:choose>
        <c:when test="${isEdit }">
          <input type="submit" class="btn btn-primary" value="수정">
         </c:when>
         <c:otherwise>
          <input type="submit" class="btn btn-primary" value="추가">
         </c:otherwise> 
         </c:choose>
       <button id="deletebtn" class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  
  
</body>
</html>