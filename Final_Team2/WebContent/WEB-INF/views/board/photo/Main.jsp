<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			    <section class="ftco-section">
			    <div class="row">
			    <c:forEach var="photo" items="${photolist }">
			   <div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">
		    				<div class="project">
		    					<div class="img">
				    				<a href="hotel-single.html"><img src="images/destination-1.jpg" class="img-fluid" alt="Colorlib Template"></a>
			    				</div>
			    				<div class="text">
			    					<h4 class="price">${photo.id }</h4>
			    					<span>${photo.bIdx}</span>
			    					<h3><a href="PhotoBoardDetail.do?bidx=${photo.bIdx }">${photo.title }</a></h3>
			    					<div class="star d-flex clearfix">
			    						<div class="mr-auto float-left">
				    						<span><fmt:formatDate value="${photoss.wDate}" pattern="yyyy-MM-dd   HH:mm:ss" /></span>
				    				
			    						</div>
			    						<div class="float-right">
			    							<span class="rate"><a href="#">${photo.rNum }</a></span>
			    						</div>
			    					</div>
			    				</div>
			    				<a href="images/hotel-5.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
			    					<span class="icon-expand"></span>
			    				</a>
		    				</div>
		    				</div>
		    			 </c:forEach>
		    			  	
		    			
		    			
    </section>
    <div class="container">
    <a href="PhotoWrite.do?cmd=write">
    	<input type="button" value="글작성" id="photo" name="photo">	
    </a>
    </div>
</body>
</html>