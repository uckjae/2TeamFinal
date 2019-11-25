package kr.or.bit.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.MCBoard;
import kr.or.bit.dto.Photo;

public class MyCourseBoardWriteService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		Board board = new Board();
		MCBoard mCBoard = new MCBoard();
		List<Photo> photos = new ArrayList<Photo>();
		
		int bIdx = 0;
		String id = "";
		String title = "";
		StringBuilder content = new StringBuilder();
		Date wDate = null;
		int rNum = 0;
		int bCode = 3;
		
		int mCIdx = 0;
		int likeNum = 0;
		
		ServletContext application = request.getServletContext();
  	  	String uploadpath = application.getRealPath("upload");
  	  	int size = 1024*1024*10;
		
		try {
			BoardDao dao = new BoardDao();
			MultipartRequest multi = new MultipartRequest(request, uploadpath, size, "utf-8", new DefaultFileRenamePolicy());
			
			id = (String)request.getSession().getAttribute("memberId");
			System.out.println("MyCourseBoardWriteService : " + id);
			title = multi.getParameter("title");
			
			//System.out.println("MCBoardWriteService 59 : "+multi.getParameter("area"));
			//System.out.println("MCBoardWriteService 59 : "+multi.getParameterValues("area"));
			System.out.println("content길이"+multi.getParameterValues("content"));
			System.out.println("area 길이"+multi.getParameterValues("area"));
			for(int i=0; i<multi.getParameterValues("content").length; i++) {
				content.append("╊");
				content.append(multi.getParameterValues("area")[i]);
				content.append("╊");
				content.append(multi.getParameterValues("content")[i]);
			}
			System.out.println("MyCourseBoardWriteService 65 : "+id);
			board.setbIdx(bIdx);
			board.setId(id);
			board.setTitle(title);
			board.setContent(content.toString());
			board.setwDate(wDate);
			board.setrNum(rNum);
			board.setbCode(bCode);
			
			mCBoard.setbIdx(bIdx);
			mCBoard.setmCidx(mCIdx);
			mCBoard.setLikeNum(likeNum);
			
			Enumeration filenames = multi.getFileNames();
			while(filenames.hasMoreElements()) {
				Photo photo = new Photo();
				String file = (String)filenames.nextElement();
				photo.setPhotoName(multi.getFilesystemName(file));
				photos.add(photo);
			}
			
			int result = dao.courseWrite(board, mCBoard, photos);
			
			forward = new ActionForward();
        	forward.setRedirect(false);
            forward.setPath("/MyCourseBoardList.do");
		} 
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		}
		
		
		return forward;
	}

}
