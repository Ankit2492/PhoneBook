package phonebook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class update extends HttpServlet{
	
	protected void doPost(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException {
		String name  =request.getParameter("name");
		String mobileno = request.getParameter("mobil_no");
		String address= request.getParameter("address");
		String email=request.getParameter("email");
		String description = request.getParameter("description");
		String id= request.getParameter("update");
		String updateQuery= "update userphonebook set name=?,mobileno=?,address=?,email=?,description=? where userid=?";

		PrintWriter out = response.getWriter();
		
		
		try {
			
		PreparedStatement ps = DataBaseConnection.con.prepareStatement(updateQuery);
		ps.setString(1,name);
		ps.setString(2,mobileno);
		ps.setString(3,address);
		ps.setString(4,email);
		ps.setString(5,description);
		ps.setString(6,id);
		ps.executeUpdate();
		
		request.setAttribute("key","1");
		RequestDispatcher rd = request.getRequestDispatcher("/view details.jsp");
		rd.forward(request, response);
		
		}catch(Exception e) {
			response.setContentType("text/html");
			request.setAttribute("key","2");
			out.print("exception Occure "+e);
			RequestDispatcher rd = request.getRequestDispatcher("/view details.jsp");
			rd.include(request, response);
			
		}
		
		}


	}
