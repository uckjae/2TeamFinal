package kr.or.bit.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class MTListContentAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("처음1");
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();
		System.out.println("처음2");
		int tLidx = Integer.parseInt(request.getParameter("tlidx"));
		String spotName= request.getParameter("spotName");
		System.out.println("처음4");
		String image = request.getParameter("mTLimage");
		System.out.println("처음5");
	//	Date spotDate = null;
		System.out.println("처음3");
		System.out.println("tLidx : " + tLidx);
		System.out.println("spotName : " + spotName);
		System.out.println("image : " + image);
		/* String 날짜;
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			String 변환된날짜 = fm.parse(날짜);
		 *
		 */
		String spotDate = request.getParameter("spotDate");	
		String spotAddr = request.getParameter("spotAddr");
		String spotLink = request.getParameter("spotLink");
		System.out.println("tLidx : " + tLidx);
		System.out.println("spotName : " + spotName);
		System.out.println("image : " + image);
		System.out.println("spotDate : " + spotDate);
		System.out.println("spotAddr : " + spotAddr );
		System.out.println("spotLink : " + spotLink);
		int resultRow = boardDao.mTListContentAdd(tLidx,spotName,image,spotDate,spotAddr,spotLink);
		System.out.println("resultRow : " + resultRow);
		forward.setPath("MTFolderList.do");
		return forward;
	}

}
