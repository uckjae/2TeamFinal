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

    		if(${isEdit}){
    		 	$("#frm").attr("action", "MemberEditOk.do");
    			$("#id").attr("readonly", "readonly");
    			$("#email").attr("readonly", "readonly");
    			$("#birth").attr("readonly", "readonly"); 
    			if($("#checkbox").is(":checked"))
    				$("#disable").val(1);
    			else
    				$("#disable").val(0);
        		$("#openPostCode").click(execDaumPostcode);
    			$("#postCode").click(execDaumPostcode);
    		}else{
    			$("input").attr("readonly", "readonly");
    			$("#frm").attr("action", "MemberList.do");
    			$(":checkbox").attr("disabled", "disabled");
    		}
    		
    		$("#postCode").attr("readonly", "readonly");
    		$("#address").attr("readonly", "readonly");
    		$("input:radio").attr("disabled", "disabled");
    		$("input:submit").removeAttr("disabled"); 
    		
    		$("#checkbox").change(function(){
    			if(this.checked)
    				$("#disable").val(1);
    			else
    				$("#disable").val(0);
    		})
    	})

    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <c:set var="member" value="${requestScope.memberInfo}" />
	<div class="content-center">
		<div class="row justify-content-center pb-5">
			<div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
				<h2 class="text-center mb-3">My Information </h2>
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
								<input type="number" id="postCode"
									name="postCode" class="form-control" value="${address[0]}"
									aria-label="Search" aria-describedby="basic-addon2"
									style="height: 50px">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button" id="openPostCode">
										<i class="fas fa-search"></i>
									</button>
								</div>
								<div class="form-field">
									<input type="text" class="form-control" id="address"
										name="address" value="${address[1] }">
								</div>

							</div>
						</div>
						
						<div class="col-md-6 align-self-end">
							<div class="form-group">
								<div class="form-field ">
								<a href="MyInforamtionEdit?id=${member.id }">
									<button  type="button" class="btn btn-primary  form-control"> 
										수정
									</button></a>
								</div>
							</div>
						</div>
						
						<div class="col-md-6 align-self-end">
							<div class="form-group">
								<div class="form-field">
								<a href="MyInforamtionEdit?id=${member.id }">
								<button  type="button" class="btn  form-control"> 
										탈퇴
									</button></a>
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