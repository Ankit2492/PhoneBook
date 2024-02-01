package phonebook;

import java.io.IOException;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class registerPhone extends HttpServlet{
	
	protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");		
		
		DataBaseConnection.Database();
		try {
		
	   String insertQuery = "insert into pregister(name ,email,password)values(?,?,?)";
	   PreparedStatement ps =  DataBaseConnection.con.prepareStatement(insertQuery);
	   ps.setString(1, name);
	   ps.setString(2,email);
	   ps.setString(3, password);	;
	   ps.executeUpdate();
	   
       request.setAttribute("key","1");
	   RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
	   rd.forward(request,response);
		
		}catch(Exception e) {
	
			request.setAttribute("key","2");			
			RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
			rd.include(request,response);

		}
	   
	}
	
}
