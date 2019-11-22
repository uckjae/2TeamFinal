package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class FreeBoardDeleteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		BoardDao dao = new BoardDao();
		boolean freeBoardDelete = dao.freeBoardDelete(bIdx);
		
		String msg = "";
		if(freeBoardDelete) {
			msg = "게시글 삭제 완료";
		} else {
			msg = "게시글 삭제 실패";
		}
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", "FreeBoardList.do");

		forward.setPath("/common/Redirect.jsp");
		
		return forward;
	}
	
}
