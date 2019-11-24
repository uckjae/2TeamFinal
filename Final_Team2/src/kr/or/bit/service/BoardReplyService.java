package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class BoardReplyService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String memberId = (String) request.getSession().getAttribute("memberId");
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));

		BoardDao dao = new BoardDao();
		forward.setPath("/common/Redirect.jsp");

		return forward;
	}
}
