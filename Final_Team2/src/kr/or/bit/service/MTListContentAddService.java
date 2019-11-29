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
		ActionForward forward = new ActionForward();
		BoardDao boardDao = new BoardDao();
		int tLidx = Integer.parseInt(request.getParameter("tlidx"));
		String spotName= request.getParameter("spotName");
		String image = request.getParameter("mTLimage");
		Date spotDate = null;
		System.out.println("tLidx : " + tLidx);
		System.out.println("spotName : " + spotName);
		System.out.println("image : " + image);
		try {
			spotDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("spotDate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
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
		forward.setPath("/WEB-INF/views/api/FestivalDetail.jsp");
		return forward;
	}

}
