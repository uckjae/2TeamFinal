package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Photo;

public class PhotoBoardListService implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	
		ActionForward forward = new ActionForward();
		BoardDao dao = new BoardDao();
		List<Photo> photolist = dao.photoList();
		
		request.setAttribute("photolist", photolist);
		forward.setPath("/WEB-INF/views/board/photo/Main.jsp");
	
	
	
		
		return forward;
	}
}

