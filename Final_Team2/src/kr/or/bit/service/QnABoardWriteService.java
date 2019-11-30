package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;
import kr.or.bit.dto.QnABoard;

public class QnABoardWriteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		QnABoard qnaWrite = null;

		String cmd = request.getParameter("cmd");
		System.out.println("cmd : "+cmd);
		if (cmd.equals("write")) {
			qnaWrite = new QnABoard();
			qnaWrite.setbIdx(-1);
		}
		else if (cmd.equals("edit")) {
			int bIdx = Integer.parseInt(request.getParameter("bidx")) ;
			BoardDao dao = new BoardDao();
			qnaWrite = dao.getQnABoard(bIdx);
			System.out.println(qnaWrite.toString());
		}

		request.setAttribute("qnaWrite", qnaWrite);
		forward.setPath("/WEB-INF/views/board/qna/Write.jsp");

		return forward;
	}
}
