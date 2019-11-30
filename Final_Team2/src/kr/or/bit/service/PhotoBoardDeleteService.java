package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class PhotoBoardDeleteService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
	
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		BoardDao dao = new BoardDao();
		boolean result = dao.deleteBoardBybIdx(bIdx);
		System.out.println(result);
		String msg = "";
		if(result) {
			msg = "글 삭제 완료";
		}else {
			msg = "글삭제 실패";
		}
		
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", "PhotoBoardList.do");
		request.setAttribute("board_result", result);
		
		forward.setPath("/common/Redirect.jsp");

		return forward;
	}
}
