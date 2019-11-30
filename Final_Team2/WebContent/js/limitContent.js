$('#summernote').on('keyup', function() {
			console.log('content keyup event')
    		if($(this).val().length > 200) {
    			Swal.fire({
    		        icon: 'error',
    		        title: "글자수는 50자로 이내로 제한됩니다.",
    		        showConfirmButton: false,
    		        timer: 1500
    		      }).then(function(){
    					$(this).val($(this).val().substring(0, 200));    	  
    		      })
    		}

    	});