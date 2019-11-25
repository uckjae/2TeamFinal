package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Photo;

public class PhotoBoardDetailService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int bIdx = Integer.parseInt(request.getParameter("bidx"));
		System.out.println("여기와?");
		BoardDao dao = new BoardDao();
		Photo content = dao.photoContent(bIdx);
		
		request.setAttribute("photoContent", content);
		forward.setPath("/WEB-INF/views/board/photo/Detail.jsp");
		
		
		return forward;
	}
}
