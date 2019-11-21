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
    <script type="text/javascript">
        $(function () {
            $('#content').summernote({
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
        <h1 class="text-center mb-3 bread">Q & A</h1>
        <div class="comment-form-wrap pt-xl-2">
            <form action="#" class="p-5 bg-light">
                <div class="col-lg-12 align-items-end mb-3">
                    <div class="form-group">
                        <label for="#">제목</label>
                            <input type="text" class="form-control" id="pwd" name="pwd"
                                placeholder="enter yout password">

                    </div>
                </div>

            </form>
        </div>
    </div>


</body>

</html>