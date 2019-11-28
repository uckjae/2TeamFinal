<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <!DOCTYPE html>
<html>
<c:choose>
	<c:when test="${requestScope.cmd == 'edit'}">
		<c:set var="isEdit" value="true"/>
	</c:when>
	<c:otherwise>
		<c:set var="isEdit" value="false"/>
	</c:otherwise>
</c:choose>

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
    <c:set var="member" value="${requestScope.member}" />
    <div class="content-center">
        <div class="row justify-content-center pb-5">
            <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
                <h2 class="text-center mb-3">[ ${member.id } ]</h2>
                <form  id="frm" class="search-property-1" method="post">
                    <div class="row">
                        <div class="col-lg-12  mb-3">
                            <div class="form-group">
                                <label for="#">ID</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="id" name="id" value="${member.id }">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">EMAIL</label>
                                <div class="form-field">
                                    <input type="email" class="form-control" id="email" name="email" value="${member.email }">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">NAME</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="name" name="name" value="${member.name }">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">PASSWORD</label>
                                <div class="form-field">
                                    <input type="password" class="form-control" id="pwd" name="pwd" value="${member.pwd }">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">BIRTH</label>
                                <div class="form-field">
                               		 <input type="text" class="form-control" id="birth" name="birth" value="${member.birth }" > 
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">Gender</label>
                                <div class="form-field"  >
	                                <div class="col-lg-6">
	                                	<input type="radio" class="form-check-input" id="gender" name="gender" value="0" 
	                                	<c:if test="${! member.gender}">checked</c:if>
	                                	>남 
	                                </div>
	                                <div class="col-lg-6">
	                               	 	<input type="radio" class="form-check-input" id="gender" name="gender"  value="1" 
	                               	 	<c:if test="${ member.gender}">checked</c:if>
	                               	 	>여
	                                </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">ADDRESS</label>
                             	<c:set var="address" value="${fn:split(member.address, '/')}" />
                             	<c:choose>
                             		<c:when test="${!isEdit}">
                             			<div class="form-field">
		                                	<div class="row">
			                                	<div class="col-lg-3">
			                                	   <input type="number" id="postCode" name="postCode" value="${address[0]}"  class="form-control"  aria-label="Search" aria-describedby="basic-addon2" style="height: 50px" >
			                                	</div>
			                                	<div class="col-lg-9"> 
			                                		<input type="text" class="form-control" id="address" name="address" value="${address[1] }" >
			                                	</div>
			                                </div>
		                                </div>
                             		</c:when>
                             		<c:otherwise>
                             			<input type="number" id="postCode" name="postCode"  class="form-control" value="${address[0]}"  aria-label="Search" aria-describedby="basic-addon2" style="height: 50px">
								        <div class="input-group-append">
								          <button class="btn btn-primary" type="button" id="openPostCode">
								            <i class="fas fa-search"></i>
								          </button>
								        </div>
		                                <div class="form-field">
		                                    <input type="text" class="form-control" id="address" name="address" value="${address[1] }">
                                		</div>
                             		</c:otherwise>
                             	</c:choose>
                            </div>
                        </div>
                        
                         <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
								  <input type="checkbox" id="checkbox" name="checkbox" class="custom-control-input" <c:if test="${member.disable }">checked</c:if> >
								  <label class="custom-control-label" for="checkbox" style="color:red;"> 활동중지</label>
								  <input type="hidden" id="disable" name="disable"> 
								</div>
                            </div>
                        </div>

						<c:choose>
							<c:when test="${isEdit}">
								<div class="col-lg-12 align-self-end">
		                            <div class="row">
		                                <div class="col-lg-6"  style=" padding-right: 0">
		                                    <input type="submit" value="수정" class="btn btn-primary" style="width: 100%; padding-right: 0">
		                                </div>
		                                <div class="col-lg-6">
		                                    <input type="reset" value="목록으로" class="btn btn-primary" style="width: 100%; " onClick="location.href='MemberList.do'">
		                                </div>
		                            </div>
		                        </div>
							</c:when>
							<c:otherwise>
								 <div class="col-lg-12 align-self-end">
		                            <div class="form-group">
		                                <div class="form-field">
		                                    <input type="submit" value="목록으로" class="form-control btn btn-primary">
		                                </div>
			                           </div>
			                       </div>
							</c:otherwise>
						</c:choose>
                </div>
                </form>
            </div>
            
        </div>
    </div>

</body>

</html>