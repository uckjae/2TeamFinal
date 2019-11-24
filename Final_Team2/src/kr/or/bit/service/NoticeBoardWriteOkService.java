package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.NoticeBoard;

public class NoticeBoardWriteOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String cmd =request.getParameter("cmd").trim();
		String memberId = (String)request.getSession().getAttribute("memberId");
		String title =request.getParameter("title");
		String content = request.getParameter("summernote");
		int isTop = Integer.parseInt(request.getParameter("isTop"));
		
		BoardDao dao = new BoardDao();
		int bIdx =0;
		String msg="";
		String url="";
		
		System.out.println("writeok:"+cmd);
		if(cmd.equals("write")) {
			bIdx=dao.noticeWrite(memberId, title, content, isTop);
			System.out.println("bidx:"+bIdx);
			if(bIdx>0) {
				msg ="공지사항 작성완료!";	
			}else {
				msg="공지사항 작성실패!";
			}
		}else if (cmd.equals("edit")) {
			bIdx = Integer.parseInt(request.getParameter("bIdx"));
			boolean result = dao.noticeEdit(bIdx, title, content, isTop);
			if (result) {
				msg = "공지사항 수정 완료";
			} else {
				msg = "공지사항 수정 실패";
			}
		}
		
		if (bIdx > 0) {
			url = "NoticeBoardList.do";
		}else {
			url = "NoticeBoardList.do";
		}
		
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);
		
		forward.setPath("/common/Redirect.jsp");
		
		return forward;
	}

}
