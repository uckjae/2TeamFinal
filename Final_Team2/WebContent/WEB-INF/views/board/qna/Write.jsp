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
                popover: {
                    image: [],
                    link: [],
                    air: []
                  }
            });

            $('.note-statusbar').hide();
        })
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

    <!-- Contant -->

	<c:set var="qnaWrite" value="${requestScope.qnaWrite}"/>
	<c:choose>
		<c:when test="${qnaWrite.bIdx > 0}">
			<c:set var="isEdit" value="true"/>
		</c:when>
		<c:otherwise>
			<c:set var="isEdit" value="false"/>
		</c:otherwise>
	</c:choose>
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">
            	<c:choose>
                	 <c:when test="${isEdit}"> 
                		Q & A 수정
                	 </c:when>
                	<c:otherwise> 
                		Q & A 작성
                 	</c:otherwise>
                </c:choose> 
            </h1>
            <form action="QnABoardWriteOk.do?cmd=
            	<c:choose>
                	 <c:when test="${isEdit}">edit</c:when>
                	<c:otherwise>write </c:otherwise>
                </c:choose> " class="p-5 bg-light" method="post">
                <input type="text" class="form-control mb-3" id="title" name="title" placeholder="글 제목" value="${qnaWrite.title}">
                <input type="hidden" id="bIdx" name="bIdx" value="${qnaWrite.bIdx}">
                <textarea rows="10" cols="60" id="summernote" name="summernote">
                	${ qnaWrite.content }
				</textarea>
				<div class="mt-3 text-right">

					<label class="mr-3"> 
						<input type="radio" id="isPublic" name="isPublic" value="1"  
								<c:if test="${ qnaWrite.isPublic() }"> checked </c:if>  
						>공개
					</label>
					<label> 
						<input type="radio" id="isPublic" name="isPublic" value="0" 
								 <c:if test="${ !qnaWrite.isPublic() }"> checked </c:if> 
						>비공개
					</label>
				
				</div>
                <div class="text-center">
                <c:choose>
                	 <c:when test="${isEdit}"> 
                		<input type="submit" class="btn btn-primary mr-3" value="수정">
                	 </c:when>
                	<c:otherwise> 
                		<input type="submit" class="btn btn-primary mr-3" value="작성">
                 	</c:otherwise>
                </c:choose> 
                    
                    <input type="reset" class="btn btn-primary" value="취소" onClick="location.href='QnABoardList.do'">
                </div>
            </form>
        </div>
    </div>


</body>

</html>