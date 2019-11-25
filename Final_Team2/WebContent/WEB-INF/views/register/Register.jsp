<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <c:import url="/common/HeadTag.jsp" />
    <title>Main</title>
    <style type="text/css">
    	html, body{
    	height: 100%;
    	}
    </style>
    <script type="text/javascript">
    function maxLengthCheck(object){
    	   if (object.value.length > object.maxLength){
    	    object.value = object.value.slice(0, object.maxLength);
    	   }   
    	  }
    
    function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
        }
    }
    
    //1~4까지만
    function inGender(){
        if(event.keyCode<49 || event.keyCode>52){
           event.returnValue=false;
        }
    }
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <section class="ftco-center">
        <div class="row justify-content-center pb-5">
            <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
                <h2 class="text-center mb-3">REGISTER</h2>
                <form action="LoginOk.do" class="search-property-1" method="post">
                    <div class="row">
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">ID</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="id" name="id" placeholder="enter your id" autofocus="autofocus">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">NAME</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="enter your name" >
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">PASSWORD</label>
                                <div class="form-field">
                                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="enter your password">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">BIRTH</label>
                                <div class="form-field">
                                    <input type="text" class="form-control" id="birth" name="birth" maxlength="6" onkeypress="inNumber()" oninput="maxLengthCheck(this)"> 
                                    	- <input type="text" class="form-control" id="gender" name="gender"  maxlength="1" oninput="maxLengthCheck(this)" onkeypress="inGender()" >
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">EMAIL</label>
                                <div class="form-field">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="enter your email">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-self-end">
                            <div class="form-group">
                                <div class="form-field">
                                    <input type="submit" value="REGISTER" class="form-control btn btn-primary">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>

</body>

</html>