/**
 * 
 */
$(function(){
			/* 추가함수 */
			$("#addSpot").click(function(){
				let articles = $(".conference-timeline-content").find(".timeline-article").length;
				let num = articles + 1;
				console.log(num);
				if(articles >= 6){
					alert("최대 6개까지 코스를 등록할수 있습니다.");
				}
				else{
					if(articles==2){
						var newArticle = $('<div class="content timeline-article">');
						var left = $('<div class="content-left-container">');
						$(left).prepend($('<input type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">'));
						$(left).prepend($('<input type="file" id="photo" name="photo3" accept="image/*">'));
						$(left).prepend($('<span class="article-number">').text("0"+num));
						$(left).prepend($('<textarea name="contentarea" form="inform" cols="25" rows="5">'));
						$(newArticle).prepend(left);
						$(newArticle).append($('<div class="meta-date">').html('<img src="" alt="여행지 사진">'));
						$(".conference-timeline-content").append(newArticle);
					}
					else if(articles==3){
						var newArticle = $('<div class="content timeline-article">');
						var right = $('<div class="content-right-container">');
						$(right).prepend($('<input type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">'));
						$(right).prepend($('<input type="file" id="photo" name="photo4" accept="image/*">'));
						$(right).prepend($('<span class="article-number">').text("0"+num));
						$(right).prepend($('<textarea name="contentarea" form="inform" cols="25" rows="5">'));
						$(newArticle).prepend(right);
						$(newArticle).append($('<div class="meta-date">').html('<img src="" alt="여행지 사진">'));
						$(".conference-timeline-content").append(newArticle);
					}
					else if(articles==4){
						var newArticle = $('<div class="content timeline-article">');
						var left = $('<div class="content-left-container">');
						$(left).prepend($('<input type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">'));
						$(left).prepend($('<input type="file" id="photo" name="photo5" accept="image/*">'));
						$(left).prepend($('<span class="article-number">').text("0"+num));
						$(left).prepend($('<textarea name="contentarea" form="inform" cols="25" rows="5">'));
						$(newArticle).prepend(left);
						$(newArticle).append($('<div class="meta-date">').html('<img src="" alt="여행지 사진">'));
						$(".conference-timeline-content").append(newArticle);
					}
					else{
						var newArticle = $('<div class="content timeline-article">');
						var right = $('<div class="content-right-container">');
						$(right).prepend($('<input type="text" name="content" placeholder="관광지 이름" style="float: right; text-align: center;">'));
						$(right).prepend($('<input type="file" id="photo" name="photo6" accept="image/*">'));
						$(right).prepend($('<span class="article-number">').text("0"+num));
						$(right).prepend($('<textarea name="contentarea" form="inform" cols="25" rows="5">'));
						$(newArticle).prepend(right);
						$(newArticle).append($('<div class="meta-date">').html('<img src="" alt="여행지 사진">'));
						$(".conference-timeline-content").append(newArticle);
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
		});