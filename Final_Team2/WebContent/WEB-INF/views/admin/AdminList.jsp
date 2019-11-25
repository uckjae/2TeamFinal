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
        .iconColumn {
			width: 100px;
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
            });

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
    <c:import url="/common/Top.jsp"/>

    <!-- Contant -->
    <c:set var="admins" value="${requestScope.admins}" />
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">ADMIN</h1>
            <div class="table-responsive">
                <table class="table table-bordered hover" id="dataTable">
                    <thead>
                        <tr>
                            <th width="10%" >NO</th>
                            <th width="40%" >ID</th>
                            <th width="20%" >NAME</th>
                            <th width="20%" >HIRE DATE</th>
                            <th width="10%"  class="iconColumn" data-orderable="false">EDIT</th>
                            <th width="10%"  class="iconColumn" data-orderable="false">DELET</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="admin" items="${admins}"  varStatus="status" >
                    	<tr>
                            <td align="center">${status.count}</td>
                            <td align="center">${admin.id}</td>
                            <td align="center">${admin.name}</td>
                            <td align="center">${admin.hireDate}</td>
                            <td class="iconColumn">
								<a href="#" data-toggle="modal" data-target="#writeModal"  
										data-cmd="edit"  data-id="${admin.id}" data-name="${admin.name}" data-pwd="${admin.pwd }">
									<i class="fas fa-user-edit"></i>
								</a>
							</td>
							<td class="iconColumn">
								<a href="#" data-toggle="modal" data-target="#deleteModal" data-cmd="admin" data-delete-id="${admin.id}">
									<i class="fas fa-trash-alt"></i>
								</a>
							</td>
                        </tr>
                    </c:forEach>
                   </tbody>
                </table>
               <div class="text-right mt-3">
					<a href="#" data-toggle="modal" data-target="#writeModal" data-cmd="add" class="btn btn-primary"> 추가 </a>
				</div>
            </div>
        </div>
    </div>

	<!-- Delete Modal -->
	<jsp:include page="modal/DeleteModal.jsp"/>
	
	<!-- Write Modal -->
	<jsp:include page="modal/WriteModal.jsp"/>

</body>

</html>