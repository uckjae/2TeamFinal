package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class MyInformationIntroService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		MemberDao memberDao = new MemberDao();
		String id = (String)request.getSession().getAttribute("memberId");
		Member memberInfo = memberDao.getMemberById(id);
		request.setAttribute("memberInfo", memberInfo);
		forward.setPath("/WEB-INF/views/mypage/MyInformation.jsp");
		return forward;
	}

}
