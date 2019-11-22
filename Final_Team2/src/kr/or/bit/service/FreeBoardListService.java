package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.FreeBoard;

public class FreeBoardListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		BoardDao dao = new BoardDao();
		
		List<FreeBoard> freeBoardList = dao.freeBoardList();
		request.setAttribute("freeBoardList", freeBoardList);
		forward.setPath("/WEB-INF/views/board/free/Main.jsp");
		
		return forward;
	}
	
}
