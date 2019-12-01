<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <!DOCTYPE html>
<html>

<head>
    <c:import url="/common/HeadTag.jsp" />
    <!-- daum api -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="js/execDaumPostcode.js"></script>
    <title>내 정보 조회</title>
    <style type="text/css">
    	html, body{
    	height: 100%;
    	}
    	input{
    		width: 100px;
    	}
    </style>
    <script type="text/javascript">
    	$(function(){
    		$("#okBox").css("display","none");
    		$("#cancelBox").css("display","none");
    		$("#editAddressBox").css("display","none");
    		$("input").attr("readonly", "readonly");
			$("#frm").attr("action", "MemberList.do");
			$(":checkbox").attr("disabled", "disabled");
    		
    		$("#postCode").attr("readonly", "readonly");
    		$("#address").attr("readonly", "readonly");
    		$("input:radio").attr("disabled", "disabled");
    		$("input:submit").removeAttr("disabled"); 
    	})
    	
    	function editMember(){
    		$("#header").text("Edit My Information");	
    		$("#okBox").css("display","block");
    		$("#cancelBox").css("display","block");
    		$("#detailAddressBox").css("display","none");
    		
    		$("#editAddressBox").css("display","block");
    		$("#editBox").css("display","none");
    		$("#outBox").css("display","none");
    		
    		$("input").removeAttr("readonly");
    		$("#frm").attr("action", "MemberEditOk.do?cmd=user");
    		
			$("#id").attr("readonly", "readonly");
			$("#email").attr("readonly", "readonly");
			$("#birth").attr("readonly", "readonly"); 
			$("#postCode").attr("readonly", "readonly");
    		$("#address").attr("readonly", "readonly");
			
    		$("#openPostCode").click(execDaumPostcode);
			$("#postCode").click(execDaumPostcode);
    		
    		// 페이지 맨 위로 이동
    		$("html").animate({ scrollTop: 0 }, 250);
    	}
    	
    	function delMember(){
    		//let href = "MemberDelete.do?cmd=myInfo&id=" + deleteId;
    		Swal.fire({
  			  title: '정말로 탈퇴 하시겠습니까?',
  			  icon: 'warning',
  			  showCancelButton: true,
  			  confirmButtonColor: '#3085d6',
  			  cancelButtonColor: '#d33',
  			  confirmButtonText: 'Yes'
  			}).then((result) => {
  			  if (result.value) {
  				checkPassword();
  			  }
  			})
    	}

    	function checkPassword(){
    		(async () => {
    			const { value: password } = await Swal.fire({
    			  title: '비밀번호를 입력해 주세요',
    			  input: 'password',
    			  inputPlaceholder: 'Enter your password',
    			  inputAttributes: {
    			    maxlength: 10,
    			    autocapitalize: 'off',
    			    autocorrect: 'off'
    			  }
    			})
    			
    			 if (password == ${member.pwd }) {
    				 $.ajax({
    					 url : "OutMember",
    					 type:'POST',
    					 success : function(data){
    						 console.log(data);
    						 if(data){
    							 Swal.fire({
    			    				  title: '탈퇴 완료',
    			    				  text : '메인 화면으로 이동합니다.',
    			    				  showConfirmButton: false,
    			    				  timer: 2000
    			    			  }).then(function() {
    			    				  location.href = 'index.jsp';
    			    			  })
    						 }
    						 else{
    							 Swal.fire({
    			      				  title: '탈퇴 실패',
    			      				  showConfirmButton: false,
    			      				  timer: 1000
    			      			  })
    						 }
    					 },
    					 error : function( jqXHR, text, exception){
    						 Swal.fire({
			      				  title: text,
			      				  showConfirmButton: false,
			      				  timer: 1000
			      			  })
    					 }
    				 })
    			} else{
    				Swal.fire({
      				  title: '탈퇴 실패',
      				  text : '비밀번호가 일치하지 않습니다.',
      				  showConfirmButton: false,
      				  timer: 1000
      			  })
    			}
    			})( )
    	}
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <c:set var="member" value="${requestScope.member}" />
	<div class="content-center">
		<div class="row justify-content-center pb-5">
			<div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
				<h2 class="text-center mb-3" id="header">My Information </h2>
				<form id="frm" class="search-property-1" method="post">
					<div class="row">
						<div class="col-lg-12  mb-3">
							<div class="form-group">
								<label for="#">ID</label>
								<div class="form-field">
									<input type="text" class="form-control" id="id" name="id"
										value="${member.id }" readonly>
								</div>
							</div>
						</div>
						<div class="col-lg-12 align-items-end mb-3">
							<div class="form-group">
								<label for="#">EMAIL</label>
								<div class="form-field">
									<input type="email" class="form-control" id="email"
										name="email" value="${member.email }">
								</div>
							</div>
						</div>
						<div class="col-lg-12 align-items-end mb-3">
							<div class="form-group">
								<label for="#">NAME</label>
								<div class="form-field">
									<input type="text" class="form-control" id="name" name="name"
										value="${member.name }">
								</div>
							</div>
						</div>
						<div class="col-lg-12 align-items-end mb-3">
							<div class="form-group">
								<label for="#">PASSWORD</label>
								<div class="form-field">
									<input type="password" class="form-control" id="pwd" name="pwd"
										value="${member.pwd }">
								</div>
							</div>
						</div>
						<div class="col-lg-12 align-items-end mb-3">
							<div class="form-group">
								<label for="#">BIRTH</label>
								<div class="form-field">
									<input type="text" class="form-control" id="birth" name="birth"
										value="${member.birth }" readonly>
								</div>
							</div>
						</div>
						<div class="col-lg-12 align-items-end mb-3">
							<div class="form-group">
								<label for="#">Gender</label>
								<div class="form-field">
									<div class="col-lg-6">
										<input type="radio" class="form-check-input" id="gender"
											name="gender" value="0"
											<c:if test="${! member.gender}">checked</c:if> disabled>남
									</div>
									<div class="col-lg-6">
										<input type="radio" class="form-check-input" id="gender"
											name="gender" value="1"
											<c:if test="${ member.gender}">checked</c:if> disabled>여
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-12 align-items-end mb-3">
							<div class="form-group">
								<label for="#">ADDRESS</label>
								<c:set var="address" value="${fn:split(member.address, '/')}" />
								<div class="form-field" id="detailAddressBox">
                                	<div class="row">
	                                	<div class="col-lg-3">
	                                	   <input type="number" id="dPostCode" name="dPostCode" value="${address[0]}"  class="form-control"  aria-label="Search" aria-describedby="basic-addon2" style="height: 50px" >
	                                	</div>
	                                	<div class="col-lg-9"> 
	                                		<input type="text" class="form-control" id="dAddress" name="dAddress" value="${address[1] }" >
	                                	</div>
	                                </div>
                                </div>
								<div id="editAddressBox">
									<input type="number" id="postCode" name="postCode" class="form-control" aria-label="Search" aria-describedby="basic-addon2"
											value="${address[0]}"style="height: 50px" >
									<div class="input-group-append">
										<button class="btn btn-primary" type="button" id="openPostCode">
											<i class="fas fa-search"></i>
										</button>
									</div>
									<div class="form-field">
										<input type="text" class="form-control" id="address" name="address" value="${address[1] }">
									</div>
								</div>
							</div>
						</div>
						
						<input type="hidden" id="disable" name="disable" value="${member.disable?1:0}"> 

						<div class="col-md-6 align-self-end" id="editBox">
							<div class="form-group">
								<div class="form-field ">
									<input  type="button" class="btn btn-primary  form-control" onclick="editMember()" value="수정"> 
								</div>
							</div>
						</div>
						
						<div class="col-md-6 align-self-end" id="outBox">
							<div class="form-group">
								<div class="form-field">
									<input  type="button" class="btn  form-control" onclick="delMember()" value="탈퇴">  
								</div>
							</div>
						</div>
						
						<div class="col-md-6 align-self-end" id="okBox">
							<div class="form-group">
								<div class="form-field ">
									<input  type="submit" class="btn btn-primary  form-control" id="okBtn" value="확인"> 
								</div>
							</div>
						</div>
						
						<div class="col-md-6 align-self-end" id="cancelBox">
							<div class="form-group">
								<div class="form-field ">
									<input  type="button" class="btn btn-primary  form-control" id="cancelBtn" onclick="location.href='MyInformation.do'" value="취소"> 
								</div>
							</div>
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>