package phonebook;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/logout")
public class logout extends HttpServlet{
	
	protected void doGet(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name=(String)session.getAttribute("admin1");
		String logoutAdmin=request.getParameter("id");
		if("out".equals(logoutAdmin)) {
			login.a=0;
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.include(request, response);
		}
		else if("admin".equals(name)) {
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
			rd.forward(request, response);
			
		}
		else {
			
		session.invalidate();
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		rd.include(request, response);
		
		}
		
	}

}
