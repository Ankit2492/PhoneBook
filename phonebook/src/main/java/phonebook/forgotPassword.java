package phonebook;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotPassword1")
public class forgotPassword extends HttpServlet{
	protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String selectQuery = "select * from pregister where email=?";
try {
		DataBaseConnection.Database();
		PreparedStatement ps= DataBaseConnection.con.prepareStatement(selectQuery);
		ps.setString(1,email);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			
			String updateQuery ="update pregister set password=? where email = ?";
			PreparedStatement ps1= DataBaseConnection.con.prepareStatement(updateQuery);
			ps1.setString(1,password);
			ps1.setString(2,email);
		    ps1.executeUpdate();
		    request.setAttribute("key","1");
			RequestDispatcher rd = request.getRequestDispatcher("/forgotPassword.jsp");
			rd.forward(request, response);
			
		}else {
			
			request.setAttribute("key","2");
			RequestDispatcher rd = request.getRequestDispatcher("/forgotPassword.jsp");
			rd.forward(request, response);
		}
	
	}catch(Exception e) {
		
		request.setAttribute("key","4");
		RequestDispatcher rd = request.getRequestDispatcher("/forgotPassword.jsp");
		rd.forward(request, response);
	}
	}
}
