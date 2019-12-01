<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--  모달창 첫 화면 -->	
<div class="modal fade" id="myTravelListModalIntro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
      
        <div class="modal-body" id="innerModalIntro">  
          <form id="frm" method="post"> 			 
			 <input  name="spotName" type="hidden" class="spotName">
			 <input  name="mTLimage" type="hidden" class="mTLimage">
			 <input  name="spotDate" type="hidden" class="spotDate">
			 <input  name="spotAddr" type="hidden" class="spotAddr">
			 <input  name="spotLink" type="hidden" class="spotLink">
		  </form>    
        </div>
        <div class="modal-footer">
        <!-- <input type="submit" class="btn btn-primary" value="여행리스트에 추가하기 ">  -->
       <button id="deletebtn" class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
        </div>
       
      </div>
    </div>
  </div>	
<!-- 모달창  폴더 -->

</body>
</html>