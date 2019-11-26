<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<jsp:include page="/common/DataTableTag.jsp"></jsp:include>
<title>여행지 메인</title>
<script type="text/javascript">
$(function(){
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
	var paramArea = "&contentTypeId=12&areaCode=2";
	var paramSigungu = "&sigunguCode=";
	var paramList = "&cat1=&cat2=&cat3=&listYN=Y";
	var paramArrange = "&MobileOS=ETC&MobileApp=AppTest&arrange=A";
	var paramNumOfRows = "&numOfRows=3";
	var paramPageNo =  "&pageNo=1";
	var type = "&_type=json";
	var addr2 = servicekey + paramArea + paramSigungu + paramList + paramArrange+ paramNumOfRows + paramPageNo;
	var api = "";
	 
	api = addr + "areaBasedList?" + addr2 + "1" + type;
	//http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&areaCode=2&sigunguCode=1&eventStartDate=20170901
	
	$.getJSON(api,function(data){
		var myData = data.response.body;
		console.log(myData);
	});		
			
			
			
});

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
 <style type="text/css">
        html,
        body {
            height: 100%;
        }
</style> 
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

</body>
</html>
