package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.FreeBoard;

public class FreeBoardReWriteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		FreeBoard freeBoardReWrite = null;
		BoardDao dao = new BoardDao();
		
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		freeBoardReWrite = dao.freeBoardDetail(bIdx);
		
		request.setAttribute("freeBoardReWrite", freeBoardReWrite);
		forward.setPath("/WEB-INF/views/board/free/ReWrite.jsp");
		
		return forward;
	}

}
