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

public class MyCourseBoardWriteOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		System.out.println("in ok");
		
		String msg = "";
		String url = "";
		String cmd = request.getParameter("cmd").trim();
		System.out.println("cmd" + cmd);
		ServletContext application = request.getServletContext();
  	  	String uploadpath = application.getRealPath("upload");
  	  	int size = 1024*1024*10;
  	  	MultipartRequest multi = null;
  	  	try {
  	  		multi = new MultipartRequest(request, uploadpath, size, "utf-8", new DefaultFileRenamePolicy());
  	  	} catch (IOException e1) {
  	  		e1.printStackTrace();
  	  	}
		
		Board board = new Board();
		MCBoard mCBoard = new MCBoard();
		List<Photo> photos = new ArrayList<Photo>();
		
		int bIdx = 0;
		
		String id = (String)request.getSession().getAttribute("memberId");
		
		String title = multi.getParameter("title");
		
		StringBuilder content = new StringBuilder();
		for(int i=0; i<multi.getParameterValues("content").length; i++) {
			
			content.append(multi.getParameterValues("area")[i]);
			content.append("╊");
			content.append(multi.getParameterValues("content")[i]);
			content.append("╊");
		}
		content.subSequence(0, content.length()-2);
		System.out.println("content길이"+multi.getParameterValues("content"));
		System.out.println("area 길이"+multi.getParameterValues("area"));
		
		
		
		
		Date wDate = null;
		int rNum = 0;
		int bCode = 3;
		
		int mCIdx = 0;
		int likeNum = 0;
		
		board.setId(id);
		board.setTitle(title);
		board.setContent(content.toString());
		board.setwDate(wDate);
		board.setbCode(bCode);
		
		BoardDao dao = new BoardDao();
		if(cmd.equals("write")) {
									
			board.setbIdx(bIdx);
			board.setrNum(rNum);
			
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
			if(result <= 0) {
				msg = "게시글 작성 실패! 글 작성 페이지로 재 이동합니다.";
				System.out.println("MyCourseBoardWriteOkService dao.courseWrite() error"); 
			}else {
				msg = "게시글 작성 완료!";
			}
		}else if(cmd.equals("edit")) {
			System.out.println("bIdx" + multi.getParameter("bIdx"));
			System.out.println("bidx" + multi.getParameter("bidx"));
			
			bIdx = Integer.parseInt(multi.getParameter("bIdx"));
			rNum = Integer.parseInt(multi.getParameter("rNum"));
			mCIdx = Integer.parseInt(multi.getParameter("mCIdx"));
			likeNum = Integer.parseInt(multi.getParameter("likeNum"));
			board.setbIdx(bIdx);
			board.setrNum(rNum);
			mCBoard.setmCidx(mCIdx);
			
			Enumeration filenames = multi.getFileNames();
			while(filenames.hasMoreElements()) {
				Photo photo = new Photo();
				String file = (String)filenames.nextElement();
				photo.setbIdx(bIdx);
				photo.setPhotoName(multi.getFilesystemName(file));
				photos.add(photo);
			}
			
			int result = dao.courseEdit(board, mCBoard, photos);
			if(result <= 0) {
				msg = "게시글 수정 실패! 글 작성 페이지로 재 이동합니다.";
				System.out.println("MyCourseBoardWriteOkService dao.courseEdit() error"); 
			}else {
				msg = "게시글 수정 완료!";
			}
		}
		
		System.out.println(bIdx);
		if (bIdx > 0)
			url = "MyCourseBoardDetail.do?bIdx=" + bIdx;
		else
			url = "MyCourseBoardWrite.do";
		
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);

		forward.setPath("/common/Redirect.jsp");
		
		return forward;
	}

}
