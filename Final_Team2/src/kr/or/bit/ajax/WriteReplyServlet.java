package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Reply;

/**
 * Servlet implementation class GetDeptNosServlet
 */
@WebServlet("/WriteReply")
public class WriteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WriteReplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();

		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		String content = request.getParameter("content");
		String memberId = (String) request.getSession().getAttribute("memberId");

		BoardDao dao = new BoardDao();
		int rIdx = dao.insertReply(bIdx, memberId, content);

		Reply reply = new Reply();
		if (rIdx > 0)
			reply = dao.getReply(rIdx);
		
		out.print(reply);
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
