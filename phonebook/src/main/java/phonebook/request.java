package phonebook;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/request")
public class request extends HttpServlet{
	protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		String getrequest = request.getParameter("id");
		 
		if("1".equals(getrequest)) {
			
			request.setAttribute("key","3");
			RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
			rd.forward(request,response);
		}else if("2".equals(getrequest)) {
			
			request.setAttribute("key","3");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request,response);
		}if("3".equals(getrequest)) {
			
			request.setAttribute("key","3");
			RequestDispatcher rd = request.getRequestDispatcher("/forgotPassword.jsp");
			rd.forward(request,response);
		}
	}

}
