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
	<script type="text/javascript">
	$(function() {
		$("#photo2").change(function(){
			console.log("done");
    		var reader = new FileReader();

    	    reader.onload = function (e) {
    	        // get loaded data and render thumbnail.
    	        document.getElementById("view2").src = e.target.result;
    	    };

    	    // read the image file as a data URL.
    	    reader.readAsDataURL(this.files[this.files.length-1]);
    	});
		$("#photo3").change(function(){
    		var reader = new FileReader();

    	    reader.onload = function (e) {
    	        // get loaded data and render thumbnail.
    	        document.getElementById("view3").src = e.target.result;
    	    };

    	    // read the image file as a data URL.
    	    reader.readAsDataURL(this.files[this.files.length-1]);
    	});
		$("#photo4").change(function(){
    		var reader = new FileReader();

    	    reader.onload = function (e) {
    	        // get loaded data and render thumbnail.
    	        document.getElementById("view4").src = e.target.result;
    	    };

    	    // read the image file as a data URL.
    	    reader.readAsDataURL(this.files[this.files.length-1]);
    	});
		$("#photo5").change(function(){
    		var reader = new FileReader();

    	    reader.onload = function (e) {
    	        // get loaded data and render thumbnail.
    	        document.getElementById("view5").src = e.target.result;
    	    };

    	    // read the image file as a data URL.
    	    reader.readAsDataURL(this.files[this.files.length-1]);
    	});
	});
	
	</script>
<title>나만의 코스 작성</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
	<form id="inputForm" action="MyCourseBoardWriteOk.do" method="post" enctype="multipart/form-data">
	<!-- Vertical Timeline -->
	<div class="content">
  	<div id="conference-timeline">
    <div class="timeline-start"><i id="removeSpot"><span class="icon-minus"></span></i>&nbsp;&nbsp;Start&nbsp;&nbsp;<a id="addSpot"><span  class="icon-plus"></span></a></div>
    <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!-- Article -->
      
      <input type="text" name="title">
      <div class="timeline-article">
        <div class="content-left-container">
            <textarea name="contentarea" form="inform" cols="25" rows="5"></textarea>
             <span class="article-number">01</span>
          <input type="file" id="photo0" name="photo0" accept="image/*">
          <input type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">
        </div>
        
        <div class="meta-date">
			<img class="image2" id="view0" src="images/scenery.png" alt="여행지 사진">
        </div>
      </div>
      <!-- // Article -->
      
      <!-- Article -->
      <div class="content timeline-article">
        
        <div class="content-right-container">
          <textarea name="contentarea" form="inform" cols="25" rows="5"></textarea>
             <span class="article-number">02</span>
          <input type="file" id="photo1" name="photo1" accept="image/*">
          <input type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">
        </div>
        <div class="meta-date">
          <img alt="여행지 사진" id="view1" class="image2" src="images/scenery.png">
        </div>
      </div>
      <!-- // Article -->
   
    
    </div>
    <div class="timeline-end">End</div>
    <input type="submit" class="btn btn-primary btn-block" value="작성하기">
    <input type="reset" class="btn btn-danger btn-block" value="취소하기">
  </div>
  </div>
  <!-- // Vertical Timeline -->
  </form>  
</body>
</html>