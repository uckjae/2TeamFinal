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
		String url = "";
		String msg = "";
		System.out.println(resultRow);
		if(resultRow > 0) {
			url = "MTFolderList.do";
			msg = tlname + "폴더가 생성되었습니다";
		} else {
			url = "MTFolderListAddForm.do";
			msg = "폴더 생성에 실패하였습니다.";
		}
		request.setAttribute("board_msg",msg );
		request.setAttribute("board_url", url);
		forward.setRedirect(false);
		//forward.setPath("/WEB-INF/views/mypage/MyTravelListFolder.jsp");
		forward.setPath("/common/Redirect.jsp");
		return forward;
	}

}
