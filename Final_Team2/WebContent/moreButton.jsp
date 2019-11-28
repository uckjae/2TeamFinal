<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <c:import url="/common/HeadTag.jsp" />
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="js/sendKaKaoLink.js"></script>
    <script type="text/javascript">

    	function copy(){
    		let link = "localhost/contentId=789";
    		let temp =$("<input type='text'>");
    		$("body").append(temp);
    		temp.val(link).select();
    		document.execCommand("copy");
    		temp.remove();
    		alert("링크가 클립보드로 복사 되었습니다.");
    	}

    	function kakaoLink(){
    		// 파라미터 조합해야함
    		sendKaKaoLink();
    	}
    </script>
</head>
<body>
<div class="dropup">
	<button class="btn btn-default" type="button" data-toggle="dropdown">
		<i class="fas fa-ellipsis-v"></i>
	</button>

    <div class="dropdown-menu">
		<a class="dropdown-item" href="javascript:copy()" >링크 복사</a>	
		<a class="dropdown-item" href="javascript:kakaoLink()" id="kakaoLink">카카오톡으로 공유</a>	
		<a class="dropdown-item" href="#" >내 여행 리스트에 추가</a>	
	</div>
  </div>
</body>
</html>