package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class MyCourseBoardLikeIncrease implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao dao = new BoardDao();
		
		int mCIdx = Integer.parseInt(request.getParameter("mCIdx"));
		String id = (String) request.getSession().getAttribute("memberId");
		int likeNum = dao.getCourseLikeNum(mCIdx, id);
		return null;
	}

}
