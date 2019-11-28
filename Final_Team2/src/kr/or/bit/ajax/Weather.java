package kr.or.bit.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    	
        String addr ="http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib";
        String serviceKey = "?ServiceKey=" + "4Axvk6PyZ%2FHTR624%2B55Lt3tzBtDrMNWjR3vFCoC6bw8JgQgncE5vRstv58%2BxvNwYhj4Qh0jnrH9W2o1TwhKN0Q%3D%3D";
        
        
    	response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
