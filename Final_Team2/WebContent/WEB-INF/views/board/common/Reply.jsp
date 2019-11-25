<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="bIdx" value="${param.bIdx}"/>
<c:set var="replies" value="${requestScope.replies}"/>
<script type="text/javascript">
	$(function(){
		changReplyHeader();
		$("#reply").click(function(){
			 $.ajax({
			        type:'POST',
			        url : "WriteReply",
			        data:{bIdx : ${bIdx}, replyContent : $("#replyContent").val()},
					dataType: "json",
			        success : function(data){
			        	$("#replyContent").val("");
			        	addReply(data);
			        	changReplyHeader();
			        },
			        error:function(request, status, error){
			            alert("댓글 작성 실패!");
			       }
			    });
		});
		
		function addReply(data){
			let control = "<li class='comment box p-2 px-3 bg-light d-flex'>"
							+ " <div class='comment-body'>"
							+ "	<h3 class='bold'>"+ data.id +"</h3>"
							+ " 	<div class='meta'>"+data.rWDate+"</div>"
							+ " 	<p>"+data.rContent+"</p>"
							+ " </li>";		
			
			$(".comment-list").append(control);
		}
		
		function changReplyHeader(){
			let count = $(".comment-list > li").size();
			let header ="";
			if(count > 0)
				header = count + " Reply";
			else
				header = "No Reply";
			
			$("#replyCount").text(header);
		}
	});
		
</script>
</head>
<body>
  <div class="p-5 bg-light mt-3">
     	<div class="form-group">
      	<textarea name="replyContent" id="replyContent" cols="30" rows="3" class="form-control" placeholder="Message"></textarea>
          </div>
          <div class="text-right">
          	 <input id="reply" type="button" class="btn btn-primary " value="REPLY" >
          </div>
    </div>
    
	<div class="col-md-12 tour-wrap">
		<h3 id="replyCount"  style="border-bottom: 1px solid #f2f2f2;">  </h3>
			<ul class="comment-list">
			<c:forEach var="reply" items="${ replies }">
				<li class="comment box p-2 px-3 bg-light d-flex">
					<div class="comment-body">
						<h3 class="bold">${ reply.id }</h3>
						<div class="meta">
							 <fmt:formatDate value="${reply.rWDate}" pattern="yyyy-MM-dd   HH:mm:ss" /> 
						</div>
						<p>${ reply.rContent }</p>
					</div>
				</li>
			</c:forEach>
			</ul>
	</div>
</body>
</html>