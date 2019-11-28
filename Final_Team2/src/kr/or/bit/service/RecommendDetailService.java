package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class RecommendDetailService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int contentTypeId = Integer.parseInt(request.getParameter("contentTypeId"));
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		System.out.println("contentId : " + contentId);
		request.setAttribute("contentId", contentId);
		request.setAttribute("contentTypeId", contentTypeId);
		
		forward.setPath("/WEB-INF/views/api/RecommendDetail.jsp");
		return forward;
	}

}
