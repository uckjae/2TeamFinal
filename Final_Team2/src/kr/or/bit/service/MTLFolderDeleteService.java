package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class MTLFolderDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();	
		int tLidx = Integer.parseInt(request.getParameter("tLidx"));
		int resultRow = boardDao.mTLFolderDelete(tLidx);
		String msg = "";
		if(resultRow > 0) {
			msg = "삭제 성공하였습니다";
		} else {
			msg = "삭제에 실패하였습니다";
	    }
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", "MTFolderList.do");
		forward.setRedirect(false);
		forward.setPath("/common/Redirect.jsp");
		return forward;
	}
}
