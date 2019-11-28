
let key = "14d18883665f9c759edcd5510920bce0";
Kakao.init(key);

function sendKaKaoLink(){
	let title =t;
	let description = "#어쩌구 #저꺼구";
	let imagePath = "http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png";
	let link ="http://localhost:8090/Final_Team2";
	let likecount = 789;
	let commentCount = 123;

	Kakao.Link.createDefaultButton({
	      container: '#kakaoLink',
	      objectType: 'feed',
	      content: {
	        title: $("#title").text(),
	        description: description,
	        imageUrl: document.images[0].src,
	        link: {
	          mobileWebUrl: document.location.href,
	          webUrl: document.location.href
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
	            mobileWebUrl: document.location.href,
	            webUrl: document.location.href
	          }
	        }
	      ]
	    });
}
    