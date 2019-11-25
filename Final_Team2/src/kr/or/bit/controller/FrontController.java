package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.AdminListService;
import kr.or.bit.service.AdminWriteService;
import kr.or.bit.service.FreeBoardDeleteService;
import kr.or.bit.service.FreeBoardDetailService;
import kr.or.bit.service.FreeBoardListService;
import kr.or.bit.service.FreeBoardReWriteOkService;
import kr.or.bit.service.FreeBoardReWriteService;
import kr.or.bit.service.FreeBoardWriteOkService;
import kr.or.bit.service.FreeBoardWriteService;
import kr.or.bit.service.LoginService;
import kr.or.bit.service.LogoutService;
import kr.or.bit.service.MTLFolderAddService;
import kr.or.bit.service.MTLFolderDeleteService;
import kr.or.bit.service.MTLFolderEditService;
import kr.or.bit.service.MTLFolderListService;
import kr.or.bit.service.MTListContentDeleteService;
import kr.or.bit.service.MTListContentSevice;
import kr.or.bit.service.MemberDeleteService;
import kr.or.bit.service.MemberListService;
import kr.or.bit.service.MyCourseBoardDetail;
import kr.or.bit.service.MyCourseBoardListService;
import kr.or.bit.service.MyCourseBoardWriteService;
import kr.or.bit.service.NoticeBoardDeleteService;
import kr.or.bit.service.NoticeBoardDetailService;
import kr.or.bit.service.NoticeBoardListService;
import kr.or.bit.service.NoticeBoardWriteOkService;
import kr.or.bit.service.NoticeBoardWriteService;
import kr.or.bit.service.PhotoBoardDeleteService;
import kr.or.bit.service.PhotoBoardDetailService;
import kr.or.bit.service.PhotoBoardListService;
import kr.or.bit.service.PhotoBoardWriteOkService;
import kr.or.bit.service.PhotoBoardWriteService;
import kr.or.bit.service.QnABoardDeleteService;
import kr.or.bit.service.QnABoardDetailService;
import kr.or.bit.service.QnABoardListService;
import kr.or.bit.service.QnABoardWriteOkService;
import kr.or.bit.service.QnABoardWriteService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		/* LOGIN */
		// 화면
		if (url_Command.equals("/Login.do")) {
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/login/Login.jsp");
		} 
		// 진행
		else if (url_Command.equals("/LoginOk.do")) {
			action = new LoginService();
			forward = action.execute(request, response);
		} 
		
		/* LOGOUT */
		//  진헹
		else if (url_Command.equals("/Logout.do")) {
			action = new LogoutService();
			forward = action.execute(request, response);
		}
		
		/* REGISTER */
		//  화면
		else if (url_Command.equals("/Register.do")) {
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/register/Register.jsp");
		}
		//  진행
		else if (url_Command.equals("/RegisterOk.do")) {
			
		}
		
		/* BOARD */	
		// Free Board
		else if (url_Command.equals("/FreeBoardList.do")) {
			action = new FreeBoardListService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/FreeBoardDetail.do")) {
			action = new FreeBoardDetailService();
			forward = action.execute(request, response);
		}
		else if(url_Command.equals("/FreeBoardWrite.do")) {
			action = new FreeBoardWriteService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/FreeBoardWriteOk.do")) {
			action = new FreeBoardWriteOkService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/FreeBoardReWrite.do")) {
			action = new FreeBoardReWriteService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/FreeBoardReWriteOk.do")) {
			action = new FreeBoardReWriteOkService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/FreeBoardDelete.do")) {
			action = new FreeBoardDeleteService();
			forward = action.execute(request, response);
		}
		// Photo Board
		else if (url_Command.equals("/PhotoBoardList.do")) {
			action = new PhotoBoardListService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/PhotoBoardDetail.do")) {
			action = new PhotoBoardDetailService();
			forward = action.execute(request, response);
		}else if (url_Command.equals("/PhotoWrite.do")) {
			action = new PhotoBoardWriteService();
			forward = action.execute(request, response);
		}else if (url_Command.equals("/PhotoWriteOk.do")) {
			action = new PhotoBoardWriteOkService();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/PhotoBoardDelete.do")) {
			action = new PhotoBoardDeleteService();
			forward = action.execute(request, response);
		}
		// My Course Board
		else if (url_Command.equals("/MyCourseBoardList.do")) {
			action = new MyCourseBoardListService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/MyCourseBoardDetail.do")) {
			action = new MyCourseBoardDetail();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/MyCourseBoardWrite.do")) {
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/board/mycourse/Write.jsp");
		}
		else if (url_Command.equals("/MyCourseBoardWriteOk.do")) {
			action = new MyCourseBoardWriteService();
			forward = action.execute(request, response);
		}
		// Notice Board
		else if (url_Command.equals("/NoticeBoardList.do")) {
			action = new NoticeBoardListService();
			forward =action.execute(request, response);
		}
		else if(url_Command.equals("/NoticeBoardDetail.do")){
			action = new NoticeBoardDetailService();
			forward =action.execute(request, response);
		}
		else if (url_Command.equals("/NoticeBoardWrite.do")) {
			action = new NoticeBoardWriteService();
			forward =action.execute(request, response);
		}
		else if(url_Command.equals("/NoticeBoardDelete.do")) {
			action =new NoticeBoardDeleteService();
			forward =action.execute(request, response);
		}
		
		else if(url_Command.equals("/NoticeBoardWriteOk.do")) {
			action =new NoticeBoardWriteOkService();
			forward =action.execute(request, response);
		}
		
		
		// QnA Board
		else if (url_Command.equals("/QnABoardList.do")) {
			action = new QnABoardListService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/QnABoardDetail.do")) {
			action = new QnABoardDetailService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/QnABoardWrite.do")) {
			action = new QnABoardWriteService();
			forward = action.execute(request, response);
		}else if (url_Command.equals("/QnABoardWriteOk.do")) {
			action = new QnABoardWriteOkService();
			forward = action.execute(request, response);
		}else if (url_Command.equals("/QnABoardDelete.do")) {
			action = new QnABoardDeleteService();
			forward = action.execute(request, response);
		}
		
		/* ADMIN */
		// AdminList 화면
		else if (url_Command.equals("/AdminList.do")) {
			action =new AdminListService();
			forward = action.execute(request, response);
		}
		else if (url_Command.equals("/AdminWrite.do")) {
			action =new AdminWriteService();
			forward = action.execute(request, response);
		}
		// MemberList 화면
		else if (url_Command.equals("/MemberList.do")) {
			action =new MemberListService();
			forward = action.execute(request, response);
		}
		// MemberDetail 화면
		else if (url_Command.equals("/MemberDetail.do")) {
			
		}
		// MemberEdit 화면
		else if (url_Command.equals("/MemberEdit.do")) {
		
			
		}
		// MemberEdit 진행
		else if (url_Command.equals("/MemberEditOk.do")) {
			
			
		}
		// MemberDelete 진헹
		else if (url_Command.equals("/MemberDelete.do")) {			
			action = new MemberDeleteService();
			forward = action.execute(request, response);		
		}
		
		//여행리스트 폴더 보여주기 화면 
		else if (url_Command.equals("/MTFolderList.do")) {			
			action = new MTLFolderListService();
			forward = action.execute(request, response);			
		}
		//여행리스트 폴더 추가하기
		else if (url_Command.equals("/MTFolderListAdd.do")) {			
			 action = new MTLFolderAddService();
			 forward = action.execute(request, response)	;	
		}
		//여행리스트 폴더 수정하기 
		else if (url_Command.equals("/MTFolderListEdit.do")) {			
			 action = new MTLFolderEditService();
			 forward = action.execute(request, response)	;	
		}
		//여행리스트 폴더 삭제하기
		else if (url_Command.equals("/MTFolderListDelete.do")) {
			action = new MTLFolderDeleteService();
			forward = action.execute(request,response);
		}
		//여행리스트 리스트 상세보기
		else if (url_Command.equals("/MTList.do")) {			
			action = new MTListContentSevice();
			forward = action.execute(request,response);
		}
		//여행리스트 리스트 추가하기 
		//여행리스트 리스트 삭제하기
		else if (url_Command.equals("/MTListDelete.do")) {			
			action = new MTListContentDeleteService();
			forward = action.execute(request,response);
		}
		////API 
		else if (url_Command.equals("/CourseAPI.do")) {			
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/api/CourseAPIDetail.jsp");
		}
		
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
