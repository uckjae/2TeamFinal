package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class RecommendService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String cmd = request.getParameter("cmd");

		if (cmd.equals("main")) {

		} else if (cmd.equals("tagSearch")) {
			forward.setPath("/WEB-INF/views/api/RecommandSearch.jsp");
		} else if (cmd.equals("detail")) {

		}

		return forward;
	}
}
