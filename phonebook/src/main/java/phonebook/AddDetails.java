package phonebook;

import java.io.IOException;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/insertvalue")
public class AddDetails extends HttpServlet {
	protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		
	String name  =request.getParameter("name");
	String mobileno = request.getParameter("mobil_no");
	String address= request.getParameter("address");
	String email=request.getParameter("email");
	String description = request.getParameter("description");
	String insertQuery= "insert into userphonebook(name,mobileno,address,email,description,loginUser)values(?,?,?,?,?,?)";
	String loginUser= request.getParameter("loginUser");
	try {
	PreparedStatement ps = DataBaseConnection.con.prepareStatement(insertQuery);
	ps.setString(1,name);
	ps.setString(2,mobileno);
	ps.setString(3,address);
	ps.setString(4,email);
	ps.setString(5,description);
	ps.setString(6,loginUser);
	ps.executeUpdate();
	
	request.setAttribute("key","1");
	RequestDispatcher rd = request.getRequestDispatcher("/Add Phone No .jsp");
	rd.forward(request, response);
	
	}catch(Exception e) {
		
		request.setAttribute("key","2");
		RequestDispatcher rd = request.getRequestDispatcher("/Add Phone No .jsp");
		rd.forward(request, response);
		
	}
	
	}

}