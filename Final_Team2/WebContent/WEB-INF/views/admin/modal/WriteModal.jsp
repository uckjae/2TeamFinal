<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
   $(function(){
      $('#writeModal').on('show.bs.modal', function(event) {          
    	 let cmd = $(event.relatedTarget).data('cmd');
    	 console.log(cmd);
         let id = "";
         let pwd = "";
       
         if(cmd === "edit"){
        	 id = $(event.relatedTarget).data('id');
        	 pwd=$(event.relatedTarget).data('pwd');
        	 $("#btn").text("EDIT");
        	 $("#id").attr("readonly","readonly");
			 $(".modal-title").html("<i class='fas fa-user-edit'></i>&nbsp;&nbsp;관리자 수정");
         }else{
        	 $("#btn").text("ADD");
        	 $(".modal-title").html("<i class='fas fa-user-plus'></i>&nbsp;&nbsp;관리자 추가");
         }
         
    	 $("#id").val(id);
    	 $("#pwd").val(pwd);
         /* $("#deletebtn").attr("href","MemberDelete.do?cmd="+cmd+"&id=" + deleteId); */
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
        <div class="modal-body">
        	<form action="#" >
                  <div class="form-group">
                    <label for="id">ID </label>
                    <input type="text" class="form-control" id="id" name="id">
                  </div>
                  <div class="form-group">
                    <label for="pwd">PASSWORD</label>
                    <input type="password" class="form-control" id="pwd" name="pwd">
                  </div>
                </form>
        </div>
        <div class="modal-footer">
          <a id="btn" class="btn btn-primary"></a>
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>