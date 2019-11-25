package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MTLContent;

public class MTListContentSevice implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();
		int tLidx = Integer.parseInt(request.getParameter("tLidx"));
		List<MTLContent> mTLContentList = boardDao.mTListContent(tLidx);
		request.setAttribute("mTLContent",mTLContentList);
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/mypage/MyTravelList.jsp");
		return forward;
	}

}
