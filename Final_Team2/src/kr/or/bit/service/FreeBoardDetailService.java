package kr.or.bit.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.FreeBoard;

public class FreeBoardDetailService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String id = (String)request.getSession().getAttribute("memberId");
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		if(id != null) {
			BoardDao dao = new BoardDao();
			dao.setReadNum(bIdx);
			FreeBoard freeBoardDetail = dao.freeBoardDetail(bIdx);

			request.setAttribute("freeBoardDetail", freeBoardDetail);
			forward.setPath("/WEB-INF/views/board/free/Detail.jsp");
		}else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alret('회원만 조회 가능합니다')</script>");
				out.flush();
			}catch (Exception e) {e.printStackTrace();}finally {}
			forward.setRedirect(false);
			forward.setPath("FreeBoardList.do");
		}
		return forward;
	}
	
}
