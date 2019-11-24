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
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <section class="ftco-center">
        <div class="row justify-content-center pb-5">
            <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
                <h2 class="text-center mb-3">Login</h2>
                <form action="LoginOk.do" class="search-property-1" method="post">
                    <div class="row">
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">ID</label>
                                <div class="form-field">
                                    <div class="icon"><span class="ion-ios-search"></span></div>
                                    <input type="text" class="form-control" id="id" name="id" placeholder="enter your id" autofocus="autofocus">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-items-end mb-3">
                            <div class="form-group">
                                <label for="#">Password</label>
                                <div class="form-field">
                                    <div class="icon"><span class="ion-ios-calendar"></span></div>
                                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="enter your password">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 align-self-end">
                            <div class="form-group">
                                <div class="form-field">
                                    <input type="submit" value="LOGIN" class="form-control btn btn-primary">
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