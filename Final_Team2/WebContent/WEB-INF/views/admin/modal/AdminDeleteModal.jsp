<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
   $(function(){
      
      $('#deleteModal').on('show.bs.modal', function(event) {          
         let deleteId = $(event.relatedTarget).data('delete-id');
         $(".modal-body").empty().prepend("<b>[ "+deleteId+" ]</b> 관리자를 삭제 하시겠습니까?");
         $("#deletebtn").attr("href","MemberDelete.do?id=" + deleteId);
      });
   });
</script>
</head>
<body>

<!-- Admin delete Modal-->
  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-trash-alt"></i> 관리자 삭제</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body"> </div>
        <div class="modal-footer">
          <a id="deletebtn" class="btn btn-primary">Delete</a>
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>