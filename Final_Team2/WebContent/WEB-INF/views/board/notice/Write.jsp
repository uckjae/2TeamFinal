<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/common/HeadTag.jsp" />
<meta charset="UTF-8">
<title>Free Board</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<style type="text/css">
html, body {
	height: 100%;
}
</style>
<script type="text/javascript">
        $(function () {
            $('#summernote').summernote({
                height: 400,
                placeholder: "글을 입력하세요.",
            }); 
            $('.note-statusbar').hide();
        })
        
 
		function check() {
			if (!bbs.title.value) {
				alert("제목을 입력하세요");
				bbs.subject.focus();
				return false;
			}
			if (!bbs.summernote.value) {
				alert("글 내용을 입력하세요");
				bbs.writer.focus();
				return false;
			}
			document.bbs.submit();
		}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		  $('#summernote').summernote();
	});
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<!-- Top -->
	<c:import url="/common/Top.jsp" />
	
	<div class="content">
		<div class="comment-form-wrap pt-xl-2">
			<h1 class="text-center mb-5 bread">공지사항</h1>

			<form name="NBW" class="p-5 bg-light" action="NoticeBoardWriteOk.do?cmd="
				method="POST">
				<table class="table table-bordered" id="dataTable">
					<tr>
						<td><input class="form-control" type="text" placeholder="제목">
						</td>
					</tr>
					<tr>
						<td><textarea id="summernote" rows="10" cols="60"
								name="content" class="ckeditor">
                   </textarea></td>
					</tr>
				</table>


				<div class="mt-5 text-center">
					<input type="submit" class="btn btn-primary" value="글쓰기">
						 
						<input type="reset" class="btn btn-primary" value="취소"onClick="location.href='NoticeBoardList.do'">
				</div>
			</form>

		</div>
	</div>

</body>
</html>