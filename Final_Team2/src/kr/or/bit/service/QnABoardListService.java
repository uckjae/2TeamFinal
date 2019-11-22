package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;
import kr.or.bit.dto.QnABoard;

public class QnABoardListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		BoardDao dao = new BoardDao();
		List<QnABoard> qnaList = dao.getQnABoards();

		request.setAttribute("qnaList", qnaList);
		forward.setPath("/WEB-INF/views/board/qna/Main.jsp");

		return forward;
	}
}
