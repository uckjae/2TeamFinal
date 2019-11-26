package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class MemberService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String cmd = request.getParameter("cmd");
		String id = request.getParameter("id");

		MemberDao dao = new MemberDao();
		Member member = dao.getMemberById(id);
		
		request.setAttribute("member", member);
		request.setAttribute("cmd", cmd);
		forward.setPath("/WEB-INF/views/admin/Member.jsp");

		return forward;
	}
}
