package phonebook;

import java.sql.Connection;

import java.sql.DriverManager;

public class DataBaseConnection {
	static Connection con;
	
	static void Database() {
		
		
		
		
		
		
		
		
		
		
		
	//	MySQL DB Name	            MySQL User Name	          MySQL Password   MySQL Host Name	
	//	if0_35889649_PhoneBook	    if0_35889649	   (Your vPanel Password) sql311.infinityfree.com	
		
		
		
	   String url = "jdbc:mysql://localhost:3306/phonebook";
		String username = "root";
		String password = "";
		//String url="jdbc:mysql://sql311.infinityfree.com:3306/if0_35889649_PhoneBook";
		//String username = "if0_35889649";
	   //String password = "r4770Jq8REwEVQ2";
	   try {
		   
	   Class.forName("com.mysql.cj.jdbc.Driver");
	   con = DriverManager.getConnection(url,username,password); 
	
	   
	   }catch(Exception  e) {
		   
		   e.printStackTrace();
	   }
	   
   }
}
