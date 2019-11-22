package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class QnABoardWriteDetailService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String memberId=(String) request.getSession().getAttribute("memberId");
		String bIdx = request.getParameter("bidx");

		BoardDao dao = new BoardDao();
		boolean result = dao.insertQnABoard(memberId, title, content, isPublic);
		
		String msg = "";
		String url = "";
		if (result) {
			msg = "Q & A 작성 완료!";
			url = "QnABoardDetail.do";
		} else {
			msg = "Q & A 작성 실패! 글 작성 페이지로 재 이동합니다.";
			url = "QnABoardWrite.do";
		}

		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);

		forward.setPath("/common/Redirect.jsp");
		
		return forward;
	}
}
