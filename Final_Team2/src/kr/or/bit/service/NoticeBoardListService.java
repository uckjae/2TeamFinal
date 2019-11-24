package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.NoticeBoard;

public class NoticeBoardListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		BoardDao dao = new BoardDao();
		List<NoticeBoard> nboard = dao.noticeList();
		request.setAttribute("nboard", nboard);
		forward.setPath("/WEB-INF/views/board/notice/Main.jsp");

		return forward;
	}
}

