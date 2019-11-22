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
    </style>
<script>
	$(function() {
		let table = $('#dataTable').DataTable();

		$('#dataTable_filter').prepend(
				'<select id="select" class="custom-select" style="margin-right : 10px; width: 100px"></select>');

		// 검색 th 칼럼 별로 할 수 있게 select 생성
		let ths = $('#dataTable > thead > tr > th');
		ths.each(function(index, element) {
			if (index < 2) // 앞에 두개만
				$('#select').append(
						'<option>' + element.innerHTML + '</option>');
		});

		// select에 따라 검색 결과 table에 표현
		$('.dataTables_filter input').keyup(function() {
			tableSearch();
		});

		$("#deptSelect").change(function() {
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
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread"> 자유 게시판 </h1>
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>TITLE</th>
                            <th>DATE</th>
                            <th>WRITER</th>
                            <th>READNUM</th>
                            <th class="iconColumn" data-orderable="false">EDIT</th>
                            <th class="iconColumn" data-orderable="false">DELETE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="sorting_1"><a href="#">1</a></td>
                            <td>HelloWorld</td>
                            <td>19/11/22</td>
                            <td>Mr.uck</td>
                            <td>777</td>
                            <td class="iconColumn">
                                <a href="#">
                                    <i class="fas fa-user-edit"></i>
                                </a>
                            </td>
                            <td class="iconColumn">
                                <a href="#" data-toggle="modal" data-target="#deleteModal" data-delete-id="">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <a href="WEB-INF/views/board/free/Write.jsp">
            	<input type="button" value="글쓰기" id="fboad" name="fboard">
            </a>
        </div>
    </div>
</body>
</html>

