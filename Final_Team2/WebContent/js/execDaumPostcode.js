/* 참고
 * http://postcode.map.daum.net/guide
 */

function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#postCode').val(data.zonecode); // 우편변호
                $('#address').val(data.roadAddress); // 도로명 주소
            }
        }).open();
    }