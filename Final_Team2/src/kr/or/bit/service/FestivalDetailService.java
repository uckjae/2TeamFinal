package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class FestivalDetailService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		String positionx = request.getParameter("mapx");
		String positiony = request.getParameter("mapy");
		
		request.setAttribute("contentId", contentId);
		request.setAttribute("xposition", positionx);
		request.setAttribute("yposition", positiony);
		forward.setPath("/WEB-INF/views/api/FestivalDetail.jsp");
		return forward;
	}
}
