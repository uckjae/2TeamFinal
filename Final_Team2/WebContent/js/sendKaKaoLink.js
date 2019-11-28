
let key = "14d18883665f9c759edcd5510920bce0";
Kakao.init(key);

function sendKaKaoLink(){
	let title = "동대문 투어하기";
	let description = "#어쩌구 #저꺼구";
	let imagePath = "http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png";
	let link ="http://localhost:8090/Final_Team2";
	let likecount = 789;
	let commentCount = 123;
	
	Kakao.Link.createDefaultButton({
	      container: '#kakaoLink',
	      objectType: 'feed',
	      content: {
	        title: title,
	        description: description,
	        imageUrl: imagePath,
	        link: {
	          mobileWebUrl: link,
	          webUrl: link
	        }
	      },
	      social: {
	        likeCount: likecount,
	        commentCount: commentCount
	      },
	      buttons: [
	        {
	          title: '자세히  보기',
	          link: {
	            mobileWebUrl: link,
	            webUrl: link
	          }
	        }
	      ]
	    });
}
    