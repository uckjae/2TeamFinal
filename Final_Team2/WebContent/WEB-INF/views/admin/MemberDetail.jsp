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
    		$("input").attr("disabled","disabled");
    		$("input:submit").removeAttr("disabled");
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
                <form action="MemberList.do" class="search-property-1" method="post">
                    <div class="row">
                        <div class="col-lg-12  mb-3">
                            <div class="form-group">
                                <label for="#">ID</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="id" name="id" value="${member.id }" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">EMAIL</label>
                                <div class="form-field">
                                    <input type="email" class="form-control" id="email" name="email" value="${member.id }" disabled>
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
                               		 <input type="text" class="form-control" id="birth" name="birth" value="${member.birth }"> 
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">Gender</label>
                                <div class="form-field">
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

                                <div class="form-field">
                                	<div class="row">
	                                	<div class="col-lg-3">
	                                	   <input type="number" id="postCode" name="postCode" value="${address[0]}"  class="form-control"  aria-label="Search" aria-describedby="basic-addon2" style="height: 50px" readonly>
	                                	</div>
	                                	<div class="col-lg-9"> 
	                                		<input type="text" class="form-control" id="address" name="address" placeholder="주소" value="${address[1] }" readonly>
	                                	</div>
	                                </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-12 align-self-end">
                            <div class="form-group">
                                <div class="form-field">
                                    <input type="submit" value="목록으로" class="form-control btn btn-primary">
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