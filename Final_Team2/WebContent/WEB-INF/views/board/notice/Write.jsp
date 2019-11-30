<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/common/HeadTag.jsp" />
<jsp:include page="/common/DataTableTag.jsp"></jsp:include>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<title>notice Board</title>
<style type="text/css">
html, body {
	height: 100%;
}
</style>
<script type="text/javascript">
let charLimit = 4000;	
        $(function () {
            $('#summernote').summernote({
                height: 400,
                placeholder: "글을 입력하세요.",
                popover: {
                    image: [],
                    link: [],
                    air: []
                  },
                  callbacks: {
						onKeyup: function(e) {
						console.log("onKeydown");
						console.log($(this).val());
						let totalCharacters = stringToByte($(this).val());
							if (totalCharacters > charLimit) {
								$("#lengthBox").css("color", "red");
							} else {
								$("#lengthBox").css("color", "#999999");
							}
							
						$("#total-characters").text(totalCharacters);
						var t = e.currentTarget.innerText;
						if (t.trim().length >= charLimit) {
							if (e.keyCode != 8
								&& !(e.keyCode >= 37 && e.keyCode <= 40)
								&& e.keyCode != 46
								&& !(e.keyCode == 88 && e.ctrlKey)
								&& !(e.keyCode == 67 && e.ctrlKey))
									e.preventDefault();
								}
							},
						}
            }); 
            
            $("#total-characters").text(stringToByte($('#summernote').val()));
			$("#max").text(charLimit +"byte");
			$('.note-statusbar').hide();
			$("#frm").submit(vaildate);
        })
        
        function vaildate(){
        	let result = checkBoardConten($('#title').val(), $('#summernote').val());
        	return result;
        }
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    
    <!-- Contant -->
    <c:set var="noticeWrite" value="${requestScope.noticewrite}"/>
    <c:choose>
		<c:when test="${noticeWrite.bIdx > 0}">
			<c:set var="isEdit" value="true"/> <!--bidx가 0보다 크면 트루 -->
		</c:when>
		<c:otherwise>
			<c:set var="isEdit" value="false"/><!--bidx가 0보다 작거나 0이면 크면 펄스 -->
		</c:otherwise>
	</c:choose>
	
    <div class="content">
        <div class="comment-form-wrap pt-xl-2">
            <h1 class="text-center mb-3 bread">
            	<c:choose>
                	 <c:when test="${isEdit}"> 
                		게시글 수정
                	 </c:when>
                	<c:otherwise> 
                		게시글 작성
                 	</c:otherwise>
                </c:choose> 
            </h1>
            <form id="frm" action="NoticeBoardWriteOk.do?cmd=
               <c:choose>
                   <c:when test="${isEdit}">edit</c:when>
                   <c:otherwise>write</c:otherwise>
               </c:choose>" class="p-5 bg-light" method="post">
                
                <input type="text" class="form-control mb-3" id="title" name="title" placeholder="글 제목" value="${noticeWrite.title}">
                <input type="hidden" id="bIdx" name="bIdx" value="${noticeWrite.bIdx}">
                <textarea rows="10" cols="60" id="summernote" name="summernote">${noticeWrite.content}</textarea>
				<div class="text-right" id="lengthBox"> 
					<span id="total-characters"></span>/<span id="max"></span>
				</div>
				<div class="mt-3 text-right">
					<label class="mr-3"> 
						<input type="radio" id="isTop" name="isTop" value="1"  
						   <c:if test="${noticeWrite.isTop() }"> checked </c:if>
						>고정체크
					</label>
					<label> 
						<input type="radio" id="isTop" name="isTop" value="0" 
						     <c:if test="${!noticeWrite.isTop() }"> checked </c:if> 
						>고정해제
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
                    
                    <input type="reset" class="btn btn-primary" value="취소" onClick="location.href='NoticeBoardList.do'">
                </div>
            </form>
        </div>
    </div>
</body>
</html>