/**
 * 
 */
$(function(){
			/* 추가함수 */
			$("#addSpot").click(function(){
				let articles = $(".conference-timeline-content").find(".timeline-article").length;
				let num = articles + 1;
				if(articles >= 6){
					alert("최대 6개까지 코스를 등록할수 있습니다.");
				}
				else{
					if(articles==2){
						var newArticle = $('<div class="content timeline-article">');
						var left = $('<div class="content-left-container">');
						$(left).prepend($('<input class = "input" type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center; overflow: auto;">'));
						$(left).prepend($('<input type="file" id="photo2" name="photo2" accept="image/*">'));
						$(left).prepend($('<span class="article-number">').text("0"+num));
						$(left).prepend($('<textarea class = "input" name="area" cols="19" rows="5" style="overflow: auto;">'));
						$(newArticle).prepend(left);
						$(newArticle).append($('<div class="meta-date">').html('<img class="image2" src="images/scenery.png" id="view2" alt="여행지 사진">'));
						$(".conference-timeline-content").append(newArticle);
						
						$("#photo2").change(function(){
							console.log("done");
				    		var reader = new FileReader();

				    	    reader.onload = function (e) {
				    	        // get loaded data and render thumbnail.
				    	        document.getElementById("view2").src = e.target.result;
				    	    };

				    	    // read the image file as a data URL.
				    	    reader.readAsDataURL(this.files[this.files.length-1]);
				    	});
					}
					else if(articles==3){
						var newArticle = $('<div class="content timeline-article">');
						var right = $('<div class="content-right-container">');
						$(right).prepend($('<input class = "input" type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center; ">'));
						$(right).prepend($('<input type="file" id="photo3" name="photo3" accept="image/*">'));
						$(right).prepend($('<span class="article-number">').text("0"+num));
						$(right).prepend($('<textarea class = "input" name="area" cols="19" rows="5" style="margin-left: 80px; overflow: auto;">'));
						$(newArticle).prepend(right);
						$(newArticle).append($('<div class="meta-date">').html('<img class="image2" src="images/scenery.png" id="view3" alt="여행지 사진">'));
						$(".conference-timeline-content").append(newArticle);
						
						$("#photo3").change(function(){
				    		var reader = new FileReader();

				    	    reader.onload = function (e) {
				    	        // get loaded data and render thumbnail.
				    	        document.getElementById("view3").src = e.target.result;
				    	    };

				    	    // read the image file as a data URL.
				    	    reader.readAsDataURL(this.files[this.files.length-1]);
				    	});
					}
					else if(articles==4){
						var newArticle = $('<div class="content timeline-article">');
						var left = $('<div class="content-left-container">');
						$(left).prepend($('<input class = "input" type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">'));
						$(left).prepend($('<input type="file" id="photo4" name="photo4" accept="image/*">'));
						$(left).prepend($('<span class="article-number">').text("0"+num));
						$(left).prepend($('<textarea class = "input" name="area" cols="19" rows="5" style="overflow: auto;">'));
						$(newArticle).prepend(left);
						$(newArticle).append($('<div class="meta-date">').html('<img class="image2" src="images/scenery.png" id="view4" alt="여행지 사진">'));
						$(".conference-timeline-content").append(newArticle);
						
						$("#photo4").change(function(){
				    		var reader = new FileReader();

				    	    reader.onload = function (e) {
				    	        // get loaded data and render thumbnail.
				    	        document.getElementById("view4").src = e.target.result;
				    	    };

				    	    // read the image file as a data URL.
				    	    reader.readAsDataURL(this.files[this.files.length-1]);
				    	});
					}
					else{
						var newArticle = $('<div class="content timeline-article">');
						var right = $('<div class="content-right-container">');
						$(right).prepend($('<input class = "input" type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">'));
						$(right).prepend($('<input type="file" id="photo5" name="photo5" accept="image/*">'));
						$(right).prepend($('<span class="article-number">').text("0"+num));
						$(right).prepend($('<textarea class = "input" name="area" cols="19" rows="5" style="margin-left: 80px; overflow: auto;">'));
						$(newArticle).prepend(right);
						$(newArticle).append($('<div class="meta-date">').html('<img class="image2" src="images/scenery.png" id="view5" alt="여행지 사진">'));
						$(".conference-timeline-content").append(newArticle);
						
						$("#photo5").change(function(){
				    		var reader = new FileReader();

				    	    reader.onload = function (e) {
				    	        // get loaded data and render thumbnail.
				    	        document.getElementById("view5").src = e.target.result;
				    	    };

				    	    // read the image file as a data URL.
				    	    reader.readAsDataURL(this.files[this.files.length-1]);
				    	});
					}
				}
			});
			/* 추가함수 end */
			
			/* 제거함수 */
			$("#removeSpot").click(function(){
				let articles = $(".conference-timeline-content").find(".timeline-article");
				if(articles.length<=2){
					alert("최소 두 곳의 여행지가 있어야합니다.");
				}
				else{
					$(articles).last().remove();
				}
			});
			
			/*사진미리보기*/
			$("#photo0").change(function(){
	    		var reader = new FileReader();

	    	    reader.onload = function (e) {
	    	        // get loaded data and render thumbnail.
	    	        document.getElementById("view0").src = e.target.result;
	    	    };

	    	    // read the image file as a data URL.
	    	    reader.readAsDataURL(this.files[this.files.length-1]);
	    	});
			$("#photo1").change(function(){
	    		var reader = new FileReader();

	    	    reader.onload = function (e) {
	    	        // get loaded data and render thumbnail.
	    	        document.getElementById("view1").src = e.target.result;
	    	    };

	    	    // read the image file as a data URL.
	    	    reader.readAsDataURL(this.files[this.files.length-1]);
	    	});
		});




