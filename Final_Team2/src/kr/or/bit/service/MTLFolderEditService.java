package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MTList;

public class MTLFolderEditService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();	
		String tLname = request.getParameter("editFolder");
		int tLidx = Integer.parseInt(request.getParameter("tLidx"));

		int resultRow = boardDao.mTLFolderEdit(tLidx,tLname);
		String msg = "";
		if(resultRow > 0) {
			msg = tLname + "(으)로 수정되었습니다";
		} else {
			msg = "수정에 실패하였습니다.";
		}
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", "MTFolderList.do");
		request.setAttribute("board_result", resultRow > 0);

		forward.setPath("/common/Redirect.jsp");
		return forward;
	}

}
