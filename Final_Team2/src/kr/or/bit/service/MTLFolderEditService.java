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
		System.out.println("tLName : " + tLname);
	//	String id = (String)request.getSession().getAttribute("memberId");
		int tLidx = Integer.parseInt(request.getParameter("tLidx"));
		System.out.println("서비스 tLidx" + tLidx);
		MTList mtFolder = new MTList();
		System.out.println("mTList 서비스 :" + mtFolder);
		int resultRow = boardDao.mTLFolderEdit(tLidx,tLname);
		String url = "";
		String msg = "";
		if(resultRow > 0) {
			url = "MTFolderList.do";
			msg = tLname + "로 수정되었습니다";
		} else {
			url = "MTFolderList.do";
			msg = "수정에 실패하였습니다.";
		}
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", msg);
		forward.setRedirect(false);
		forward.setPath("/common/Redirect.jsp");
		return forward;
	}

}
