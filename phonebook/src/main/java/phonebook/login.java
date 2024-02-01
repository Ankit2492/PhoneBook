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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet{
	 static int a;
	protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException{
		
		String email =    request.getParameter("email");
		String password = request.getParameter("password");		
		////////////////////////////////////////////////////////
		
		String userAccess = request.getParameter("useradmin");
		
		
		/////////////////////////////////////////////////
		
		if("hiarring20@gmail.com".equals(email) && "ankit $ ashok".equals(password)) {
			
			a=2;
	    }
	
		
		try {
			
		DataBaseConnection.Database();
		String selectQuery = "select * from pregister where email=? and password=?";
		PreparedStatement ps = DataBaseConnection.con.prepareStatement(selectQuery);
		ps.setString(1,email);
	    ps.setString(2,password);
	    ResultSet rs = ps.executeQuery();
	    if(rs.next()) {
	    	
	    	String adminuserAccess=rs.getString("admin");
	    	String username = rs.getString("name");
	    	String loginEmail = rs.getString("email");	    
	    	HttpSession session = request.getSession();
	        session.setAttribute("email1",loginEmail);
	    	session.setAttribute("name",username);
	    	/////
	    	session.setAttribute("useraccess1",userAccess);
	    	//////
	    	///////////////////////////////////////
	    	
	    	session.setAttribute("adminAccesssuser",adminuserAccess);
	    	
	    	////////////////////////////
	    	
	    	if(a>=1) {
	    	///////	////////////////////////////
	    		
	    		request.setAttribute("admin2",email);
		    	request.setAttribute("admin3",password);
		    	
		   //////// 	///////////////////////////////////////////////////
	    		session.setAttribute("admin1","admin");
	    		RequestDispatcher rd = request.getRequestDispatcher("/view details.jsp");
			    rd.forward(request,response);
	    		
	    	}else {
	    		
	    		RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
	    		rd.forward(request,response);
	    	}
	    	
	    }
	    else {
	    request.setAttribute("key","f");
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	    rd.include(request,response);
	    
		}
	    
		}catch(Exception e) {
		    request.setAttribute("key","fh");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		    rd.forward(request,response);
		}
	}
}
