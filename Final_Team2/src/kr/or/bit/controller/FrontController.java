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
		
		}
		//  진행
		else if (url_Command.equals("/RegisterOk.do")) {
			
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
