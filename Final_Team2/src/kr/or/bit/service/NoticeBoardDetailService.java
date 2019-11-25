package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.NoticeBoard;

public class NoticeBoardDetailService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		int bIdx =Integer.parseInt(request.getParameter("bIdx"));
		
		BoardDao dao = new BoardDao();
		NoticeBoard noticeBoard = dao.noticeDetail(bIdx);
		
		request.setAttribute("noticeBoard", noticeBoard);
		forward.setPath("/WEB-INF/views/board/notice/Detail.jsp");
		
		
		return forward;
	}

}
