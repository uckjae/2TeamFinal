package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MCBoard;

public class MyCourseBoardDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		BoardDao dao = new BoardDao();
		MCBoard mCBoard = dao.courseContent(bIdx);
		System.out.println(mCBoard);
		request.setAttribute("mCBoard", mCBoard);
		forward.setPath("/WEB-INF/views/board/mycourse/Detail.jsp");
		return forward;
	}

}
