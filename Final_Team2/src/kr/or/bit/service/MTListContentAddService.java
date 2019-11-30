package kr.or.bit.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class MTListContentAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();
		
		/*
		 * Enumeration<String> e = request.getParameterNames();
		 * while(e.hasMoreElements()) { System.out.println("enumeration done!!!");
		 * System.out.println(e.nextElement()); }
		 */

		int tLidx = Integer.parseInt(request.getParameter("tlidx"));
		String spotName= request.getParameter("spotName");
		String image = request.getParameter("mTLimage");
	//	Date spotDate = null;
		/* String 날짜;
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			String 변환된날짜 = fm.parse(날짜);
		 *
		 */
		String spotDate = request.getParameter("spotDate");	
		String spotAddr = request.getParameter("spotAddr");
		String spotLink = request.getParameter("spotLink");
		int resultRow = boardDao.mTListContentAdd(tLidx,spotName,image,spotDate,spotAddr,spotLink);
		
		String msg = "";
		System.out.println(resultRow);
		if(resultRow > 0) {
			msg = "나의 여행리스트에 추가되었습니다.";
		} else {
			msg = "나의 여행리스트에 추가에 실패하였습니다.";
		}
		request.setAttribute("board_msg",msg );
		request.setAttribute("board_url", "MTFolderList.do");
		request.setAttribute("board_result", (resultRow > 0));
		forward.setPath("/common/Redirect.jsp");
		return forward;
	}

}
