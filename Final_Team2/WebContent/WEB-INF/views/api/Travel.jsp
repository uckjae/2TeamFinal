<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<title>여행지 메인</title>
<style type="text/css">
	/* a {
		/* font-family: 'Jua', sans-serif; */
		 font-family: 'Nanum Pen Script', cursive; 
		font-size: 25px;
	} */

</style>
<script type="text/javascript">

	let contentCount = 10; // 한번에 로드되는 api 데이터 갯수
	let pageNo = 1;
	let paging = false;
	let pagingStop = false;
	$(function(){
		getDatas();
		
		$("#areaSel").change(function(){
			pageNo = 1;
			paging = false;
			pagingStop = false;
			$("#dataBox").empty();
			getDatas();
		});
		
		$(window).scroll(function(){
            let $window = $(this);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            
            // scrollbar의 thumb가 바닥 전 20px까지 도달 하면 리스트를 가져온다.
            if( scrollTop + windowHeight + 20 > documentHeight ){
                getDatas();
            }
        })
	});
	
	function goCourseDetail(ogu) {
		location.href = "TravellDetail.do?contentId=" + $(ogu).val();
	}

	function getDatas(){
		let areacode = $("#areaSel").val();
		
		if (pagingStop || (pageNo!=1 && paging))
			return;
		
		paging = true;
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
		var paramContentTypeId = "&contentTypeId=12"
		var ParamAreaCode = "&areaCode=";
		var paramAppTest = "&MobileApp=AppTest&MobileOS=ETC";
		var pramArrange = "&arrange=A";
		var paramNumOfRows = "&numOfRows=" + contentCount;
		var paramPageNo = "&pageNo=" + pageNo;
		var pramAreaBasedList = "areaBasedList?";
		var type = "&_type=json";
		var pramList = "&listYN=Y";

		var api = addr + pramAreaBasedList + servicekey + paramPageNo
				+ paramNumOfRows + paramAppTest + pramArrange
				+ paramContentTypeId + ParamAreaCode + areacode + pramList
				+ type;
		
		$.getJSON(api, function(data) {
			var myData = data.response.body.items.item;
			if (myData != undefined && myData.length > 0) {
				++pageNo;
				$.each(myData, function(index, element) {
					let imagePath = (element.firstimage2 == undefined)?"./images/notImage.jpg":element.firstimage2;
					$('#dataBox').append(
							"<div class='row'>" + "<div class='col-md-3'>"
									+ "<img src="+ imagePath + ">"
									+ "</div>" + "<div class='col-md-9'>"
									+ "<div class='col-md-12'>"
									+ "<a href='TravelDetail.do?contentId="
									+ element.contentid + "'><h2>" + element.title
									+ "</h2></div>" + "<div class='col-md-12'>"
									+ "</div>" + "</div>" + "</div><hr>");
				});
				paging = false;	
			} else {
				pagingStop = true;
				paging = false;	
			}
		});
	}
</script>
<style type="text/css">
html, body {
	height: 100%;
}

table {
	border: 1px;
	border-style: solid;
}

img {
	width: 150px;
	height: 113px;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<!-- Top -->
	<c:import url="/common/Top.jsp" />
	<div class="content">
		<form action="#" class="search-property-1" style="margin-bottom: 10px;">
		<div class="col-md align-items-end" style="padding: 0;">
			<div class="form-group">
				<label for="#"></label>
				<div class="form-field">
					<div class="select-wrap font-pen font-size-25">
						<select name="areaSel" id="areaSel" class="form-control">
							<option value="1">서울</option>
							<option value="31">경기</option>
							<option value="2">인천</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</form>
		<div id="dataBox"></div>
	</div>

</body>
</html>
