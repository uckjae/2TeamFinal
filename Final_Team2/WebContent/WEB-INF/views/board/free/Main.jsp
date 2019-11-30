<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<%
	String id = (String)request.getSession().getAttribute("memberId");
%>
<head>
    <c:import url="/common/HeadTag.jsp" />
 	<jsp:include page="/common/DataTableTag.jsp"></jsp:include>
    <title>Main</title>
    <style type="text/css">
        html,
        body {
            height: 100%;
        }
    </style>
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
       
       /* function showDetail(isPublic, bIdx){
       		if(! isPublic && ${! sessionScope.isAdmin}){
       			alert("관리자만 접근 가능합니다.");
       		} else{
       			location.href="FreeBoardDetail.do?bIdx="+bIdx;
       		}
       } */
        function showDetail(bIdx){
        	//관리자 거나 회원이거
        	
        	let result = (${sessionScope.memberId != null});
        	console.log('result : '+result);
        	checkReadBoad(result, bIdx, "FreeBoardDetail.do");
        }
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    
	<!-- Contant -->
	<c:set var="freeList" value="${requestScope.freeBoardList}"></c:set>
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread" > 자유 게시판 </h1>
            <div class="table-responsive">
                <table class="table table-bordered hover" id="dataTable">
                    <thead>
                        <tr>
                            <th width="10%" >NO</th>
                            <th width="40%" >TITLE</th>
                            <th width="20%" >DATE</th>
                            <th width="20%" >WRITER</th>
                            <th width="10%" >READNUM</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="board" items="${freeList}">
                        	<tr>
                        		<td style="text-align: center !important;">${board.bIdx}</td>
                        		<td><a onclick="showDetail(${board.bIdx})"  href="#">
                        			<c:forEach var="depth" begin="1" end="${board.depth}" step="1">
                        				&nbsp;&nbsp;&nbsp;&nbsp;
                        			</c:forEach>
                        			<c:if test="${board.depth > 0}">
                        				<img src="images/re.gif" >
                        			</c:if>
                        			${board.title}</a></td>
                        		<td style="text-align: center !important;">
                            		<fmt:formatDate value="${board.wDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                            	</td>
                        		<td style="text-align: center !important;">${board.id}</td>
                        		<td style="text-align: center !important;">${board.rNum}</td>
                        	</tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
			<div class="text-right mt-3">
				<a href="FreeBoardWrite.do?cmd=write">
					<c:if test="${sessionScope.memberId != null || (sessionScope.memberId != null && sessionScope.isAdmin == 'true')}">
               	 		<input type="button" class="btn btn-primary" value="글쓰기" id="fboad" name="fboard">
					</c:if>
				</a>
			</div>
        </div>
    </div>
</body>
</html>

