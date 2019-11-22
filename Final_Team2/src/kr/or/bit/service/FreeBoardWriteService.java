package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class FreeBoardWriteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String id = (String)request.getSession().getAttribute("memberId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(id + " / " + title + " / " + content);
		BoardDao dao = new BoardDao();
		boolean write = dao.freeContentWrite(id, title, content);
		System.out.println("write : " + write);
		String msg = "";
		String url = "";
		if (write) {
			msg = "게시글 작성 완료";
			url = "FreeBoardDetail.do";
		} else {
			msg = "게시글 작성 실패";
			url = "FreeBoardWrite.do";
		}
		System.out.println("게시글 작성 성공실패");
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);

		forward.setPath("/common/Redirect.jsp");
		System.out.println("forward : " + forward);
		return forward;
	}
	
}
