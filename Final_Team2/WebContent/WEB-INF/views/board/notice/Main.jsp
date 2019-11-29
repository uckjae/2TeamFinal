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
</style>

<script type="text/javascript">
        $(function () {
            let table = $('#dataTable').DataTable();

            $('#dataTable_filter').prepend(
                '<select id="select" class="custom-select" style="margin-right : 10px; width: 100px"></select>');

            // 검색 th 칼럼 별로 할 수 있게 select 생성
            let ths = $('#dataTable > thead > tr > th');
            ths.each(function (index, element) {
                if (index < 2) // 앞에 두개만
                    $('#select').append('<option>' + element.innerHTML + '</option>');
            });

            // select에 따라 검색 결과 table에 표현
            $('.dataTables_filter input').keyup(function () {
                tableSearch();
            });

            $("#deptSelect").change(function () {
                tableSearch();
            })

            function tableSearch() {
                let colIndex = document.querySelector('#select').selectedIndex;
                let deptno = $("#deptSelect option:selected").val();
                let searchText = $('.dataTables_filter input').val();

                if (deptno == "*") {
                    table.column(colIndex).search(searchText).column(2).search("").draw();
                } else {
                    table.column(colIndex).search(searchText).column(2).search(deptno).draw();
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
			<c:forEach var="topnotice" items="${noticeList}">

				<c:if test="${topnotice.isTop == 'true'}">
					<tr>
						<td width="60%" class="sorting_1"><a
							href="NoticeBoardDetail.do?bIdx=${topnotice.bIdx}">★★★${topnotice.title}</a></td>
					</tr>
				</c:if>
			</c:forEach>

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



						<c:forEach var="boardList" items="${noticeList}">
							<tr>
								<td width="10%">${boardList.bIdx}</td>
								<td width="60%" class="sorting_1"><a
									href="NoticeBoardDetail.do?bIdx=${boardList.bIdx}">${boardList.title}</a></td>
								<td width="20%"><fmt:formatDate value="${boardList.wDate}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td width="10%">${boardList.rNum}</td>
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