package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.BoardDao;

/**
 * Servlet implementation class LikeNum
 */
@WebServlet("/LikeNum")
public class LikeNum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LikeNum() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=UTF-8");
    	System.out.println("여긴오나"+request.getParameter("mCIdx"));
    	int mCIdx = Integer.parseInt(request.getParameter("mCIdx"));
    	System.out.println("LikeNum : "+mCIdx);
    	String id = (String)request.getSession().getAttribute("memberId");
    	PrintWriter out = response.getWriter();
    	BoardDao dao = new BoardDao();
    	int result = dao.getCourseLikeNum(mCIdx, id);
    	out.print(result);
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
