package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;


public class MemberListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		MemberDao dao = new MemberDao();
		List<Member> members = dao.getMembersByIsAdmin(false);
		
		request.setAttribute("members", members);
		forward.setPath("/WEB-INF/views/admin/MemberList.jsp");
		
		return forward;
	}
}
