<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<c:import url="/common/HeadTag.jsp" />
<jsp:include page="/common/DataTableTag.jsp"></jsp:include>
<title>Main</title>
<style type="text/css">
html, body {
	height: 100%;
}
.center{
	text-align: center !important;
}
</style>
<script src="https://kit.fontawesome.com/8a07c7597a.js" crossorigin="anonymous"></script>
<script type="text/javascript">


        $(function () {
            let table = $('#dataTable').DataTable({
           	 stateSave: true, // 페이지 상태 저장
           	"ordering": false
           });

           $('#dataTable_filter').prepend(
               '<select id="select" class="custom-select" style="margin-right : 10px; width: 100px"></select>');

           // 검색 th 칼럼 별로 할 수 있게 select 생성
           let ths = $('#dataTable > thead > tr > th');
           $('#select').append('<option>전체</option>');
           ths.each(function (index, element) {
               if (index < 3) // 앞에 3개만
                   $('#select').append('<option>' + element.innerHTML + '</option>');
           });

           // select에 따라 검색 결과 table에 표현
           $('.dataTables_filter input').keyup(function () {
               tableSearch();
           });

           $("#deptSelect").change(function () {
               tableSearch();
           });

           function tableSearch() {
               let colIndex = document.querySelector('#select').selectedIndex;
               let searchText = $('.dataTables_filter input').val();
				// 전체 검색
               if(colIndex==0){
               	table.search(searchText).draw();
               } 
           	// 컬럼 검색
               else{
               	table.column(colIndex-1).search(searchText).draw();
               }
           }
       });
       
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<!-- Top -->
	<c:import url="/common/Top.jsp" />


	<!-- Contant -->
	<c:set var="noticeList" value="${requestScope.noticeboardList}" />
	<c:set var="board" value="${requestScope.board}" />
	<div class="content">
		<div class="comment-form-wrap pt-xl-2">
			<h1 class="text-center mb-3 bread">공지사항</h1>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th width="10%">No</th>
							<th width="60%">제목</th>
							<th width="20%">작성일</th>
							<th width="10%">조회수</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="topnotice" items="${noticeList}">
							<c:if test="${topnotice.isTop == 'true'}">
								<tr style="background-color : #ededed ;">
									<td width="10%" style="color : red; text-align: center !important;">
										<input type="button" class='btn notice'  value="공지">
									</td>
									<td width="60%" class="sorting_1">
										<a href="NoticeBoardDetail.do?bIdx=${topnotice.bIdx}" style="color : red ;">${topnotice.title}</a>
									</td>
									<td width="20%" style="text-align: center !important;">
										<fmt:formatDate value="${topnotice.wDate}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td width="10%" style="text-align: center !important;">${topnotice.rNum}</td>
								</tr>
							</c:if>
						</c:forEach>

						<c:forEach var="boardList" items="${noticeList}">
							<tr >
								<td width="10%" style="text-align: center !important;">${boardList.bIdx}</td>
								<td width="60%" class="sorting_1" >
									<a href="NoticeBoardDetail.do?bIdx=${boardList.bIdx}">${boardList.title}</a></td>
								<td width="20%" style="text-align: center !important;">
									<fmt:formatDate value="${boardList.wDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td width="10%" style="text-align: center !important;">${boardList.rNum}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:if test="${sessionScope.isAdmin == 'true'}">
				<div class="text-right mt-3">
					<a href="NoticeBoardWrite.do?cmd=write"> <input type="button"
						class="btn btn-primary" value="글쓰기" id="nboad" name="nboard">
					</a>
				</div>
			</c:if>
		</div>
	</div>

</body>
</html>