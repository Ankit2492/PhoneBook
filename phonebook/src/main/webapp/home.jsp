<%@page import="java.sql.PreparedStatement"%>
<%@page import="phonebook.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>


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
border:solid;
text-align:center;
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

.userAdmin{

font-size:25px;
font-weight:bold;
border-style:solid;
padding:5px;
width:80px;
margin-left:560px;
border-radius:10px;
background-color:black;

}

.phone{

margin-left:200px;
width:600px;
margin:auto;
margin-top:-20px;
}
</style>

</head>
<body style="background:linear-gradient(#f60d3c , #3f23a6);color:white">

<header>
 <ul>
 <!-- <a href ="home.jsp" class="a1">Home</a>-->
 
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
<p class="p1">Welcome PhoneBook System !</p>
<p class="ankit">Hello <span><%=session.getAttribute("name")%></span>, Welcome to our web Application PhoneBook</p>
<div class="phone">
<img src="picimage/pic/4748242-removebg-preview.png">
</div>
</body>
</html>