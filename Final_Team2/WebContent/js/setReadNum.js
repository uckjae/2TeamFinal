/*
 게시판 글 번호를 기준으로 RNUM 칼럼 값을 +1한다.
 Parameter : bIdx
 */
function setReadNum(bIdx) {
	$.ajax({
		type:'POST',
        url : "ReadNum",
		data : {
			'bIdx' : bIdx
		},
		success : function(data) { },
		error : function(request, status, error) { }
	});
}