package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

public class PhotoBoardWriteService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		Board photowrite = null;
		
		String cmd = request.getParameter("cmd");
		
		if(cmd.equals("write")) {
			photowrite = new Board(); 
		//	photowrite.setbIdx(-1);
		}else if(cmd.equals("edit")) {
			int bIdx = Integer.parseInt(request.getParameter("bIdx"));
			BoardDao dao = new BoardDao();
			photowrite = dao.getBoardByBIdx(bIdx);
		}
		
		request.setAttribute("photowrite", photowrite);
		forward.setPath("/WEB-INF/views/board/photo/Write.jsp");
		return forward;
	}
}
