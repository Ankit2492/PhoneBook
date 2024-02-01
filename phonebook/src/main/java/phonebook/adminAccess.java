package phonebook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/adminAccess")
public class adminAccess extends HttpServlet{
	protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		
		String admin= request.getParameter("admin");
		String email= request.getParameter("email");
		//String password= request.getParameter("password");
		String updateQuery = "update pregister set admin=? where email=?";
		try {   
		PreparedStatement ps =  DataBaseConnection.con.prepareStatement(updateQuery);
		ps.setString(1,admin);
		ps.setString(2,email);
		//ps.setString(3,password);
		ps.executeUpdate();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.print("<p style='background-color:lime'>Success full work</p> ");
		RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
		rd.forward(request, response);
		
		}catch(Exception e) {
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.print("<p style='background-color:red'>Exception Occure</p> "+e);
			RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
			rd.include(request, response);
			
		}
		
	
	}

}
