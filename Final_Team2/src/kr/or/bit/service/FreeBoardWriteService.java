package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.FreeBoard;
import kr.or.bit.dto.QnABoard;

public class FreeBoardWriteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		FreeBoard freeBoardWrite = null;
		
		String cmd = request.getParameter("cmd");
		
		if(cmd.equals("write")) {
			freeBoardWrite = new FreeBoard();
			freeBoardWrite.setbIdx(-1);
		}else if(cmd.equals("edit")) {
			int bIdx = Integer.parseInt(request.getParameter("bidx")) ;
			BoardDao dao = new BoardDao();
			freeBoardWrite = dao.freeBoardDetail(bIdx);
			System.out.println(freeBoardWrite.toString());
		}
		
		request.setAttribute("freeBoardWrite", freeBoardWrite);
		forward.setPath("/WEB-INF/views/board/free/Write.jsp");

		return forward;
	}
	
}
