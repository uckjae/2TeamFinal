package kr.or.bit.service;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;
import kr.or.bit.dto.QnABoard;

public class QnABoardDetailService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		int bIdx = Integer.parseInt(request.getParameter("bidx")) ;

		BoardDao dao = new BoardDao();
		QnABoard result = dao.getQnABoard(bIdx);
		 
		System.out.println(result.getwDate());
		request.setAttribute("qnaDetail", result);
		forward.setPath("/WEB-INF/views/board/qna/Detail.jsp");
		
		return forward;
	}
}