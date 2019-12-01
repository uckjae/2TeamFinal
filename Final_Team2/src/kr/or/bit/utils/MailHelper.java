package kr.or.bit.utils;

import java.util.Random;

import javafx.util.Pair;

public class MailHelper {

	public static Pair<String, String> getRegisterContent() {
		String code = createKey();
		String content  = "<div style='font-family: \"Apple SD Gothic Neo\", \"sans-serif\" !important; width: 540px; height: 340px; border-top: 4px solid #346294; border-bottom: 4px solid #346294; margin: 30px auto; padding: 30px 0; box-sizing: border-box;'>"
								+ "	<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>"
								+ "		<span style='color: #346294;'>이메일 인증</span> 안내입니다."
								+ "	</h1>"
								+ "	<p style='font-size: 16px; line-height: 26px; margin-top: 20px; padding: 0 5px;'>"
								+ "		안녕하세요.<br/>"
								+ "		이곳저곳에 가입해 주셔서 진심으로 감사드립니다.<br/>"
								+ "		아래 <b style='color: #346294;'>'메일 인증 번호'</b> 를 입력하여 회원가입을 완료해 주세요.<br />"
								+ "		감사합니다."
								+ "	</p>"
								+ "	<p style='font-size: 16px; margin: 40px 5px 20px; line-height: 28px;'>"
								+ "		메일 인증 번호: <br />"
								+ "		<span style='font-size: 24px;'>"+code+"</span>"
								+ "	</p>"
								+ "</div>";

		return new Pair<String, String>(code, content);
	}

	public static String getForgotIdContent(String id) {
		String content  = "<div style='font-family: \"Apple SD Gothic Neo\", \"sans-serif\" !important; width: 540px; height: 340px; border-top: 4px solid #346294; border-bottom: 4px solid #346294; margin: 30px auto; padding: 30px 0; box-sizing: border-box;'>"
							+ "	<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>"
							+ "		<span style='color: #346294;'>아이디 찾기</span> 안내입니다."
							+ "	</h1>"
							+ "	<p style='font-size: 16px; line-height: 26px; margin-top: 20px; padding: 0 5px;'>"
							+ "		안녕하세요 이곳저곳입니다.<br/>"
							+ "		아래 요청하신 고객님의 정보와 일치하는 <b style='color: #346294;'>'아이디'</b> 입니다.<br />"
							+ "		감사합니다."
							+ "	</p>"
							+ "	<p style='font-size: 16px; margin: 40px 5px 20px; line-height: 28px;'>"
							+ "		아이디: <br />"
							+ "		<span style='font-size: 24px;'>"+id+"</span>"
							+ "	</p>"
							+ "</div>";


		return content;
	}

	public static String getForgotPwdContent(String pwd) {
		String content  = "<div style='font-family: \"Apple SD Gothic Neo\", \"sans-serif\" !important; width: 540px; height: 340px; border-top: 4px solid #346294; border-bottom: 4px solid #346294; margin: 30px auto; padding: 30px 0; box-sizing: border-box;'>"
							+ "	<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>"
							+ "		<span style='color: #346294;'>아이디 찾기</span> 안내입니다."
							+ "	</h1>"
							+ "	<p style='font-size: 16px; line-height: 26px; margin-top: 20px; padding: 0 5px;'>"
							+ "		안녕하세요 이곳저곳입니다.<br/>"
							+ "		요청하신 임시 비밀번호가 생성되었습니다.<br/>"
							+ "		아래 <b style='color: #346294;'>'임시 비밀 번호'</b> 로 로그인하세요.<br />"
							+ "		감사합니다."
							+ "	</p>"
							+ "	<p style='font-size: 16px; margin: 40px 5px 20px; line-height: 28px;'>"
							+ "		임시 비밀번호: <br />"
							+ "		<span style='font-size: 24px;'>"+pwd+"</span>"
							+ "	</p>"
							+ "</div>";
		
		return content;
	}
	
	public static String getDisableMemberContent(String id, String email, String mailContent) {
		String content  = "<div style='font-family: \"Apple SD Gothic Neo\", \"sans-serif\" !important; width: 540px; height: 340px; border-top: 4px solid #346294; border-bottom: 4px solid #346294; margin: 30px auto; padding: 30px 0; box-sizing: border-box;'>"
							+ "	<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>"
							+ "		<span style='color: #346294;'>비활성화 계정</span> 문의입니다."
							+ "	</h1>"
							+ "	<p style='font-size: 16px; line-height: 26px; margin-top: 20px; padding: 0 5px;'>"
							+ "		<b style='color: #346294;'>아이디 : </b> "+id+"<br />"
							+ "		<b style='color: #346294;'>이메일 : </b> "+email+"<br />"
							+ "		<b style='color: #346294;'>내용 : </b> "+mailContent+"<br />"
							+ "	</p>"
							+ "</div>";
		
		return content;
	}

	public static String createKey() {
		StringBuffer key = new StringBuffer();
		Random random = new Random();

		for (int i = 0; i < 10; i++) {
			int index = random.nextInt(3);

			switch (index) {
			case 0:
				key.append((char) ((int) (random.nextInt(26) + 97)));
				break;
			case 1:
				key.append((char) ((int) (random.nextInt(26) + 65)));
				break;
			case 2:
				key.append(random.nextInt(10));
				break;

			default:
				break;
			}
		}

		return key.toString();
	}

}
