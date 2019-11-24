package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MTList;

public class MTLFolderListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();
		String id = (String)request.getSession().getAttribute("memberId");
		List<MTList> mTFolderList = boardDao.mTLFolderList((String)request.getSession().getAttribute("memberId"));
		request.setAttribute("mTList", mTFolderList);
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/mypage/MyTravelListFolder.jsp");
		return forward;
	}
}






