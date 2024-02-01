<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="phonebook.DataBaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>

<style>

ul{

  border:solid white;
  padding:15px;
  background-color:blue;
  margin-top:-10px;
  border-radius:10px;
  margin-bottom:-60px;
 
 }

 .a1{
 
 text-decoration:none;
 font-size:25px;
 margin-left:20px;
 color:white;
 font-weight:bold;
 
 }
div{

margin-left:800px;
margin-top:-30px;

}
.m1{
text-align:center;
border:solid;
background-color:lime;
border-radius:8px;
padding:5px;
width:370px;
margin-top:-40px;
margin-left:-50px;

}
.m2{

border:solid;
background-color:red;
border-radius:8px;
padding:5px;
width:80px;;
margin-top:-70px;
margin-left:1170px;

}


.de{

margin-top:25px;
font-size:23px;
font-weight:bold;
background-color:greenyellow;
padding:15px;

}

form{
margin-left:450px;
margin-top:-30px;
}
.search{
border-radius:15px;
height:40px;
width:200px;
padding-left:10px;
font-size:20px;


}
.button{
width:100px;

}
.notmatch{
width:400px;
color:white;

margin:auto;
margin-top:90px;
margin-bottom:-90px;
font-size:30px;
font-weight:bold;

}
.notfoundm{

margin-left:400px;
}

.userAdmin{

font-size:25px;
font-weight:bold;
border-style:solid;
padding:5px;
width:80px;
margin-left:330px;
border-color:white;
margin-top:-40px;
border-radius:10px;
background-color:black;

}
.borderdiv{
background-color:white;
padding-top:5px;
border:solid;
height:400px;
margin-top:80px;
width:370px;
margin:20px;
font-size:17px;
font-weight:bold;

}


.div{

margin-left:125px;
margin-top:-20px;
word-wrap:break-word;
}

lable{
font-size:20px;
font-weight:bold;
padding:10px;
}

.Edbutton{

margin-top:30px;


}

.edit{
border:solid black;
margin-right:10px;
text-decoration:none;
font-size:20px;
color:white;
background-color:lime;
padding:5px;
border-radius:10px;

}
.delete{
border:solid black;
margin-right:10px;
text-decoration:none;
font-size:20px;
color:white;
background-color:red;
padding:5px;
border-radius:10px;

}
</style>

</head>
<body style ="background-image:linear-gradient(pink,blue)">

<header>

 <ul>
 <%
 
     String name1 =(String)session.getAttribute("admin1"); 
     String adminEmail=(String)request.getAttribute("admin2");
	 String adminPassword=(String)request.getAttribute("admin3");
     
 if("hiarring20@gmail.com".equals(adminEmail) && "ankit $ ashok".equals(adminPassword)) {
	 //name1 =(String)session.getAttribute("admin1"); 
	 RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
	rd.forward(request,response);
 }
 
 
 if("admin".equals(name1)){
	 %>
	  <a href ="admin.jsp" class="a1">Home</a>
	 
	   <%
 }else{
 %>
 <a href ="home.jsp" class="a1">Home</a>
 <%
 } 
 %>
 <a href ="Add Phone No .jsp" class="a1">Add-New-Details</a>
  <div class= "m" class="a1 name">
     <p class= "m1 a1"><%=session.getAttribute("name")%></p>
 </div>
 <div class= "m2 a1">
 
 
 <%
   
   String useradminlogoutbutton=(String)session.getAttribute("useraccess1");
  
   if("access".equals(useradminlogoutbutton)){
	   %>   
	   <a href ="admin.jsp" style="text-decoration:none;color:white;">Logout</a>
	   <%
   }else{
	   
	   %>
	   <a href ="logout" style="text-decoration:none;color:white;">Logout</a>
<%
   }
   %>
 
 </div>
</ul>

