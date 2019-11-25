<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="memberId" value="${sessionScope.memberId}" />
<c:set var="admin" value="${sessionScope.isAdmin}" />
<c:choose>
	<c:when test="${memberId != null}">
		<c:set var="isLogin" value="true" />
	</c:when>
	<c:otherwise>
		<c:set var="isLogin" value="false" />
	</c:otherwise>
</c:choose>  
<c:choose>
	<c:when test="${admin != null && admin}">
		<c:set var="isAdmin" value="true" />
	</c:when>
	<c:otherwise>
		<c:set var="isAdmin" value="false" />
	</c:otherwise>
</c:choose>  

<!DOCTYPE html>
<html>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">이곳저곳</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<li class="nav-item">
						<a href="#" class="nav-link"> <span>추천 여행지</span></a>
					</li>
					
					<li class="nav-item">
						<a href="#" class="nav-link"> <span>여행지</span></a>
					</li>
					
					<li class="nav-item dropdown">
						<a href="#" class="nav-link  dropdown-toggle"  data-toggle="dropdown"> 코스</a>
						<div class="dropdown-menu">
	              			<a class="dropdown-item" href="#" >여행코스</a>	
	              			<a class="dropdown-item" href="#" >가이드북 다운로드</a>	
              			</div>				
					</li>
					
					<li class="nav-item">
						<a href="#" class="nav-link"> <span>축제</span></a>
					</li>
					
					<li class="nav-item dropdown">
						<a href="#" class="nav-link  dropdown-toggle"  data-toggle="dropdown"> 게시판</a>
						<div class="dropdown-menu">
	              			<a class="dropdown-item" href="FreeBoardList.do" target="_self">자유게시판</a>	
	              			<a class="dropdown-item" href="PhotoBoardList.do" target="_self">포토게시판</a>	
	              			<a class="dropdown-item" href="MyCourseBoardList.do" target="_self">나만의 코스</a>	
	              			<a class="dropdown-item" href="NoticeBoardList.do" target="_self">공지사항</a>	
	              			<a class="dropdown-item" href="QnABoardList.do" target="_self">Q & A</a>	
              			</div>				
					</li>
					

					 <c:choose>
						<c:when test="${isLogin== 'true'}">
							<c:choose>
								<c:when test="${isAdmin== 'true'}">
									<li class="nav-item dropdown">
										<a href="#" class="nav-link  dropdown-toggle"  data-toggle="dropdown"> 관리자</a>
										<div class="dropdown-menu">
					              			<a class="dropdown-item" href="AdminList.do" target="_self">관리자</a>	
					              			<a class="dropdown-item" href="MemberList.do" target="_self">회원관리</a>	
					              			<a class="dropdown-item" href="#" target="_self">통계관리</a>	
				              			</div>				
									</li>
								</c:when>
								<c:otherwise>
									<li class="nav-item dropdown">
										<a href="#" class="nav-link  dropdown-toggle"  data-toggle="dropdown"> My page</a>
										<div class="dropdown-menu">
					              			<a class="dropdown-item" href="#" target="_self">내정보조회</a>	
					              			<a class="dropdown-item" href="MTFolderList.do" target="_self">내 여행리스트</a>	
				              			</div>				
									</li>
								</c:otherwise>
							</c:choose>
							<li class="nav-item"><a href="Logout.do" class="nav-link"><span>Logout</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item">
								<a href="Register.do" class="nav-link"> <span>회원가입</span></a>
							</li>
							<li class="nav-item"><a href="Login.do" class="nav-link"><span>Login</span></a></li>
						</c:otherwise>
					</c:choose> 
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>