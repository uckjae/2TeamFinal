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
    <script type="text/javascript">
        $(function () {
            $('#summernote').summernote({
                height: 310,
                placeholder: "글을 입력하세요.",
            });

            $('.note-statusbar').hide();
        })
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">Q & A</h1>
            <form action="QnABoardWrite.do" class="p-5 bg-light" method="post">
                <input type="text" class="form-control mb-3" id="title" name="title" placeholder="글 제목">
                <textarea rows="10" cols="60" id="summernote" name="summernote">
				</textarea>
				<div class="mt-3 text-right">
				<label > 공개
					<input type="radio" id="isPublic" name="isPublic" value="1">
				</label>
				<label> 비공개
					<input type="radio" id="isPublic" name="isPublic" value="0">
				</label>
				</div>
                <div class="mt-3 text-center">
                    <input type="submit" class="btn btn-primary" value="작성">
                    <input type="reset" class="btn btn-primary" value="취소">
                </div>
            </form>
        </div>
    </div>


</body>

</html>