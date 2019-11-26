package kr.or.bit.utils;

import java.util.Random;

import javafx.util.Pair;

public class MailHelper {

	public static Pair<String, String> getRegisterMailContent() {
		String code = createKey();
		String content = "이곳저곳 회원가입 이메일 인증\n 인증 번호 : <b>" + code + "</b>";

		return new Pair<String, String>(code, content);
	}

	private static String createKey() {

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
