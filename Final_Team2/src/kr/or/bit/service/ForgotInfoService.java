package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.org.jvnet.mimepull.MIMEMessage;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class ForgotInfoService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String cmd = request.getParameter("cmd");

		// 아이디 분실 경우 입력받은 이메일로 전송
		if (cmd.equals("id")) {
			String email = request.getParameter("email");
		}
		// 비밀번호 분실 경우 회원정보 이메일로 전송
		else {
			String id = request.getParameter("id");
			MemberDao dao = new MemberDao();
			Member member = dao.getMemberById(id);
			member.getEmail();
		}

		forward.setPath("Login.do");
		return forward;
	}
}
