package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class FreeBoardWriteOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String cmd = request.getParameter("cmd").trim();
		String id = (String)request.getSession().getAttribute("memberId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDao dao = new BoardDao();
		
		int bIdx = 0;
		String msg = "";
		String url = "";
		if (cmd.equals("write")) {
			bIdx = dao.freeContentWrite(id, title, content);
			if (bIdx > 0) {
				msg = "게시글 작성 완료";
			} else {
				msg = "게시글 작성 실패";
			}
		} else if (cmd.equals("edit")) {
			bIdx = Integer.parseInt(request.getParameter("bIdx"));
			boolean result = dao.freeBoardEdit(title, content, bIdx);
			if (result) {
				msg = "게시글 수정 완료";
			} else {
				msg = "게시글 수정 실패";
			}
		}
		
		if (bIdx > 0) {
			url = "FreeBoardDetail.do?bidx=" + bIdx;
		}else {
			url = "FreeBoardWrite.do";
		}
		
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);

		forward.setPath("/common/Redirect.jsp");

		return forward;
	}
	
	
	
}
