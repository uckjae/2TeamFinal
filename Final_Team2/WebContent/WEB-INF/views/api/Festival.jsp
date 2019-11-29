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
	var areacode = $("#areaSel").change(function(){
		areacode = $("#areaSel").val();
	});
		console.log(areacode);
	
	function goCourseDetail(ogu) {
		console.log($(ogu).val());
		location.href = "FestivalDetail.do?contentId=" + $(ogu).val();
	}
	
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D";
	var paramArea = "&contentTypeId=15&areaCode=";
	var paramSigungu = "&sigunguCode=";
	var paramCat = "&cat1=&cat2=";
	var paramList = "&cat3=&listYN=Y";
	var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A";
	var paramNumOfRows = "&numOfRows=10";
	var paramPageNo =  "&pageNo=";
	var type = "&_type=json&";
	var addr2 = servicekey + paramArea + areacode + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
	var api = "";
	
	api = addr + "searchFestival?" + addr2 + "1" + type;
	
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
		console.log(myData);
		$.each(myData,function(index,element){
			$('#dataBox').append(
					"<div class='row'>"
						+"<div class='col-md-3'>"
							+"<img src="+ element.firstimage2 + ">"
						+"</div>"
						+"<div class='col-md-9'>"
							+"<div class='col-md-12'>"
								+ "<a href='FestivalDetail.do?contentId="+ element.contentid+"'>" + element.title
							+"</div>"
							+"<div class='col-md-12'>"
								
							+"</div>"
						+"</div>"
					+"</div><hr>"
				);
		});
});
});
</script>
 <style type="text/css">
        html,
        body {
            height: 100%;
        }
        table{
        	border: 1px;
        	border-style: solid;
        }
        img{
        	width: 150px;
        	height: 113px;
        }
</style> 
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
<div class="content">

<div class="col-md align-items-end">
							<div class="form-group">
								<label for="#"></label>
								<div class="form-field">
									<div class="select-wrap">
										<select name="areaSel" id="areaSel" class="form-control" onchange="areaSelFn()">
											<option value="1">서울</option>
											<option value="31">경기</option>
											<option value="2">인천</option>
										</select>
									</div>
								</div>
							</div>
						</div>
<div  id="dataBox"></div>
<div class="pagination-sm mt-3 mb-3" style="text-align:center">
			    <a href="#" class="btn btn-primary">&laquo;</a>
				<a href="#" class="btn btn-primary">1</a>
				<a href="#" class="btn btn-primary">2</a>
				<a href="#" class="btn btn-primary">3</a>
				<a href="#" class="btn btn-primary">4</a>
				<a href="#" class="btn btn-primary">5</a>
				<a href="#" class="btn btn-primary">&raquo;</a>
			</div>
</div>
</body>
</html>