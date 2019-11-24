package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.NoticeBoard;

public class NoticeBoardWriteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		NoticeBoard noticewrite = null;
		
		String cmd =request.getParameter("cmd");
		
		if(cmd.equals("write")) {
			noticewrite=new NoticeBoard();
			noticewrite.setbIdx(-1);
		}else if(cmd.equals("edit")) {
			int bIdx = Integer.parseInt(request.getParameter("bidx")) ;
			BoardDao dao = new BoardDao();
			noticewrite = dao.noticeDetail(bIdx);
			System.out.println(noticewrite.toString());
		}
		request.setAttribute("noticewrite", noticewrite);
		forward.setPath("/WEB-INF/views/board/notice/Write.jsp");
		
		return forward;
	}

}
