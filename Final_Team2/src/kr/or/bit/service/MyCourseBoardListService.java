package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MCBoard;
import kr.or.bit.dto.Photo;

public class MyCourseBoardListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		BoardDao dao = new BoardDao();
		List<MCBoard> boardlist = dao.courseList();
		List<Photo> photoList = dao.courseListPhotos();
		request.setAttribute("MCBList", boardlist);
		request.setAttribute("photoList", photoList);
		forward.setPath("/WEB-INF/views/board/mycourse/Main.jsp");
		
		return forward;
	}

}
