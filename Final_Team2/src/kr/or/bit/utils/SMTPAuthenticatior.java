package kr.or.bit.utils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator {

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("bit_team2", "bitteam21004");
	}
}