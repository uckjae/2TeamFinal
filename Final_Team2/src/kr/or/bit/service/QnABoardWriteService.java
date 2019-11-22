package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;
import kr.or.bit.dto.QnABoard;

public class QnABoardWriteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		QnABoard board = new QnABoard();
		String cmd=(String) request.getSession().getAttribute("cmd");
		if(cmd.equals("write")) {
			
		}else if (cmd.equals("edit")){
			String title = request.getParameter("title");
			String content = request.getParameter("summernote");
			Boolean isPublic = Integer.parseInt(request.getParameter("isPublic")) == 0 ? false : true;
		}


		forward.setPath("/common/Redirect.jsp");
		
		return forward;
	}
}
