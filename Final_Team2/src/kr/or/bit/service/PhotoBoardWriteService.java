package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dto.Photo;

public class PhotoBoardWriteService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		Photo p = null;
		
		String cmd = request.getParameter("cmd");
		
		if(cmd.equals("write")) {
			p = new Photo(); 
		}else if(cmd.equals("edit")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String photo = request.getParameter("photo");
		}
		
		request.setAttribute("photowrite", p);
		forward.setPath("/WEB-INF/views/board/photo/Write.jsp");
		return forward;
	}
}
