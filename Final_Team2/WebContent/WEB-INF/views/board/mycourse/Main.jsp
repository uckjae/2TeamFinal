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
            console.log("ddd");
            console.log('${sessionScope.memberId}');
        });
        
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Content -->
    <c:set var="MCBList" value="${requestScope.MCBList}"/>
    <c:set var="photoList" value="${requestScope.photoList}"/>
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
        	<div class="col-md-12 heading-section text-center ftco-animate fadeInUp ftco-animated">
            	<h1 class="mb-3 bread">나만의 코스</h1>
        	</div>
        	<div class="row">
        		<c:forEach var="photo" items="${photoList}">
        			<div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">
        				<div class="project">
        					<div class="img">
        						<img class="img-fluid" src="upload/${photo.photoName}" alt="코스 대표 사진" onError="this.src='images/scenery.png'">
        					</div>
        					<c:forEach var="board" items="${ MCBList}">
        						<c:if test="${photo.bIdx eq board.bIdx}">
        							<div class="text">
        								<h4 class="price">
        									<span class="mr-2">추천수</span>
        									${board.likeNum}
        								</h4>
        								<h3>
        									<a onclick="checkReadBoad(${sessionScope.memberId!=null} ,${board.bIdx}, 'MyCourseBoardDetail.do')" href="#">${board.title}</a>
        								</h3>
        							</div>
        						</c:if>
        					</c:forEach>
        				</div>
        			</div>
        		</c:forEach>
        	</div>
            <div class="table-responsive">
            	<c:choose>
            		<c:when test="${MCBList.size() < 1 }">
           				<jsp:include page="../common/NoBoard.jsp"/>
           			</c:when>
            		<c:otherwise>
            			<table class="table table-bordered hover" id="dataTable">
		                   <thead>
		                       <tr>
		                           <th width="10%">NO</th>
		                           <th>TITLE</th>
		                           <th width="15%">WRITER</th>
		                           <th width="15%">DATE</th>
		                           <th width="10%">조회수</th>
		                           <th width="10%">추천수</th>
		                       </tr>
		                   </thead>
		                   <tbody>
		                   <c:forEach var="board" items="${MCBList}">
		                   	<tr>
		                           <td style="text-align: center !important;">${board.bIdx}</td>
		                           <td class="sorting_1"><a onclick="checkReadBoad(${sessionScope.memberId!=null},${board.bIdx}, 'MyCourseBoardDetail.do')" href="#">${board.title}</a></td>
		                           <td style="text-align: center !important;">${board.id}</td>
		                           <td style="text-align: center !important;">
		                           	<fmt:formatDate value="${board.wDate}" pattern="yyyy-MM-dd   HH:mm:ss" />
		                           </td>
		                           <td style="text-align: center !important;">${board.rNum}</td>
		                           <td style="text-align: center !important;">${board.likeNum}</td>
		                       </tr>
		                   </c:forEach>
		                  </tbody>
		               </table>
            		</c:otherwise>
           		</c:choose>
                
                <c:if test="${sessionScope.memberId !=null}">
                	<div class="text-right mt-3">
						<a href="MyCourseBoardWrite.do?cmd=write" class="btn btn-primary"> 글쓰기 </a>
					</div>
                </c:if>
            </div>
        </div>
    </div>


</body>

</html>