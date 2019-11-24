<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="bIdx" value="${param.bIdx }"/>
<c:set var="replies" value="${requestScope.replies }"/>
<script type="text/javascript">
	$(function(){
		console.log("reply int");
		
		$(":button").click(function(){
			 $.ajax({
			        type:'POST',
			        url : "<c:url value='/board/addComment.do'/>",
			        data:{}
			        success : function(data){
			        	console.log("success");
			        	console.log(data);
			        },
			        error:function(request, status, error){
			            alert("댓글 작성 실패!");
			       }
			    });
		});
	});
		
</script>
</head>
<body>
  <div class="p-5 bg-light mt-3">
     	<div class="form-group">
      	<textarea name="content" id="content" cols="30" rows="3" class="form-control" placeholder="Message"></textarea>
          </div>
          <div class="text-right">
          	 <input type="button" class="btn btn-primary " value="REPLY" >
          </div>
    </div>
    
	<div class="col-md-12 tour-wrap">
		<h3  style="border-bottom: 1px solid #f2f2f2;">${ replies.size() } Reply </h3>
			<ul class="comment-list">
			<c:forEach var="reply" items="${ replies }">
				<li class="comment box p-2 px-3 bg-light d-flex">
					<div class="comment-body">
						<h3 class="bold">${ reply.id }</h3>
						<div class="meta">
							 <fmt:formatDate value="${reply.rWDate}" pattern="yyyy-MM-dd   HH:mm:ss" /> 
						</div>
						<p>${ reply.rContent }</p>
						<p>
							<a href="#" class="reply">Reply</a>
						</p>
					</div>
				</li>
			</c:forEach>
			</ul>
	</div>
</body>
</html>