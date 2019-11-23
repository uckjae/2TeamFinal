package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.FreeBoard;

public class FreeBoardDetailService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		BoardDao dao = new BoardDao();
		FreeBoard freeBoardDetail = dao.freeBoardDetail(bIdx);
		
		request.setAttribute("freeBoardDetail", freeBoardDetail);
		forward.setPath("/WEB-INF/views/board/free/Detail.jsp");
		
		return forward;
	}
	
}