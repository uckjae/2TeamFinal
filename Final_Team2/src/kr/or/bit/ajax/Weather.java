package kr.or.bit.ajax;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.io.CachedOutputStream;
import org.apache.tomcat.util.http.fileupload.IOUtils;

/**
 * Servlet implementation class Weather
 */
@WebServlet("/Weather.ajax")
public class Weather extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Weather() {
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
    	String weatherUrl = request.getParameter("weatherUrl");
    	System.out.println("Weather.java "+weatherUrl);
    	
    	URL url = new URL(weatherUrl);
    	
    	InputStream in = url.openStream();
    	CachedOutputStream bos = new CachedOutputStream();
    	IOUtils.copy(in, bos);
    	in.close();
    	bos.close();
    	
    	String data = bos.getOut().toString();
    	System.out.println("Weather.java data" + data);
    	
    	
    	response.getWriter().print(data);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
