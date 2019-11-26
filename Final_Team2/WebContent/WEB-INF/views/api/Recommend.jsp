<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D -->
	<meta charset="UTF-8">
	<c:import url="/common/HeadTag.jsp" />
	<title>코스</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		/* http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList
		?ServiceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D
				&contentTypeId=25&areaCode=&sigunguCode=&cat1=C01&cat2=&cat3=
					&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B&numOfRows=12&pageNo=1&_type=json */
					var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
					var servicekey = "serviceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D";
					var paramArea = "&contentTypeId=12&areaCode=2";
					var paramSigungu = "&sigunguCode=";
					var paramCat = "&cat1=&cat2=";
					var paramList = "&cat3=&listYN=Y";
					var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A";
					var paramNumOfRows = "&numOfRows=3";
					var paramPageNo =  "&pageNo=";
					var type = "&_type=json&";
					var addr2 = servicekey + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
					var api = "";
					
					api = addr + "detailCommon?" + addr2 + "1" + type;
					
					$.getJSON(api,function(data){
						var myData = data.response.body.items.item;
						console.log(myData);
						$.each(myData,function(index,element){
							
							$(".content").append("<table border='1'>")
							$(".content").append("<tr>")
							$(".content").append("<td rowspan='2' colspan='2'><img src=" + element.firstimage2 +"></td><td>&nbsp</td>")
							$(".content").append("<td><b>" + element.title + "</b><br>" + element.addr1 + "</td>")
							$(".content").append("</tr>")
							$(".content").append("<tr>")
							$(".content").append("<td>")
							$(".content").append("</td>")
							$(".content").append("</tr>")
							$(".content").append("<hr >")
							
						});
					});

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
    <div class="content">
        
    </div>
</body>
</html>