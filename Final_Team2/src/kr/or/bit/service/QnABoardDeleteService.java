package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.QnABoard;

public class QnABoardDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		int bIdx = Integer.parseInt(request.getParameter("bIdx")) ;

		BoardDao dao = new BoardDao();
		boolean result = dao.deleteQnABoard(bIdx);

		String msg = "";
		if (result) {
			msg = "Q & A 삭제 완료! 글 목록 페이지로 이동합니다.";
		} else {
			msg = "Q & A 삭제 실패! 글 목록 페이지로 이동합니다.";
		}

		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", "QnABoardList.do");
		request.setAttribute("board_result", result);
		
		forward.setPath("/common/Redirect.jsp");
		
		return forward;
	}
}
