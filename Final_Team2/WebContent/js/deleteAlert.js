/**
 * 삭제버튼 클릭시 alert 띄우는거 입니다
 */
function deleteAlert(cmd,bIdx){
    		Swal.fire({
  			  title: 'Are you sure?',
  			  icon: 'warning',
  			  showCancelButton: true,
  			  confirmButtonColor: '#3085d6',
  			  cancelButtonColor: '#d33',
  			  confirmButtonText: 'Yes, delete it!'
  			}).then((result) => {
  			  if (result.value) {
  				location.href= cmd+"bIdx="+bIdx;
  			  }
  			})
    	}