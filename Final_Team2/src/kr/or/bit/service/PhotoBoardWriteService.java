package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Photo;

public class PhotoBoardWriteService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		Board photowrite = null;
		Photo photo = null;
		String cmd = request.getParameter("cmd");
		
		if(cmd.equals("write")) {
			photowrite = new Board(); 
			photowrite.setbIdx(-1);
		}else if(cmd.equals("edit")) {
			int bIdx = Integer.parseInt(request.getParameter("bIdx"));
			BoardDao dao = new BoardDao();
			photo = dao.boardDetailPhoto(bIdx).get(0);
			photowrite = dao.getBoardByBIdx(bIdx);
		}
		request.setAttribute("photo", photo);
		request.setAttribute("photowrite", photowrite);
		forward.setPath("/WEB-INF/views/board/photo/Write.jsp");
		return forward;
	}
}
