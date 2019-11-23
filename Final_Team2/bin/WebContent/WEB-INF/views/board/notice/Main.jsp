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

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
 <!-- Top -->
   <c:import url="/common/Top.jsp"/>
    
    <!-- Contant -->
    <div class="content">
       <div class="comment-form-wrap pt-xl-2">
          <h1 class="text-center mb-3 bread">공지사항</h1> 
	      <div class="table-responsive">
	        
	          
	          <table class="table table-bordered" id="dataTable">
                <thead>
                   <tr>
                     <th width="10%">No</th>
                     <th width="70%">제목</th>
                     <th width="10%">작성일</th>
                     <th width="10%">조회수</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                       <td width="10%">1</td>
                       <td width="70%">어쩌구</td>
                       <td width="10%">11-09</td>
                       <td width="10%">100</td>
                     </tr>
                </tbody>
             </table>
             <div class="text-center">
                 <a class="d-block small mt-3" href="NoticeBoardWrite.do">글쓰기</a>
              </div>    
          
	    </div>
	  </div>
    </div>
	  
</body>
</html>