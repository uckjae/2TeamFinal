package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
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
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;
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
		PrintWriter out = response.getWriter();
		MemberDao dao = new MemberDao();

		String cmd = request.getParameter("cmd");
		System.out.println("cmd " + cmd);

		String subject = "";
		String content = "";
		String sender = "bit_team2@naver.com";
		if (cmd.equals("checkEmail")) {
			subject = "[이곳저곳] 이메일 인증 ";
			String receiver = request.getParameter("email");

			Pair<String, String> pair = MailHelper.getRegisterContent();
			content = pair.getValue();

			try {
				sendMail(subject, receiver, content);
				out.print(pair.getKey());
			} catch (Exception e) {
				out.print("메일 발송에 실패했습니다.");
			}

		} else if (cmd.equals("forgotId")) {
			subject = "[이곳저곳] 아이디 찾기";
			String email = request.getParameter("email");

			String id = dao.getMemberIdByEmail(email);
			if (id == null) {
				out.print("일치하는 메일 정보가 없습니다.");
				return;
			}

			content = MailHelper.getForgotIdContent(id);
			try {
				sendMail(subject, email, content);
				out.print(true);
			} catch (Exception e) {
				out.print("메일 발송에 실패했습니다.");
			}

		} else if (cmd.equals("forgotPwd")) {
			subject = "[이곳저곳] 임시 비밀번호 발급";
			String id = request.getParameter("id");

			Member member = dao.getMemberById(id);
			if (member == null) {
				out.print("일치하는 아이디가 없습니다.");
				return;
			}

			String tempPwd = MailHelper.createKey();
			dao.updateTempPassword(id, tempPwd);

			content = MailHelper.getForgotPwdContent(tempPwd);
			try {
				sendMail(subject, member.getEmail(), content);
				out.print(true);
			} catch (Exception e) {
				out.print("메일 발송에 실패했습니다.");
			}
		} else if (cmd.equals("disable")) {
			subject = "[이곳저곳] 비활성화 계정 문의";
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String mailContent = request.getParameter("content");

			content = MailHelper.getDisableMemberContent(id, email, mailContent);
			try {
				sendMail(subject, "bit_team2@naver.com", content);
				out.print(true);
			} catch (Exception e) {
				e.getLocalizedMessage();
				out.print("메일 발송에 실패했습니다.");
			}
		}
	}

	private void sendMail(String subject, String receiver, String content) throws Exception {
		// 메일 보내기 위한 기본 설정
		Properties p = new Properties(); // 정보를 담을 객체
		p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 smtp
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		Authenticator auth = new SMTPAuthenticatior();
		Session ses = Session.getInstance(p, auth);

		// 메일의 내용을 담기 위한 객체
		MimeMessage msg = new MimeMessage(ses);

		// 제목 설정
		msg.setSubject(subject);

		// 보내는 사람의 메일주소 (SMTPAuthenticatior에 설정한 것과 같아야한다.)
		Address senderAddr = new InternetAddress("bit_team2@naver.com");
		msg.setFrom(senderAddr);

		// 받는 사람의 메일주소
		Address receiverAddr = new InternetAddress(receiver);
		msg.addRecipient(Message.RecipientType.TO, receiverAddr);

		// 메시지 본문의 내용과 형식, 캐릭터 셋 설정
		msg.setContent(content, "text/html;charset=UTF-8");

		// 발송
		Transport.send(msg);
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
