let titleLimit = 100;
let contentLimit = 4000;

function checkBoardConten(title, content){
	if(title=="" || stringToByte(title) > titleLimit || content=="" || stringToByte(content) > contentLimit){
		errorAlert("입력 내용을 확인해주세요.");
		return false;
	}else{
		return true;
	}
}

function stringToByte(str){
    var cnt = 0;
    for(var i =0; i<str.length;i++) {
        cnt += (str.charCodeAt(i) >128) ? 2 : 1;
    }
    return cnt;
}