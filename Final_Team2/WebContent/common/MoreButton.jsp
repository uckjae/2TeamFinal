<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="js/sendKaKaoLink.js"></script>
<script type="text/javascript">	
 	function copy() {
 		let temp =$("<input type='text'>");
 		$("body").append(temp);
 		temp.val($(location).attr('href')).select();
 		document.execCommand("copy");
 		temp.remove();
 		alert("링크가 클립보드로 복사 되었습니다.");
 	}

 </script>
</head>
<body>
<div class="col-2" style="align-self: center;">
	<div class="dropup text-right" id="more">
		<button class="btn btn-default " type="button" data-toggle="dropdown">
			<i class="fas fa-ellipsis-v" style="font-size: 1.5em;"></i>
		</button>
	    <div class="dropdown-menu ">
			<a class="dropdown-item" href="javascript:copy()" >링크 복사</a>	
			<a class="dropdown-item" href="javascript:sendKaKaoLink()" id="kakaoLink">카카오톡으로 공유</a>	
			<a class="dropdown-item" href="#" >내 여행 리스트에 추가</a>	
		</div>
	</div>
</div>
</body>
</html>