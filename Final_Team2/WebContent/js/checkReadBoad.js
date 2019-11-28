
function checkReadBoad(result, bIdx, href){
	if(result){
		location.href=href+"?bIdx="+bIdx;
	}else{
		alert("로그인하세요");
		location.href="Login.do";
	}
}