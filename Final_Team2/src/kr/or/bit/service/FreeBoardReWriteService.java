package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dto.FreeBoard;

public class FreeBoardReWriteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		FreeBoard freeBoardReWrite = null;
		
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		System.out.println("rewritedo.bidx : " + bIdx);
		
		freeBoardReWrite = new FreeBoard();
		freeBoardReWrite.setbIdx(bIdx);
		
		request.setAttribute("freeBoardReWrite", freeBoardReWrite);
		forward.setPath("/WEB-INF/views/board/free/ReWrite.jsp");
		System.out.println("rewritedo return;");
		return forward;
	}

}
