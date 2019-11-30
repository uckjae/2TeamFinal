
let key = "14d18883665f9c759edcd5510920bce0";
Kakao.init(key);
console.log("in copy11");
function sendKaKaoLink(){
	Kakao.Link.createDefaultButton({
	      container: '#kakaoLink',
	      objectType: 'feed',
	      content: {
	        title: $("#title").text(),
	        description: "#같이가자 #이곳저곳",
	        imageUrl: document.images[0].src,
	        link: {
	          mobileWebUrl: document.location.href,
	          webUrl: document.location.href
	        }
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
    