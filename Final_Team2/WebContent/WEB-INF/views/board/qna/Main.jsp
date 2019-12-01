<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <c:import url="/common/HeadTag.jsp" />
 	<jsp:include page="/common/DataTableTag.jsp"></jsp:include>
    <title>Main</title>
    <style type="text/css">
        html,
        body {
            height: 100%;
        }
        .icon {
        	color : #6e6e6e;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            let table = $('#dataTable').DataTable({
            	 stateSave: true, // 페이지 상태 저장
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
        
        function showDetail(isPublic, bIdx, writer){
        	// 비공개 글일 경우 글쓴이 자신이거나, 관리자만 볼 수 있다. 
        	let isWriter = (writer == '${sessionScope.memberId}');
        	let isAdmin = ${sessionScope.isAdmin == 'true'};
        	let isRead = (isAdmin || isWriter);
        	
        	 if(! isPublic && !isRead){
        		 Swal.fire({
                     icon: 'error',
                     title: '접근 권한이 없습니다.',
                     showConfirmButton: false,
                     timer: 1000
                   })
        	} else{
        		location.href="QnABoardDetail.do?bIdx="+bIdx;
        	} 
        }
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <c:set var="qnaList" value="${requestScope.qnaList}"/>
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">Q & A</h1>
            <div class="table-responsive">
            	<c:choose>
            		<c:when test="${qnaList.size() < 1 }">
           				<jsp:include page="../common/NoBoard.jsp"/>
           			</c:when>
            		<c:otherwise>
		                <table class="table table-bordered hover" id="dataTable">
		                    <thead>
		                        <tr>
		                            <th width="10%" >NO</th>
		                            <th width="40%" >TITLE</th>
		                            <th width="20%" >WRITER</th>
		                            <th width="20%" >WRITE DATE</th>
		                            <th width="10%" >VIEWS</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    <c:forEach var="board" items="${qnaList}">
		                    	<tr>
		                            <td style="text-align: center !important;">${board.bIdx}</td>
		                            <td class="sorting_1" >
		                            <a onclick="showDetail(${ board.isPublic() }, ${board.bIdx}, '${board.id }')" href="#">
		                            	<c:choose>
		                            		<c:when test="${! board.isPublic() }">
		                            			<i class="fas fa-user-lock ml-2 mr-2 icon"></i>
		                            		</c:when>
		                            		<c:otherwise>
		                            			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                            		</c:otherwise>
		                            	</c:choose>
		                            	${board.title}</a></td>
		            	            <td style="text-align: center !important;">${board.id}</td>
		                            <td style="text-align: center !important;">
		                            	<fmt:formatDate value="${board.wDate}" pattern="yyyy-MM-dd   HH:mm:ss" />
		                            </td>
		                            <td style="text-align: center !important;">${board.rNum}</td>
		                        </tr>
		                    </c:forEach>
		                   </tbody>
		                </table>
            		</c:otherwise>
            	</c:choose>
                <c:if test="${sessionScope.memberId !=null}">
                	<div class="text-right mt-3">
						<a href="QnABoardWrite.do?cmd=write" class="btn btn-primary"> 글작성 </a>
					</div>
                </c:if>
            </div>
        </div>
    </div>


</body>

</html>