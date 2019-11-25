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

public class PhotoBoardListService implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDao dao = new BoardDao();
		List<Board> boardlist = dao.photoList();

		List<Photo> photolist =  new ArrayList<Photo>();
		for (Board board : boardlist) {
			System.out.println("12>"+board.getbIdx());
			photolist.add(dao.boardDetailPhoto(board.getbIdx()).get(0));
			
		}
		System.out.println("2");
		System.out.println("dy==여기");
		System.out.println(photolist);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("photolist", photolist);
		forward.setPath("/WEB-INF/views/board/photo/Main.jsp");
		//System.out.println(boardlist);
		
		
		return forward;
	}
}

