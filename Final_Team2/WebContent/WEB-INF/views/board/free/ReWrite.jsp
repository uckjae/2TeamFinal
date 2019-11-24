<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/common/HeadTag.jsp" />
    <jsp:include page="/common/DataTableTag.jsp"></jsp:include>
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
    <title>Main</title>
    <style type="text/css">
        html,
        body {
            height: 100%;
        }
    </style>
	<script type="text/javascript">
        $(function () {
            $('#summernote').summernote(
            	{
        			placeholder: '내용을 입력하세요',
        			tabsize: 2,
        			height: 200
            	}
            );
            
            $('.note-statusbar').hide();
        })
	</script>
</head>
<body>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    
    <!-- Contant -->
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">
            	답글 작성
            </h1>
            <form action="FreeBoardReWriteOk.do?" method="post"class="p-5 bg-light">
                <input type="text" class="form-control mb-3" id="title" name="title" placeholder="글 제목">
                <input type="hidden" id="bIdx" name="bIdx">
                <textarea rows="10" cols="60" id="summernote" name="content">
                	
				</textarea>
				<div class="text-center">
                	<input type="submit" class="btn btn-primary mr-3" value="작성">
                    <input type="reset" class="btn btn-primary" value="취소" onClick="location.href='FreeBoardList.do'">
                </div>
            </form>
        </div>
    </div>
</body>
</html>