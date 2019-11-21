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
					if(articles%2!=0){
						var newArticle = $('<div class="timeline-article">');
						var right = $('<div class="content-right-container">');
						$(right).prepend($('<input type="text" name="spot" placeholder="관광지 이름" style="float: right; text-align: center;">'));
						$(right).prepend($('<input type="file" id="photo" name="photo" accept="image/*">'));
						$(right).prepend($('<span class="article-number">').text(num));
						$(right).prepend($('<textarea name="content" form="inform" cols="40" rows="5">'));
						$(newArticle).prepend(right);
						$("#inputForm").append(newArticle);
					}
					else{
						var newArticle = $('<div class="timeline-article">');
						var right = $('<div class="content-left-container">');
						$(right).prepend($('<input type="text" name="spot" placeholder="관광지 이름" style="float: right; text-align: center;">'));
						$(right).prepend($('<input type="file" id="photo" name="photo" accept="image/*">'));
						$(right).prepend($('<span class="article-number">').text("0"+num));
						$(right).prepend($('<textarea name="content" form="inform" cols="40" rows="5">'));
						$(newArticle).prepend(right);
						$("#inputForm").append(newArticle);
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