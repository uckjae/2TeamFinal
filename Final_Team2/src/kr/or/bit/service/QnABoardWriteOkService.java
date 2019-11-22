package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class QnABoardWriteOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String memberId = (String) request.getSession().getAttribute("memberId");
		String cmd = request.getParameter("cmd").trim();
		String title = request.getParameter("title");
		String content = request.getParameter("summernote");
		int isPublic = Integer.parseInt(request.getParameter("isPublic"));

		int bIdx = 0;
		String msg = "";
		String url = "";
		BoardDao dao = new BoardDao();
		if (cmd.equals("write")) {
			bIdx = dao.insertQnABoard(memberId, title, content, isPublic);
			if (bIdx > 0) {
				msg = "Q & A 작성 완료!";
			} else {
				msg = "Q & A 작성 실패! 글 작성 페이지로 재 이동합니다.";
			}
		} else if (cmd.equals("edit")) {
			bIdx = Integer.parseInt(request.getParameter("bIdx"));
			boolean result = dao.updateQnABoard(bIdx, title, content, isPublic);
			if (result) {
				msg = "Q & A 수정 완료!";
			} else {
				msg = "Q & A 수정 실패! 글 작성 페이지로 재 이동합니다.";
			}
		}

		if (bIdx > 0)
			url = "QnABoardDetail.do?bidx=" + bIdx;
		else
			url = "QnABoardWrite.do";

		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);

		forward.setPath("/common/Redirect.jsp");

		return forward;
	}
}
