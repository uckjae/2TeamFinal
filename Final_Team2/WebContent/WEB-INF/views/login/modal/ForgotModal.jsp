<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <c:import url="/common/HeadTag.jsp" />
 <style type="text/css">
 .half{
	display:inline-block;
	padding-top:5px;padding-bottom:5px;
	width:50%;
	width:50%;
	float:left;
}
 </style>
<script type="text/javascript">

	$(function() {
		$("#sendId").click(function() {
			$.ajax({
				url : "SendMail",
				data : { cmd : "forgotId", email : $("#email").val()},
				success : function(data){
					if(data == 'true'){
						successAlert('메일이 발송되었습니다.');
					}else{
						warningAlert(data);
					}
				},
				error:function(){
					errorAlert("메일발송에 실패했습니다.");
				}
			})
		})

		$("#sendPwd").click(function() { 
			console.log($("#id1").val());
			$.ajax({
				url : "SendMail",
				data : { cmd : "forgotPwd", id : $("#id1").val()},
				success : function(data){
					if(data == 'true'){
						successAlert('임시 비밀번호가 메일로 발송되었습니다.');
					}else{
						warningAlert(data);
					}
				},
				error:function(){
					errorAlert("메일발송에 실패했습니다.");
				}
			})
		})
	});
</script>
</head>
<body>
	<div class="modal fade" id="forgotModal" tabindex="-1" role="dialog"> 
		<div class="modal-dialog">
    <div class="modal-content">
      <ul class="nav nav-tabs" >
        <li class="nav-item half"><a data-toggle="tab" href="#idTab" class="nav-link active">Forgot ID</a></li>
        <li class="nav-item half"><a data-toggle="tab" href="#pwdTab" class="nav-link">Forgot PASSWORD</a></li>
      </ul>
      <div class="tab-content">
      
      <!-- Id Tab -->
        <div id="idTab" class="tab-pane active">
          <div class="modal-body">
              <div class="form-group">
                <label for="email" class="control-label col-xs-2">E-mail</label>
                <div class="col-xs-10">
                  <input type="email" class="form-control" id="email" name="email" required>
                </div>
              </div>
              <div class="form-group">
                <div class="col-xs-offset-2 col-xs-10">
                  <p class="text-danger" id="reg-error"></p>
                </div>
              </div>
            
          </div>
          <div class="modal-footer">
            <input type="button" id="sendId" class="btn btn-primary" value="SEND">
          </div> 
        </div>
        
        <!-- Password Tab -->
        <div id="pwdTab" class="tab-pane fade">
          <div class="modal-body">
              <div class="form-group">
                <label for="mid" class="control-label col-xs-2">ID</label>
                <div class="col-xs-10">
                  <input type="text" class="form-control" id="id1" name="id" required>
                </div>
              </div>
              <div class="form-group">
                <div class="col-xs-offset-2 col-xs-10">
                  <p class="text-danger" id="reg-error"></p>
                </div>
              </div>
            
          </div>
          <div class="modal-footer">
            <input type="button" id="sendPwd" class="btn btn-primary" value="SEND">
          </div>           
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>