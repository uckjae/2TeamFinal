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
import kr.or.bit.service.LoginService;
import kr.or.bit.service.LogoutService;
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
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/board/free/Main.jsp");
		}
		else if (url_Command.equals("/FreeBoardDetail.do")) {
			
		}
		else if (url_Command.equals("/FreeBoardWrite.do")) {
			
		}
		// Photo Board
		else if (url_Command.equals("/PhotoBoardList.do")) {
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/board/photo/Main.jsp");
		}
		else if (url_Command.equals("/PhotoBoardDetail.do")) {
			
		}else if (url_Command.equals("/PhotoWrite.do")) {
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/board/photo/PWrite.jsp");
		}
		// My Course Board
		else if (url_Command.equals("/MyCourseBoardList.do")) {
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/board/mycourse/Main.jsp");
		}
		else if (url_Command.equals("/MyCourseBoardDetail.do")) {
			
		}
		// Notice Board
		else if (url_Command.equals("/NoticeBoardList.do")) {
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/board/notice/Main.jsp");
		}
		else if (url_Command.equals("/NoticeBoardDetail.do")) {
			
		}
		// QnA Board
		else if (url_Command.equals("/QnABoardList.do")) {
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/board/qna/Write.jsp");
		}
		else if (url_Command.equals("/QnABoardDetail.do")) {
			
		}
		else if (url_Command.equals("/QnABoardWrite.do")) {
			action = new QnABoardWriteService();
			forward = action.execute(request, response);
		}
		
		/* ADMIN */
		// MemberList 화면
		else if (url_Command.equals("/MemberList.do")) {
		
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
			
			
		}
		//여행리스트 폴더 보여주기 화면 
		else if (url_Command.equals("/MTList.do")) {			
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/mypage/MyTravelList.jsp");	
			
		}
		//여행리스트 폴더 추가하기
		else if (url_Command.equals("/MTList.do")) {			
			
			
		}
		//여행리스트 폴더 삭제하기
		//여행리스트 리스트 상세보기
		//여행리스트 리스트 추가하기 
		//여행리스트 리스트 삭제하기
		
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
