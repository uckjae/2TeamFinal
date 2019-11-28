<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/common/HeadTag.jsp" />
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<c:import url="/common/Top.jsp" />
<c:set var="photolist" value="${requestScope.photolist }"/>
<c:set var="boardlist" value="${requestScope.boardlist }"/>
			    <section class="ftco-section">
			    <div class="row">   
			   
			    <c:forEach var="photo" items="${photolist }" >
			    <div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">
		    				<div class="project">
		    					<div class="img">
				    				<img src="upload/${photo.photoName }" class="img-fluid" alt="Colorlib Template">
			    				</div>
			    				</div>
			    				</div>
			
			    				</c:forEach> 	
			    				<c:forEach var="board" items="${boardlist }" >	
			    				<div class="text">
			    					<h4 class="price">${board.id }</h4>
			    					<span>${board.bIdx}</span>
			    					<c:if test="${board.id == sessionScope.memberId || (sessionScope.memberId !=null && sessionScope.isAdmin == 'true')}">
			    					<h3><a href="PhotoBoardDetail.do?bIdx=${board.bIdx }">${board.title }</a></h3>
			    					</c:if>
			    					<div class="star d-flex clearfix">
			    						<div class="mr-auto float-left">
				    						<span><fmt:formatDate value="${board.wDate}" pattern="yyyy-MM-dd   HH:mm:ss" /></span>
				    						<span class="rate"><a href="#">${board.rNum }</a></span>
			    						</div>
			    						
			    					</div>
			    				</div>
			    					 
		    					
		    	
			    		
		    				</c:forEach>  
		    			
		    		<c:if test="${sessionScope.memberId !=null}">
				    <div class="container">
				    <a href="PhotoWrite.do?cmd=write">
				    	<input type="button" value="글작성" id="photo" name="photo">	
				    </a>
				    </div>
				    </c:if>			
	
	 		</div>	
    </section>
    
</body>
</html>