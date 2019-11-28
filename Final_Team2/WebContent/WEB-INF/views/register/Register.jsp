<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <c:import url="/common/HeadTag.jsp" />
    <!-- daum api -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="js/execDaumPostcode.js"></script>
    <title>Main</title>
    <style type="text/css">
    	html, body{
    	height: 100%;
    	}
    	input{
    		width: 100px;
    	}
    </style>
    <script type="text/javascript">
    let emailCode = "";
    let checkEmail = false;
	$(function () {
		$("#openPostCode").click(execDaumPostcode);
		$("#postCode").click(execDaumPostcode);
		$("#sendEmail").click(sendMail);
		$("#checkEmailCode").click(checkEmailCode);
		$("#id").blur(checkId);
		$("form").submit(test);
	})

	function test(){
		console.log("test");
	}
	
	function checkId(){
		if( $("#id").val() == ""){
			return;
		}

		$.ajax({
			url : "CheckMemberId",
			data : {id : $("#id").val()},
			success : function(data){
				if(data == "true"){
					$("#checkId").text("중복된 아이디입니다.")
					$("#checkId").attr("style","color : red");
				}else{
					$("#checkId").text("사용 가능한 아이디입니다.")
					$("#checkId").attr("style","color : green");
				}
				
				$("#checkId").removeAttr("hidden");
			},
			error : function(){
				
			}
		});
	}
	
	function sendMail(){
		if( $("#email").val() == ""){
			return;
		}
		
		$.ajax({
			url : "SendMail",
			data : {cmd : "checkEmail", email : $("#email").val()},
			success : function(data){
				console.log(data);
				emailCode = data;
				$("#emailCodeControl").removeAttr("hidden","");
			},
			error : function(){
				
			}
		});
	}
	
	function checkEmailCode(){
		if(emailCode == $("#emailCode").val()){
			alert("이메일 인증 완료");
		   $("#emailCodeControl").attr("hidden","hidden");
			$("#email").attr("readonly","readonly");
			$("#sendEmail").text("인증 완료");
			$("#sendEmail").attr("disabled","disabled"); 
			checkEmail = true;
		}else{
			alert("이메일 인증 실패");
			checkEmail = false;
		}
	}
	
	function maxLengthCheck(object) {
		if (object.value.length > object.maxLength) {
			object.value = object.value.slice(0, object.maxLength);
		}
	}

	function inNumber() {
		if (event.keyCode < 48 || event.keyCode > 57) {
			event.returnValue = false;
		}
	}

	//1~4까지만
	function inGender() {
		if (event.keyCode < 49 || event.keyCode > 52) {
			event.returnValue = false;
		}
	}
</script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <div class="content">
        <!-- <div class="row justify-content-center pb-5"> -->
          <!--   <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated"> -->
                <h2 class="text-center mb-3">REGISTER</h2>
                <form action="RegisterOk.do" class="search-property-1" method="post">
                    <!-- <div class="row"> -->
                        <div class="col-lg-6 offset-lg-3 mb-3">
                            <div class="form-group">
                                <label for="#">ID</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="id" name="id" placeholder="enter your id" autofocus="autofocus">
                                	<div  id="checkId" hidden></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 offset-lg-3 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">EMAIL</label>
                                <div class="form-field">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="enter your email">
                                	<div class="input-group-append">
							          <button class="btn btn-primary" type="button" id="sendEmail"> 이메일 인증 </button>
							        </div>
                                </div>
                                <div class="form-field" id="emailCodeControl" hidden="hidden">
                                    <input type="text" class="form-control" id="emailCode" name="emailCode" placeholder="check email code">
                                	<div class="input-group-append">
							          <button class="btn btn-primary" type="button" id="checkEmailCode"> 인증 확인 </button>
							        </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 offset-lg-3 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">NAME</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="enter your name" >
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 offset-lg-3 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">PASSWORD</label>
                                <div class="form-field">
                                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="enter your password">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 offset-lg-3  align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">BIRTH</label>
                                <div class="form-field">
                                <div class="row">
                                	<div class="col-lg-6 ">
                                		 <input type="text" class="form-control" id="birth" name="birth" maxlength="6" onkeypress="inNumber()" oninput="maxLengthCheck(this)"> 
                                	</div>
                                	
                                	<div class="col-lg-6 "> 
                                		<input type="text" class="form-control" id="gender" name="gender"  maxlength="1" oninput="maxLengthCheck(this)" onkeypress="inGender()" >
                                	</div>
                                </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 offset-lg-3 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">ADDRESS</label>
                                <input type="number" id="postCode" name="postCode"  class="form-control" placeholder="우편번호" aria-label="Search" aria-describedby="basic-addon2" style="height: 50px" readonly>
						        <div class="input-group-append">
						          <button class="btn btn-primary" type="button" id="openPostCode">
						            <i class="fas fa-search"></i>
						          </button>
						        </div>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="address" name="address" placeholder="주소" readonly>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6 offset-lg-3">
                            <div class="form-group">
                                <div class="form-field">
                                    <input type="submit" value="REGISTER" class="form-control btn btn-primary">
                                </div>
                            </div>
                        </div>
                  <!--   </div> -->
                </form>
            </div>
        <!-- </div> -->
   <!-- </div> -->

</body>

</html>