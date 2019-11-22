<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        .center {
		  text-align: center;
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

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <c:set var="qnalist" value="${requestScope.qnalist}"/>
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">Q & A</h1>
            <div class="table-responsive">
                <table class="table table-bordered hover" id="dataTable">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>TITLE</th>
                            <th>WRITE DATE</th>
                            <th>WRITER</th>
                            <th>VIEWS</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="board" items="${qnalist }">
                    	<tr>
                            <td>${board.qIdx}</td>
                            <td class="sorting_1"><a href="#">${board.title}</a></td>
                            <td>${board.wDate}</td>
                            <td>${board.id}</td>
                            <td>${board.rNum}</td>
                        </tr>
                    </c:forEach>
                   </tbody>
                </table>
				<div class="text-right">
				<a href="QnABoardWrite.do?cmd=write&memberId" class="btn btn-primary"> 글작성 </a>
				</div>
            </div>
        </div>
    </div>


</body>

</html>