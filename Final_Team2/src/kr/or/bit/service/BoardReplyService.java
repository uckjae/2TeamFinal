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

		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		String content = request.getParameter("content");
		String memberId = (String) request.getSession().getAttribute("memberId");

		BoardDao dao = new BoardDao();
		dao.insertReply(bIdx, memberId, content);
		
		forward.setPath("QnABoardDetail.do?bIdx=" + bIdx);
		
		return forward;
	}
}
