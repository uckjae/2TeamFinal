package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MTList;
import kr.or.bit.dto.QnABoard;

public class MTFolderListChangeService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		MTList mTList = null;

		String cmd = request.getParameter("cmd");

		if (cmd.equals("add")) {
			mTList = new MTList();
			mTList.settLidx(-1);
		}
		else if (cmd.equals("edit")) {
			int tLIdx = Integer.parseInt(request.getParameter("tLIdx")) ;
			BoardDao dao = new BoardDao();
			mTList = (MTList) dao.mTListContent(tLIdx);
			System.out.println(mTList.toString());
		}
		request.setAttribute("mTList", mTList);
		forward.setPath("/WEB-INF/views/board/mypage/MyTravelListFolderModal.jsp");

		return forward;
	}

}
