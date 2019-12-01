<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- https://codepen.io/uckjae/pen/WNNmMEO (타임라인 참조사이트링크) -->
	<c:import url="/common/HeadTag.jsp" />
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/timeLine.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="js/timeline.js"></script>
	<script>    
 
    // 특수문자 정규식 변수(공백 미포함)
    var replaceChar = /╊/gi;
 
    // 완성형 아닌 한글 정규식
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
    
    $(document).ready(function(){
        
        $(".input").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                    x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
                }
                $(this).val(x);
            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));

       });

    });       
    
    function validatingSubmit(){
    	var inputs = $('body').find('input');
    	var isValidated = true;
    	$.each(inputs, function(index, element) {
    		if($(element).val()==null || $(element).val()==""){
    			isValidated = false;
    			
    		}
    	});
    	if(isValidated){
    		$("#inputForm").submit();
    	}else{
    		errorAlert("제목, 내용 , 사진을 모두 입력하세요");
    	}
    }
 
</script>
	
	<title>나만의 코스 작성</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<c:set var="board" value="${requestScope.mCBoard}"/>
	<c:choose>
		<c:when test="${board.bIdx > 0}">
			<c:set var="isEdit" value="true"/>
		</c:when>
		<c:otherwise>
			<c:set var="isEdit" value="false"/>
		</c:otherwise>
	</c:choose>
    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    
	<form id="inputForm" name="inputForm" action="MyCourseBoardWriteOk.do?cmd=
            	<c:choose>
                	 <c:when test="${isEdit}">edit</c:when>
                	<c:otherwise>write </c:otherwise>
                </c:choose>" method="post" enctype="multipart/form-data">
	<!-- Vertical Timeline -->
	<div class="content">
	
	<c:choose>
		<c:when test="${board.bIdx > 0}">
			<div id="conference-timeline">
				<div class="row">
					<div class="text-left">
						<span>글번호 : <input type="number" id="bIdx" name="bIdx" value="${board.bIdx}" readonly="readonly"></span>
						<input type="hidden" id="mCIdx" name="mCIdx" value="${board.mCidx}">
						<input type="hidden" id="rNum" name="rNum" value="${board.rNum }">
						<input type="hidden" id="likeNum" name="likeNum" value="${board.likeNum}">
						&nbsp;&nbsp;
						<span>작성자 : &nbsp;&nbsp;${board.id }</span>
					</div>
					<input type="text" class="form-control mb-3 input" id="title" name="title" value="${board.title}">
				</div>
				<div class="timeline-start"><i id="removeSpot"><span class="icon-minus"></span></i>&nbsp;&nbsp;Start&nbsp;&nbsp;<a id="addSpot"><span  class="icon-plus"></span></a></div>
				<div class="conference-center-line"></div>
	    		<div class="conference-timeline-content">
				<c:forEach var="photo" items="${board.photoList}" varStatus="status1">
					<c:choose>
			      		<c:when test="${status1.index%2 != 1}">
			      			<c:set var="number" value="${status1.index }"/>
			      			<div class="timeline-article">
			      				<div class="content-left-container">
										<textarea class="input" name="area" cols="25" rows="5" required>
											${board.contentsList[number*2]}
										</textarea>
										<span class="article-number">${number+1}</span>
									<input type="file" id="photo${number}" name="photo${number}" accept="image/*" value="upload/${photo.photoName}" required>
									<input class = "input" type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;" value="${board.contentsList[number*2+1]}" required>
									<div class="meta-date">
										<img class="image2" id="view${number}" src="upload/${photo.photoName }" alt="여행지사진" onError="this.src='images/scenery.png'">
									</div>
			      				</div>
			      			</div>
			      		</c:when>
			      		<c:otherwise>
			      			<c:set var="number" value="${status1.index}"/>
			      			<div class="timeline-article">
			      				<div class="content-right-container">
										<textarea class="input" name="area" cols="25" rows="5" required style="margin-left: 80px;">
											${board.contentsList[number*2]}
										</textarea>
										<span class="article-number">${number+1}</span>
									<input type="file" id="photo${number}" name="photo${number }" accept="image/*" value="upload/${photo.photoName}" required>
									<input class = "input" type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;" value="${board.contentsList[number*2+1]}" required>
									<div class="meta-date">
										<img class="image2" id="view${number}" src="upload/${photo.photoName }" alt="여행지사진" onError="this.src='images/scenery.png'">
									</div>
			      				</div>
			      			</div>
			      			
			      		</c:otherwise>
			      	</c:choose>
				</c:forEach>
				</div>
				<div class="timeline-end">End</div>
    	  <input type="button" onclick="validatingSubmit()" class="btn btn-primary btn-block" value="작성하기">
          <input type="reset" class="btn btn-danger btn-block" value="취소하기" onclick="location.href='MyCourseBoardList.do'">
			</div>
		</c:when>
		<c:otherwise>
			<input type="text" class="form-control mb-3 input" id="title" name="title" placeholder="글 제목" value="${mCBoard.title }">
  			<div id="conference-timeline">
	    		<div class="timeline-start"><i id="removeSpot"><span class="icon-minus"></span></i>&nbsp;&nbsp;Start&nbsp;&nbsp;<a id="addSpot"><span  class="icon-plus"></span></a></div>
	   			<div class="conference-center-line"></div>
	    		<div class="conference-timeline-content">
		      		<!-- Article -->
		      
				    <div class="timeline-article">
					    <div class="content-left-container">
					        <textarea class = "input" name="area" cols="25" rows="5"></textarea>
					        <span class="article-number">01</span>
					        <input type="file" id="photo0" name="photo0" accept="image/*">
					        <input class = "input" type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">
					    </div>
			        	<div class="meta-date">
							<img class="image2" id="view0" src="images/scenery.png" alt="여행지 사진">
			        	</div>
				    </div>
				    <!-- // Article -->
		      
				    <!-- Article -->
				    <div class="content timeline-article">
				        <div class="content-right-container">
				          <textarea class = "input" id="area" name="area" cols="25" rows="5" style="margin-left: 80px;"></textarea>
				          <span class="article-number">02</span>
				          <input type="file" id="photo1" name="photo1" accept="image/*">
				          <input class = "input" type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">
				        </div>
				        <div class="meta-date">
				          <img alt="여행지 사진" id="view1" class="image2" src="images/scenery.png">
				        </div>
				    </div>
				    <!-- // Article -->
		      </div>
    	  <div class="timeline-end">End</div>
    	  <input type="button" onclick="validatingSubmit()" class="btn btn-primary btn-block" value="작성하기">
          <input type="reset" class="btn btn-danger btn-block" value="취소하기" onclick="location.href='MyCourseBoardList.do'">
 		 </div>
  
  <!-- // Vertical Timeline -->
		</c:otherwise>
	</c:choose>
	</div>
	
  </form>  
</body>
</html>