<form action ="view details.jsp" method="get">
  <input type="hidden" name ="block" value="1">
 <input type="search" name ="search" placeholder="search name" class="search" required>
 <input type="submit" value="search" class="search button"> 
 </form>
</header>
<% 
	String adminPannelAccess=(String)session.getAttribute("adminAccesssuser");
 
  if("1".equals(adminPannelAccess)){
	  %>
	  <div class="userAdmin"><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></div>
	  <%
  }
  %>
<% 
   String de = (String)request.getAttribute("key"); 
		if("1".equals(de)){
			out.print("<p class ='de'>Updation Successfull.....</p>");
		}else if("2".equals(de)){
			out.print("<p class ='de'>Updation Fields.....</p>");
		}
  String delete = (String)request.getAttribute("Du");
  if("1".equals(delete)){
		out.print("<p class ='de'>Delete Successfull.....</p>");
	}else if("2".equals(delete)){
		out.print("<p class ='de'>Deletion Fields.....</p>");
	}

%>
<%	
       int a=0;
       String email = (String)session.getAttribute("email1");
       String name = request.getParameter("search");
       String block = request.getParameter("block"); 
       Boolean b=true;
       
       String url = "jdbc:mysql://localhost:3306/phonebook";
	  String username = "root";
	   String password = "";
	  
	  
	 // String url="jdbc:mysql://sql311.infinityfree.com:3306/if0_35889649_PhoneBook";
	//	String username = "if0_35889649";
	   //String password = "r4770Jq8REwEVQ2";
	  
	  
	  
	   String selectQuery;
	   if("1".equals(block)){
		   
	    	selectQuery="select * from userphonebook where loginuser=? and name = ?";

	   }else{
            selectQuery = "select * from userphonebook where loginUser = ? ";
	   }
	   try {
		   
	    Class.forName("com.mysql.cj.jdbc.Driver");	    
	     Connection con = DriverManager.getConnection(url,username,password); 	
	     PreparedStatement ps = con.prepareStatement(selectQuery);
	    
	     if("1".equals(block)) {
	    	 ps.setString(2,name);
	     }
	      ps.setString(1,email);
	      ResultSet rs = ps.executeQuery();
	     %><div style="display :flex;margin:30px;flex-wrap:wrap;width:1250px;"><%
	    		  while(rs.next()){
	    	  
	    	  %>	    	
	    	<div class="borderdiv">
	    	   
	    	      		<lable>Name -</lable>
	    	      			<div class="div"><%=rs.getString("name")%></div><br>
	    	      			
	    	      		<lable>Email -</lable>
	    	      			<div class="div"><%=rs.getString("email")%></div><br>
	    	      		
	    	      		
	    	      		<lable>Mobile No. -</lable>
	    	      			<div class="div"><%=rs.getString("mobileno")%></div><br>	
	    	      			
	    	      		
	    	      		<lable>Address -</lable>
	    	      			<div class="div"><%=rs.getString("address")%></div><br>
	    	      		
	    	      		<lable>Description -</lable>
	    	      			<div class="div"><%=rs.getString("description")%></div>
	    	      				    	      		
	    	      	<div class="div Edbutton"> 
	    	      	
	    	     		<a href = "update.jsp?id=<%=rs.getString("userid") %>" class="edit">Edit</a>
   						<a href = "delete?id=<%=rs.getString("userid") %>" class="delete">Delete</a>
   					
	    	  		</div>
	    	  		
	    	 
	    	  </div>
	    	  <%  
	    	  b=false;
	    	       a++;
	    	       if(a==4){
	    	       %><br><br><%
	    	       a=0;
	    	       }     
	      }
	  %></div><%
	   }catch(Exception  e) {
		   
		   out.print("Exception Occure "+e);
	   }
	   if(b){
		   %>
		   <p class="notmatch">SORRY ! DATA NOT FOUND</p>
		   <img src = "image/notfound.png" class="notfoundm">
		  
		  <%
	    }
   %>

</body>
</html>