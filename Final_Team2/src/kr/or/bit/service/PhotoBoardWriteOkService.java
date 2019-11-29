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
  	  	System.out.println("경로 : " + uploadpath);
  	  	int size = 1024*1024*10;
		int bIdx = 0;
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadpath, size, "utf-8", new DefaultFileRenamePolicy());
		
			String memberId = (String)request.getSession().getAttribute("memberId");
			String content = multi.getParameter("content");
			String title = multi.getParameter("title");
			String photoName = multi.getFilesystemName("Photo");
			String cmd = multi.getParameter("cmd").trim();
			BoardDao dao = new BoardDao();
			
			String msg = "";
			String url = "";
			boolean success = false;
			
			if(cmd.equals("write")) {
				bIdx = dao.photoWrite(memberId, title, content, photoName);
				if(bIdx > 0) {
					success=true;
					msg = "글 작성을 성공하셨습니다.";
					url = "PhotoBoardList.do";
			}else {
				msg = "글 작성을 실패했습니다.";
				url = "PhotoWrite.do";
			}
			
			}else if(cmd.equals("edit")) {
				System.out.println("에딧");
				 bIdx = Integer.parseInt(request.getParameter("bidx"));
				 System.out.println(bIdx);
				int result = dao.photoEdit(bIdx, title, content, photoName);
				if(result > 0) {
					success=true;
					msg = "글 수정을 성공하셨습니다.";
					url = "PhotoBoardList.do";
				}else {
					msg = "글 수정을 실패하셨습니다.";
				}	
			}
			
		
				
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
			request.setAttribute("board_result", success);

			forward.setPath("/common/Redirect.jsp");	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return forward;
	}
}
