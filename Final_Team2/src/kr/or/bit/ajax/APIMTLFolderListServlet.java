package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.MTList;

/**
 * Servlet implementation class APIMTLFolderListServlet
 */
@WebServlet("/APIMTLFolderList")
public class APIMTLFolderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public APIMTLFolderListServlet() {
        super();
        
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		BoardDao boardDao = new BoardDao();
		List<MTList> mTFolderList = boardDao.mTLFolderList(id);
		System.out.println("r u here?");
		System.out.println(mTFolderList);
		
		StringBuilder json = new StringBuilder();
		if(mTFolderList.size()>1) {
			json.append("[");
			for(int i=0; i<mTFolderList.size(); i++) {
				json.append("{\"name\":");
				json.append("\"" + mTFolderList.get(i).gettLName()+"\",");
				json.append("\"tlidx\":");
				json.append("\"" + mTFolderList.get(i).gettLidx()+"\"");
				json.append("},");
			}
			json.replace(json.length()-1, json.length(), "");
			json.append("]");
		}
		else {
			json.append("{\"name\":");
			json.append("\""+mTFolderList.get(0).gettLName()+"\",");
			json.append("\"tlidx\":");
			json.append("\"" + mTFolderList.get(0).gettLidx()+"\"");
			json.append("}");
		}
		System.out.println(json);
		out.print(json);
		
		
;	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

}
