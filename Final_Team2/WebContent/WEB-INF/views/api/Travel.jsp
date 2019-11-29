<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<title>여행지 메인</title>
<script type="text/javascript">
$(function(){
	$("#areaSel").change(function(){
		console.log("in");
		getDatas();
	});
	
	function goCourseDetail(ogu) {
		console.log($(ogu).val());
		location.href = "TravellDetail.do?contentId=" + $(ogu).val();
	}
	getDatas("");
});
	
function getDatas(code){
	let areacode = $("#areaSel").val();
	
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
	var paramContentTypeId = "&contentTypeId=12"
	var ParamAreaCode = "&areaCode=";
	var paramAppTest = "&MobileApp=AppTest&MobileOS=ETC";
	var pramArrange = "&arrange=A";
	var paramNumOfRows = "&numOfRows=10";
	var paramPageNo =  "&pageNo=";
	var pramAreaBasedList ="areaBasedList?";
	var type = "&_type=json";
	var pramList = "&listYN=Y";
	
	var api = addr + pramAreaBasedList + servicekey + paramPageNo +"1" +
	          paramNumOfRows + paramAppTest + pramArrange + paramContentTypeId
	          + ParamAreaCode+ areacode + pramList + type; 
		
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
		console.log(myData);
		$("#dataBox").empty();
		$.each(myData,function(index,element){
			$('#dataBox').append(
					"<div class='row'>"
						+"<div class='col-md-3'>"
							+"<img src="+ element.firstimage2 + ">"
						+"</div>"
						+"<div class='col-md-9'>"
							+"<div class='col-md-12'>"
								+ "<a href='TravelDetail.do?contentId="+ element.contentid+"'>" + element.title
							+"</div>"
							+"<div class='col-md-12'>"
								
							+"</div>"
						+"</div>"
					+"</div><hr>"
				);
		});
});
};


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

		<div class="col-md align-items-end">
			<div class="form-group">
				<label for="#"></label>
				<div class="form-field">
					<div class="select-wrap">
						<select name="areaSel" id="areaSel" class="form-control">
							<option value="1">서울</option>
							<option value="31">경기</option>
							<option value="2">인천</option>
						</select>
					</div>
				</div>
			</div>
		</div>

		<div id="dataBox"></div>
		<div class="pagination-sm mt-3 mb-3" style="text-align: center">
			<a href="#" class="btn btn-primary">&laquo;</a> <a href="#"
				class="btn btn-primary">1</a> <a href="#" class="btn btn-primary">2</a>
			<a href="#" class="btn btn-primary">3</a> <a href="#"
				class="btn btn-primary">4</a> <a href="#" class="btn btn-primary">5</a>
			<a href="#" class="btn btn-primary">&raquo;</a>
		</div>
	</div>

</body>
</html>
