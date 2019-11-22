package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class PhotoBoardWriteOkService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String memberId = (String)request.getSession().getAttribute("memberId");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String photoName = request.getParameter("Photo");
		BoardDao dao = new BoardDao();
		int result = dao.photoWrite(memberId, title, content, photoName);
		System.out.println("이거 : " + content);
		System.out.println("이거 : " + title);
		String msg = "";
		String url = "";
		if(result > 0) {
			msg = "글 작성을 성공하셨습니다.";
			url = "PhotoBoardList.do";
		}else {
			msg = "글 작성을 실패했습니다.";
			url = "PhotoWrite.do";
		}
			
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);

		forward.setPath("/common/Redirect.jsp");
		
		return forward;
	}
}
