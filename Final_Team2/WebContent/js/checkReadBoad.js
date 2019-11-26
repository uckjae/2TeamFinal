
function checkReadBoad(result, bIdx, href){
	if(result){
		alert("로그인하세요");
		location.href="Login.do";
	}else{
		location.href=href+"?bIdx="+bIdx;
	}
}