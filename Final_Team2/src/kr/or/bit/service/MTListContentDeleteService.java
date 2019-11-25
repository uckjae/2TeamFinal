package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class MTListContentDeleteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();
		int tLCidx = Integer.parseInt(request.getParameter("tLCidx"));
		int tLidx = Integer.parseInt(request.getParameter("tLidx"));
		int resultRow = boardDao.mTListContentDelete(tLCidx);
		String msg = "";
		if(resultRow > 0) {
			msg = "여행지를 삭제하였습니다";
		} else {
			msg = "삭제에 실패하였습니다.";
		}
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", "MTList.do?tLidx=" + tLidx);
		forward.setRedirect(false);
		forward.setPath("/common/Redirect.jsp");
		return forward;
	}

}
