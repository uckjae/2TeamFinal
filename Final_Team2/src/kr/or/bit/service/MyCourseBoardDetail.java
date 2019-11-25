package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MCBoard;
import kr.or.bit.dto.Photo;

public class MyCourseBoardDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		BoardDao dao = new BoardDao();
		MCBoard board = dao.courseContent(bIdx);
		List<Photo> photos = dao.courseDetailPhoto(bIdx);
		
		request.setAttribute("board", board);
		request.setAttribute("photos", photos);
		forward.setPath("/WEB-INF/views/board/mycourse/Detail.jsp");
		return forward;
	}

}
