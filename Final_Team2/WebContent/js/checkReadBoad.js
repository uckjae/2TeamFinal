
function checkReadBoad(result, bIdx, href){
	if(result){
		location.href=href+"?bIdx="+bIdx;
	}else{
		warningAlert("로그인하세요");
	}
}