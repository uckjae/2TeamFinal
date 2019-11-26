package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MCBoard;
import kr.or.bit.dto.Photo;

public class MyCourseBoardWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		System.out.println("mc write");
		MCBoard mCBoard = null;
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		if (cmd.equals("write")) {
			mCBoard = new MCBoard();
			mCBoard.setbIdx(-1);
		}
		else if (cmd.equals("edit")) {
			int bIdx = Integer.parseInt(request.getParameter("bidx")) ;
			BoardDao dao = new BoardDao();
			mCBoard = dao.courseContent(bIdx);
			System.out.println(mCBoard.toString());
		}

		request.setAttribute("mCBoard", mCBoard);
		forward.setPath("/WEB-INF/views/board/mycourse/Write.jsp");

		return forward;
	}

}
