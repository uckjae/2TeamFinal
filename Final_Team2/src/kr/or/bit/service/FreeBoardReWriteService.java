package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class FreeBoardReWriteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		request.setAttribute("freeBoardReWrite", bIdx);
		forward.setPath("/WEB-INF/views/board/free/ReWrite.jsp");
				
		return forward;
	}

}
