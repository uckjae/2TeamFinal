package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.org.jvnet.mimepull.MIMEMessage;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class RegisterOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String address = request.getParameter("postCode") + "/" + request.getParameter("address");
		String birth = request.getParameter("birth");
		int gender = Integer.parseInt(request.getParameter("gender"));

		Member member = new Member();
		member.setId(id);
		member.setName(name);
		member.setPwd(pwd);
		member.setEmail(email);
		member.setAddress(address);
		member.setBirth(birth);
		member.setGender((gender % 2 == 0) ? true : false); // male 0

		MemberDao dao = new MemberDao();
		dao.insertMemeber(member);

		forward.setPath("Login.do");

		return forward;
	}
}
