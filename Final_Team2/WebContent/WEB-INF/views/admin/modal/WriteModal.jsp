<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
   $(function(){
      $('#writeModal').on('show.bs.modal', function(event) {  
    	 let cmd = $(event.relatedTarget).data('cmd');

         let id = "";
         let pwd = "";
       	 let action = "";
         if(cmd === "edit"){
        	 id = $(event.relatedTarget).data('id');
        	 pwd=$(event.relatedTarget).data('pwd');
        	 $("#btn").val("EDIT");
        	 $("#id").attr("readonly","readonly");
			 $(".modal-title").html("<i class='fas fa-user-edit'></i>&nbsp;&nbsp;관리자 수정");
			 action="AdminWrite.do?cmd=edit";
         }else{
        	 $("#btn").val("ADD");
        	 $("#id").removeAttr("readonly");
        	 $(".modal-title").html("<i class='fas fa-user-plus'></i>&nbsp;&nbsp;관리자 추가");
        	 action="AdminWrite.do?cmd=write";
         }
         
    	 $("#id").val(id);
    	 $("#pwd").val(pwd);
         $("#frm").attr("action",action); 
      });
   });
</script>
</head>
<body>

<!-- Admin write Modal-->
  <div class="modal fade" id="writeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form id="frm" method="post">
        <div class="modal-body">
			<div class="form-group">
			<label for="id">ID </label>
			<input type="text" class="form-control" id="id" name="id">
			</div>
			<div class="form-group">
			<label for="pwd">PASSWORD</label>
			<input type="password" class="form-control" id="pwd" name="pwd">
			</div>
        </div>
        <div class="modal-footer">
        	<input type="submit" id="btn" class="btn btn-primary"/>
         	<input class="btn btn-secondary" type="button" data-dismiss="modal" value="Cancel">
        </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>