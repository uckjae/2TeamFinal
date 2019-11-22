<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <c:import url="/common/HeadTag.jsp" />

    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

    <title>Main</title>
    <style type="text/css">
        html,
        body {
            height: 100%;
        }
    </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <c:set var="qnaDetail" value="${requestScope.qnaDetail}"/>
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">Q & A</h1>
            <form action="QnABoardWriteOk.do" class="p-5 bg-light" method="post">
                <input type="text" class="form-control mb-3" id="title" name="title" value="${ qnaDetail.title}" readonly>
                <textarea rows="10" style="width: 100%" readonly>${qnaDetail.content}</textarea>
                <div class="text-center">
                    <input type="submit" class="btn btn-primary mr-3" value="작성">
                    <input type="reset" class="btn btn-primary" value="취소" onClick="location.href='QnABoardList.do'">
                </div>
            </form>
        </div>
    </div>


</body>

</html>