package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.util.Pair;
import kr.or.bit.utils.MailHelper;
import kr.or.bit.utils.SMTPAuthenticatior;

@WebServlet("/SendMail")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SendMailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		// SMTPAuthenticatior에 설정한 것과 같아야한다.
		String sender = "bit_team2@naver.com";
		String subject = "[이곳저곳] 이메일 인증";
		Pair<String, String> content = MailHelper.getRegisterMailContent();

		String receiver = request.getParameter("email");

		Properties p = new Properties(); // 정보를 담을 객체
		// 메일 보내기 위한 기본 설정
		p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 smtp
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		PrintWriter out = response.getWriter();

		try {
			Authenticator auth = new SMTPAuthenticatior();
			Session ses = Session.getInstance(p, auth);

			// 메일의 내용을 담기 위한 객체
			MimeMessage msg = new MimeMessage(ses);

			// 제목 설정
			msg.setSubject(subject);

			// 보내는 사람의 메일주소
			Address senderAddr = new InternetAddress(sender);
			msg.setFrom(senderAddr);

			// 받는 사람의 메일주소
			Address receiverAddr = new InternetAddress(receiver);
			msg.addRecipient(Message.RecipientType.TO, receiverAddr);

			// 메시지 본문의 내용과 형식, 캐릭터 셋 설정
			msg.setContent(content.getValue(), "text/html;charset=UTF-8");

			// 발송
			Transport.send(msg);
		} catch (Exception mex) {
			mex.printStackTrace();
			String script = "<script type='text/javascript'>\n";
			script += "alert('메일발송에 실패했습니다.');\n";
			script += "history.back();\n";
			script += "</script>";
			out.print(script);
			return;
		}

		out.print(content.getKey());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
