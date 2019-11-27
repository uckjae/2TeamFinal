package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

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
		String cmd = request.getParameter("cmd");
		BoardDao dao = new BoardDao();
		
		//추가
		if(cmd.equals("add")) {
			int bIdx = Integer.parseInt(request.getParameter("bIdx"));
			String replyContent = request.getParameter("replyContent").trim();
			String memberId = (String) request.getSession().getAttribute("memberId");

			int rIdx = dao.insertReply(bIdx, memberId, replyContent);

			Reply reply = new Reply();
			String resultString = "{";
			if (rIdx > 0) {
				reply = dao.getReply(rIdx);
				resultString += "id : " + reply.getId();
				resultString += ", rContent : " + reply.getrContent();
				String date = new SimpleDateFormat("yyyy-MM-dd   HH:mm:ss").format(reply.getrWDate());
				resultString += ", rWDate : " + "\"" + date + "\"";
			}

			resultString += "}";
			JSONObject json = null;
			try {
				json = new JSONObject(resultString);
			} catch (JSONException e) {
				e.printStackTrace();
			}

			out.print(json);
		}
		//삭제
		else if(cmd.equals("del")){
			int rIdx = Integer.parseInt(request.getParameter("rIdx"));
			boolean result=dao.deleteReplyByRIdx(rIdx);
			
			out.print(result);
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
