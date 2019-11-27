package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class APICourseDetailService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		int contentId = Integer.parseInt(request.getParameter("contentId"));
		System.out.println("apicourseDetailService" + contentId);
		request.setAttribute("contentId", contentId);
		
		
		
		forward.setPath("/WEB-INF/views/api/CourseAPIDetail.jsp");
		return forward;
	}

}
