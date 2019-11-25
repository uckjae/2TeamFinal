package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;

public class MemberDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String cmd = request.getParameter("cmd");
		String id = request.getParameter("id");

		MemberDao dao = new MemberDao();
		dao.deleteMemeberById(id);

		if (cmd.equals("admin")) {
			forward.setPath("AdminList.do");
		} else {
			forward.setPath("MemberList.do");
		}

		return forward;
	}
}
