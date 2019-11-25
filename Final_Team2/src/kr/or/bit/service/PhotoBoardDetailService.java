package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Photo;

public class PhotoBoardDetailService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int bIdx = Integer.parseInt(request.getParameter("bidx"));
		BoardDao dao = new BoardDao();
		Board board = dao.getBoardByBIdx(bIdx);
		Photo photo = dao.boardDetailPhoto(bIdx).get(0);
		
		request.setAttribute("photo", photo);
		request.setAttribute("board", board);
		forward.setPath("/WEB-INF/views/board/photo/Detail.jsp");
		
		
		return forward;
	}
}
