<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
    $('#editModal1').on('show.bs.modal', function(event) {   
        let cmd = "";
        let editTLidx="";
        let editTLname = "";

    	cmd = $(event.relatedTarget).data('cmd');
    	console.log("in modal" + cmd);
    	if(cmd == "edit"){
    		editTLidx = $(event.relatedTarget).data('edit-tlidx');
        	editTLname =  $(event.relatedTarget).data('edit-tlname');
        	$("#frm").attr("action","MTFolderListEdit.do?tLidx=" + editTLidx);
    	}else{
    		 $("#frm").attr("action","MTFolderListEdit.do?tLidx=" + editTLidx);
    	}

      $("#inputInnerModal").val(editTLname);
    });

 });
</script>
</head>
<body>
<!--  edit modal -->	 			 
<div class="modal fade" id="editModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">폴더 이름 수정</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form id="frm" method = "post">
        <div class="modal-body" id="innerModal">   		
        	<input type="text" name="editFolder" id="inputInnerModal"> 
        </div>
        <div class="modal-footer">
          <input type="submit" class="btn btn-primary" value="수정">
          
       <button id="deletebtn" class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  
  
</body>
</html>