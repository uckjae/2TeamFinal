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
    <script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
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
	/* 정규식 */
    let getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/); // id / pwd
	let getEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); // email
	let getName= RegExp(/^[가-힣]+$/); // 이름
	let getJumin = RegExp(/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))/); // 주민번호 앞자리
	
    let emailCode = "";
    let checkEmail = false;
    let checkId = false;
    let checkName = false;
    let checkPwd = false;
    let checkBirth = false;
    let checkAddress = false;
    
	$(function () {
		$("#openPostCode").click(execDaumPostcode);
		$("#postCode").click(execDaumPostcode);
		$("#sendEmail").click(sendMail);
		$("#checkEmailCode").click(checkEmailCode);

		$("#id").on('keyup',validateId);
		$("#name").on('keyup',validateName);
		$("#pwd").on('keyup',validatePwd);
		$("#birth").on('keyup',validateBirth);
		$("form").submit(validate);
	})
	
	function validateBirth(){
		if( $("#birth").val() == ""){
			checkBirth = false;
			return;
		}
		
		checkBirth = getJumin.test($("#birth").val());
		if(checkBirth){
			checkBirth = true;
			$("#gender").focus();
			$("#checkBirth").attr("hidden","hidden");
		}else{
			checkBirth = false;
			$("#checkBirth").removeAttr("hidden");
			$("#checkBirth").text("주민등록번호 앞자리가 형식에 맞지 않습니다.");
			$("#checkBirth").attr("style","color : red");
		}
	}
	
	function validateName(){
		if( $("#name").val() == ""){
			checkName = false;
			return;
		}
		
		checkName = getName.test($("#name").val());
		if(checkName){
			checkName = true;
			$("#checkName").attr("hidden","hidden");
		}else{
			checkName = false;
			$("#checkName").removeAttr("hidden");
			$("#checkName").text("이름을 다시 확인해주세요.");
			$("#checkName").attr("style","color : red");
		}
	}
	
	function validatePwd(){
		if( $("#pwd").val() == ""){
			checkPwd = false;
			return;
		}
		
		checkPwd = getCheck.test($("#pwd").val());
		if(checkPwd){
			checkPwd = true;
			$("#checkPwd").attr("hidden","hidden");
		}else{
			checkPwd = false;
			$("#checkPwd").removeAttr("hidden");
			$("#checkPwd").text("형식에 맞지않는 비밀번호입니다.");
			$("#checkPwd").attr("style","color : red");
		}
	}
	
	function validateId(){
		let id = document.getElementById("id");
		if( $("#id").val() == ""){
			checkId = false;
			return;
		}
		
		checkId = getCheck.test($("#id").val())
		if(!checkId) {
			$("#checkId").text("형식에 맞지 않는 아이디입니다");
			$("#checkId").attr("style","color : red");
			$("#checkId").removeAttr("hidden");
			return;
		}
		
		$.ajax({
			url : "CheckMemberId",
			data : {id : $("#id").val()},
			success : function(data){
				if(data == "true"){
					checkId = false;
					$("#checkId").text("중복된 아이디입니다.");
					$("#checkId").attr("style","color : red");
				}else {
					checkId = true;
					$("#checkId").text("사용 가능한 아이디입니다.");
					$("#checkId").attr("style","color : green");
				}
				
				$("#checkId").removeAttr("hidden");
			}
		});
	}
	
	function sendMail(){
		if( $("#email").val() == ""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return;
		}
		
		$.ajax({
			url : "SendMail",
			data : {cmd : "checkEmail", email : $("#email").val()},
			success : function(data){
				console.log(data);
				emailCode = data;
				$("#emailCodeControl").removeAttr("hidden","");
			}
		});
	}
	
	function checkEmailCode(){
		if(emailCode == $("#emailCode").val()){
			Swal.fire({
				  icon: 'success',
				  title: '이메일 인증 성공',
				  showConfirmButton: false,
				  timer: 1500
				}).then(function(){
					 $("#emailCodeControl").attr("hidden","hidden");
					 $("#email").attr("readonly","readonly");
					 $("#sendEmail").text("인증 완료");
					 $("#sendEmail").attr("disabled","disabled"); 
					 checkEmail = true;
				})
		}else{
			Swal.fire({
				  icon: 'error',
				  title: '이메일 인증 실패',
				  showConfirmButton: false,
				  timer: 1500
				}).then(function(){
					checkEmail = false;
				})
			
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
	
	function validate() {
		checkBirth = getJumin.test($("#birth").val());
		if($("#gender").val()=="")
			checkBirth = false;

		if($("#postCode").val()=="")
			checkAddress=false;
		else
			checkAddress=true;
		
	   if(!(checkEmail && checkId && checkName && checkPwd && checkBirth && checkAddress)){
		   Swal.fire({
				  icon: 'error',
				  title: '입력 내용을 확인해주세요.',
				  showConfirmButton: false,
				  timer: 1500
				})
		 	return false;
		} 
	}
</script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <div class="container mt-7">
        <!-- <div class="row justify-content-center pb-5"> -->
          <!--   <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated"> -->
                <h2 class="text-center mb-3">REGISTER</h2>
                <form action="RegisterOk.do" class="search-property-1" method="post" name="form">
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
                        <div class ="row">
                        <div class="col-lg-4 offset-lg-3 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">EMAIL</label>
                                <div class=" form-field">                             
                                    <input type="email" class="form-control" id="email" name="email" placeholder="enter your email">
                      				       
                                </div>
                              </div> 				       
                           </div>  
                                
                           <div class="col-lg-2 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">&nbsp;</label>
                                <div class=" form-field">                             
							          <button class="btn btn-primary form-control" type="button" id="sendEmail"> 이메일 인증 </button>				       
                                </div>
                              </div> 				       
                           </div>     
                        </div>
                                  
                        <div class ="row">
                        <div class="col-lg-4 offset-lg-3 align-items-end mb-3">
                            <div class="form-group">
                                <div class=" form-field" id="emailCodeControl" hidden="hidden">                             
                                    <input type="email" class="form-control" id="emailCode" name="emailCode" placeholder="check email code"> 				       
                                </div>
                              </div> 				       
                           </div>  
                                
                           <div class="col-lg-2 align-items-end mb-3">
                            <div class="form-group">
                                <div class="input-group-append form-field">                             
							          <button class="btn btn-primary form-control" type="button"id="checkEmailCode"> 인증 확인 </button>				       
                                </div>
                              </div> 				       
                           </div>     
                        </div>          
                                  
                                  
                                  
                                  
                                  
<!--                                  <div class="col-lg-2 align-items-end mb-3">
                                <div class="form-field" id="emailCodeControl" hidden="hidden">
                                    <input type="text" class="form-control" id="emailCode" name="emailCode" placeholder="check email code">
                                	<div class="input-group-append">
							          <button class="btn btn-primary" type="button" id="checkEmailCode"> 인증 확인 </button>
							        </div>
                                </div>
                            </div> -->
                        
                          
                          
                        <div class="col-lg-6 offset-lg-3 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">NAME</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="enter your name" >
                                    <div  id="checkName" hidden></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 offset-lg-3 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">PASSWORD</label>
                                <div class="form-field">
                                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="enter your password">
                                    <div  id="checkPwd" hidden></div>
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
                                		 <div  id="checkBirth" hidden></div>
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