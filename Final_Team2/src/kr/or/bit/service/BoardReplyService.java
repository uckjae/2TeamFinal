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

		String cmd = request.getParameter("cmd");
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		String content = request.getParameter("content");
		String memberId = (String) request.getSession().getAttribute("memberId");

		BoardDao dao = new BoardDao();
		dao.insertReply(bIdx, memberId, content);
		
		forward.setRedirect(true);
		if (cmd.equals("qna")) 
			forward.setPath("QnABoardDetail.do?bIdx=" + bIdx);
		
		// 아래 코드 주석 풀어서 각 보드 연결하셈
		//else if (cmd.equals("")) 
		//	 

		return forward;
	}
}
