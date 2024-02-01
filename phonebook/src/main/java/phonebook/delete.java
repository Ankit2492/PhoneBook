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
@WebServlet("/delete")
public class delete extends HttpServlet{
	protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		//int a =Integer.parseInt(id);
		PrintWriter out = response.getWriter();
		String deleteQuery = "delete from userphonebook where userid = ?";
		try {
		PreparedStatement ps = DataBaseConnection.con.prepareStatement(deleteQuery);
		ps.setString(1,id);
		ps.executeUpdate();
		request.setAttribute("Du","1");
		RequestDispatcher rd = request.getRequestDispatcher("/view details.jsp");
		rd.include(request, response);
		
		}catch(Exception e) {
			
			request.setAttribute("Du","2");
			response.setContentType("text/html");
			out.print("Exception Occur: "+id);
			RequestDispatcher rd = request.getRequestDispatcher("/view details.jsp");
			rd.include(request, response);
			
		}
	}

}
