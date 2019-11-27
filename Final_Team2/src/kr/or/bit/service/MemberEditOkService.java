package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class MemberEditOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String address = request.getParameter("postCode") + "/" + request.getParameter("address");
		int isDisable = Integer.parseInt(request.getParameter("disable"));

		MemberDao dao = new MemberDao();
		boolean result = dao.updateMemeber(id, name, pwd, address, isDisable);

		String msg = "";
		if (result) {
			msg = "수정 완료!";
		} else {
			msg = "수정 실패!";
		}
		
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", "Member.do?cmd=detail&id="+id);

		forward.setPath("/common/Redirect.jsp");

		return forward;
	}
}
