package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.NoticeBoard;

public class NoticeBoardDeleteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		int bIdx =Integer.parseInt(request.getParameter("bIdx"));
		
		BoardDao dao = new BoardDao();
		boolean noticeBoardDelete =dao.noticeDelete(bIdx);
		
		String msg="";
		if(noticeBoardDelete) {
			msg="삭제완료";
		}else {
			msg="삭제실패";
		}
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", noticeBoardDelete);
		
		forward.setPath("/common/Redirect.jsp");
		
		
		return forward;
	}

}
