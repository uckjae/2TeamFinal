package kr.or.bit.service;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class PhotoBoardWriteOkService implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		ServletContext application = request.getServletContext();
  	  	String uploadpath = application.getRealPath("upload");
  	  	int size = 1024*1024*10;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadpath, size, "utf-8", new DefaultFileRenamePolicy());
		
			String memberId = (String)request.getSession().getAttribute("memberId");
			String content = multi.getParameter("content");
			String title = multi.getParameter("title");
			String photoName = multi.getParameter("Photo");
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
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return forward;
	}
}
