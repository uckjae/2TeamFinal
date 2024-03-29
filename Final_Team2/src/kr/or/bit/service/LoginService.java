package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class LoginService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		MemberDao dao = new MemberDao();
		Member member = dao.login(id, pwd);

		String path = "Login.do";
		if (member != null) {
			if (member.isDisable()) {
				request.setAttribute("member", member);
				path = "/WEB-INF/views/login/Disable.jsp";
			} else {
				request.getSession().setAttribute("memberId", member.getId());
				request.getSession().setAttribute("isAdmin", member.isAdmin());
				path = "index.jsp";
			}
		}

		forward.setPath(path);
		return forward;
	}
}
