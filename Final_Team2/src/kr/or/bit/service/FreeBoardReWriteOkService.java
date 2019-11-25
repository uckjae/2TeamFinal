package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class FreeBoardReWriteOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		String id = (String)request.getSession().getAttribute("memberId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDao dao = new BoardDao();
		int result = dao.FreeBoardReWrite(id, title, content, bIdx);
		
		String msg = "";
		String url = "";
		if(result > 0) {
			msg = "답글 작성 완료";
			url = "FreeBoardDetail.do?bIdx=" + result;
		} else {
			msg = "답글 작성 실패";
			url = "FreeBoardList.do";
		}
		
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);
		
		forward.setPath("/common/Redirect.jsp");
		
		return forward;
	}

}
