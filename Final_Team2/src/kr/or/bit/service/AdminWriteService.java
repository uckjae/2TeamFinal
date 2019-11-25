package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;

public class AdminWriteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String cmd = request.getParameter("cmd");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberDao dao = new MemberDao();
		if (cmd.equals("edit")) {
			dao.updateAdmin(id, pwd);
		} else if (cmd.equals("write")) {
			dao.insertAdmin(id, pwd);
		}
		
		forward.setPath("AdminList.do");

		return forward;
	}
}
