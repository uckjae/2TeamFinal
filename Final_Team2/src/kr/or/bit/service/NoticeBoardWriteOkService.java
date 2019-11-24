package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.NoticeBoard;

public class NoticeBoardWriteOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String cmd =request.getParameter("cmd").trim();
		String Id = (String)request.getSession().getAttribute("memberId");
		String title =request.getParameter("title");
		String content = request.getParameter("content");
		int isTop = Integer.parseInt(request.getParameter("isTop"));
		
		int bIdx =0;
		String msg="";
		String url="";
		BoardDao dao = new BoardDao();
		if(cmd.equals("write")) {
			bIdx=dao.noticeWrite(id, title, content, isTop);
		}
		
		
		return null;
	}

}
