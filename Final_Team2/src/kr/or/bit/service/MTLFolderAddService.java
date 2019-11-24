package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class MTLFolderAddService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();
		String id = (String)request.getSession().getAttribute("memberId");
		String tlname = request.getParameter("folderAdd");
		int resultRow = boardDao.mTLFolderAdd(id, tlname);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/mypage/MyTravelListFolder.jsp");
		return forward;
	}

}
