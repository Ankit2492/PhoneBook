<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="phonebook.DataBaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>


<Style>

 ul{
 border:solid;
  padding:15px;
  background-color:blue;
  margin-top:-10px;
  border-radius:10px;
  margin-bottom:-60px;
 }
 .a1{
 
 text-decoration:none;
 font-size:25px;
 margin-left:40px;
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
.p1{
width:513px;

margin-top:100px;
margin-left:30px;
font-size:40px;
font-weight:bold;
}
.ankit{
  
   margin:auto;
   width:920px;
   font-size:40px;
}
span{
font-weight:bold;

}
.border{
border:ridge;
margin:auto;
width:300px;
padding:30px;
margin-top:75px;
font-size:20px;
}
input{
height:20px;
width:250px;
font-size:17px;
}

.AAD{
padding-bottom:30px;
border-radius:10px;
background-color:red;
}
.AAD:hover{
background-color:lime;
 color:white;
}
.add{
border:solid;
margin:auto;
margin-left:555px;
margin-top:110px;
margin-bottom:-140px;
width:250px;
font-size:20px;
font-weight:bold;

}

.userAdmin{

font-size:25px;
font-weight:bold;
border-style:solid;
padding:5px;
width:80px;
margin-left:580px;
margin-bottom:-48px;
border-color:white;

border-radius:10px;
background-color:black;

}

</style>



</head>
<body style ="background-image:linear-gradient(blue,pink)">


<header>
 <ul>
 <%
     String name =(String)session.getAttribute("admin1"); 
 
 if("admin".equals(name)){
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
  <a href ="view details.jsp" class="a1">View Details</a>
 
 <div class= "m" class="a1">
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

<% 
	String adminPannelAccess=(String)session.getAttribute("adminAccesssuser");
 
  if("1".equals(adminPannelAccess)){
	  %>
	  <div class="userAdmin"><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></div>
	  <%
  }
  %>

</header>
<% 
  
	String url = "jdbc:mysql://localhost:3306/phonebook";
		String username = "root";
		String password = "";
		
		
		//String url="jdbc:mysql://sql311.infinityfree.com:3306/if0_35889649_PhoneBook";
		//String username = "if0_35889649";
	   //String password = "r4770Jq8REwEVQ2";
		
		
		
	try {
	   
	  Class.forName("com.mysql.cj.jdbc.Driver");
	  Connection con = DriverManager.getConnection(url,username,password); 
      String id=request.getParameter("id");
	  String selectQuery = "select * from userphonebook where userid=?";
      PreparedStatement ps= con.prepareStatement(selectQuery);
      ps.setString(1,id);
      ResultSet rs = ps.executeQuery();
      while(rs.next()){
    	  
    	  %>
    	  
    	  
    	  <form action="update" method = "post">
    	  <div class = "border" style="background-color:white;">
    	  <table>

    	  <caption Style="font-size:35px;font-weight:bold;margin-top:-35px;margin-bottom:20px;">Update Details</caption>
    	   	<tr>
    	   		<td>
    	  			<label for = name>Name</label>
    	  			
    	  			<input type = "text" name = "name" id = "name" placeholder = "enter your name" value = "<%=rs.getString("name") %>" required>
    	  		   <p></p>
    	  		</td>
    	  	</tr>
    	  	<tr>
    	  		<td>
    	  			<label for = "email">Email</label>
    	  			<input type = "email" name = "email" id = "email" placeholder = "enter user email" value = "<%=rs.getString("email") %>" >
    	  		<p></p>
    	  		</td>
    	  	</tr>
    	  	<tr>
    	  		<td>
    	  			<label for = "m">Mobile No.</label>
    	  			<input type = "tel" name = "mobil_no" id = "m" placeholder = "enter your mobile no." value = "<%=rs.getString("mobileno") %>" >
    	  		<p></p>
    	  		</td>
    	  	</tr>
    	  	<tr>
    	  		<td>
    	  			<label for = "AD">Address</label>
    	  			<input type = "text" name = "address" id = "AD" placeholder = "enter your Address" value = "<%=rs.getString("address") %>" >
    	  		<p></p>
    	  		</td>
    	  	</tr>
    	  	<tr>
    	  		<td>
    	  			<label for = "D">Description</label><br>
    	  			<textarea style="font-size:17px;" name = "description" id = "D" placeholder = "enter your description maximum 200 letter" rows="3" cols = "28"><%=rs.getString("description")%></textarea>
    	  		<p></p>
    	  		</td>
    	  	</tr>
    	  	    	<input type="hidden" name ="update" value="<%=id%>">
    	  	
    	  	<tr>
    	       </tr>
    	       <tr>
    	      	 <td>
    	       		<input style="font-size:20px;"type = "submit" value = "update Details" class = "AAD">
    	       	</td>
    	       </tr>
    	  </table>
    	  </div>
    	  </form>
 	  
    	  <%    	  
      }
      
	}catch(Exception e){
    	  
      }
  
   %>
</body>
</html>