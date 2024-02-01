<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="phonebook.DataBaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

td{
border:solid;
border-color:white;
text-align:center;
padding:10px;
height:30px;
}
.input{
height:30px;
width:400px;
font-size:20px;
background-color:white;
}
th{
border:solid;
font-size:25px;
color:white;
font-weight:bold;
padding:3px;
background-color:black;'

}
table{
margin-top:100px;
margin-left:-5px;
width:950px;

}
.number{
width:15px;
background-color:white;
border-radius:10px;

}
ul{
border:solid;
list-style:none;
border-radius:15px;
height:65px;
margin-top:-5px;
background-color:black;
margin-bottom:-70px;
}

.adminLogout{

margin-left:1050px;
font-size:28px;
text-decoration:none;
padding:5px;
border-radius:10px;
background-color:red;
color:white;
font-weight:bold;
}
.adminLogout:hover{
background-color:lime;
color:black;
}
.listout{
margin-top:15px;
}
.hover{
background-color:red;
width:200px;
border-radius:10px;
}
.hover:hover{

background-color:black;
color:white;
}
.admin{

font-size:32px;
font-weight:bold;
color:white;
margin:auto;
width:950px;
margin-top:-70px;

}

 .noButton{
 width:100px;
 height:30px;
 font-size:18px;
 font-weight:bold;
 border-radius:10px;
 background-color:red;
 }
 .noButton:hover{
 color:black;
 background-color:lime;
 }
 .yesButton:hover{
 
 color:white;
 backgroung-color:pink;
 }
 .loginuserhome{
 border:solid;
 background-color:blue;
 font-size:28px;
 font-weight:bold;
 padding:5px;
 text-decoration:none;
 color:white;
 border-radius:10px;
 margin-left:40px;
 
 
 
 }
 
 .formsearch{
 
 margin:auto;
 margin-top:40px;
 width:620px;
 margin-bottom:-75px;
 
 }

.search{

height:40px;
width:500px;
padding-left:15px;
border-radius:20px;
font-size:20px;

}
.searchButton{
border:solid;
width:100px;
}
</style>
</head>
<body style ="background-image:linear-gradient(fuchsia,blueviolet)">

<header>
  <ul>
    
   <li class="listout"><a href="logout?id=out" style="border:solid;" class ="adminLogout">Logout</a></li>
   <li class=" admin"><p>Welcome Hi Admin !, Thank You very Much for Creatin us</p></li>
   </ul>
   <p><a href="home.jsp" class="loginuserhome">Home</a></p> 
   
</header>

<%	  

////@@@@@ admin search bar getPrameterString search=request.getParameter("search");
String search=request.getParameter("search");
										//end searchbar getparmeter
String url = "jdbc:mysql://localhost:3306/phonebook";
String username = "root";
String password = "";

//String url="jdbc:mysql://sql311.infinityfree.com:3306/if0_35889649_PhoneBook";
//String username = "if0_35889649";
//String password = "r4770Jq8REwEVQ2";


String selectQuery;

/////@@@ admin search then 0 or 1 ya other value condition Apply if condition display admin search bar


if("0".equals(search) || "1".equals(search)){
	selectQuery="select * from pregister where admin = ?";
	
}else{

	selectQuery ="select * from pregister";
}
	//@@ condition else part not search value ya other search value

try {
	
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con = DriverManager.getConnection(url,username,password);
PreparedStatement ps = con.prepareStatement(selectQuery);
   
//@@@ admin search then condition apply if /search not then condition not apply

if("0".equals(search) || "1".equals(search)){
	ps.setString(1,search);
}

   ResultSet rs = ps.executeQuery();
   int a=1;
   %>
   
   <!-- user display admin pannel agar access thenge tab other user view details -->
   
   <table style="border-collapse:collapse">
    <tr>
    <th>No.</th>
    <th>Name</th>
    <th>User-Email-Address</th>
    <th></th>  
    
    <%
    //@@@ main admin open admin pannel the dispaly only search bar main admin conditon true if block ///////@@@@@
    
	String adminmalik=(String)session.getAttribute("admin1");    
    
    if("admin".equals(adminmalik)){
    	%>
    	<div  class="formsearch">
    	<form action="admin.jsp">    	
    	<input type ="search" name="search"required class="search" placeholder="search /0(noAdmin)/1(admin)/other search all display">
    	<input type ="submit" value ="search" class="search searchButton">
    	</form> 
    	</div>
    	
    	<%
    }else{
    	%>
    	<!--@@@@@ user run table heading only user not run table haddin main admin -->
    	<th></th> 
    	<% 
    	
    } 
    %>       		     
      
    <th class="button">Action</th>
    
    <%
    ////@@@@@ admin open then if condition apply ya true if block display admin- 
    //// -controle column
	   
    if("admin".equals(adminmalik)){
    	%>
    	<th></th>
        <th></th>
        <th></th>
        <th>Admin</th>
        </tr>
        <%
    	
    }else{
    	%>
    	</tr>
    	<%
    	}
    
  while(rs.next()){
	  ///@@@ data type admin ke liye liya gaya hai ki amin color black ho jaye
	  
	  boolean b=true;
	  String email=rs.getString("email");
	  String adminMalik = (String)session.getAttribute("admin1");
	  
	  if("admin".equals(adminMalik) && "hiarring20@gmail.com".equals(email)){
	    
		  %>
		  
		   <tr>
        <form action ="login" method="post">	
		  
		  <td style="font-size:20px;font-weight:bold;color:white;background-color:black;"><%=a++ %></td>
		    <td><input type ="text" name="name" value = "<%=rs.getString("name")%>" class="input" readonly style="text-align:center;background-color:black;color:white;"></td>
			<td><input type ="text" name="email" value = "<%=rs.getString("email")%>" class="input" readonly style="text-align:center;background-color:black;color:white;"></td>
			<td><input type="hidden" name="password" value =  "<%=rs.getString("password")%>" readonly></td>
		    <td><input type= "submit" value="view user Details" class="button hover input"style="background-color:black;color:white;"></td>	
		  
		  <%
		  b=false;
		  
	  }else if("hiarring20@gmail.com".equals(email)){
		  
		  continue;
		  
	  }else{
	  
	  
	  }
	  %>	 
	 
        <%if(b){
        	
        %>
         <tr>
        <form action ="login" method="post">	
        
        	 <td style="font-size:20px;font-weight:bold;color:white"><%=a++ %></td>
   		    <td><input type ="text" name="name" value = "<%=rs.getString("name")%>" class="input" readonly style="text-align:center"></td>
   			<td><input type ="text" name="email" value = "<%=rs.getString("email")%>" class="input" readonly style="text-align:center"></td>
   			   			
   			<%
   			if("admin".equals(adminMalik)){
   				
   			}else{
   				%>
   				  <td><input type= "hidden" name = "useradmin" = value="access"></td>
   				
   				<%
   			} 
   			%>
   			   			
   			<td><input type="hidden" name="password" value =  "<%=rs.getString("password")%>" readonly></td>
   		    <td><input type= "submit" value="view user Details" class="button hover input"></td>	
        
        <%  
        
        }
        %>
	      		   	      		        					
	   </form>
	   	       		
		<%
		String admin=rs.getString("admin");
	if("admin".equals(adminmalik)){
		%>
		<form action ="adminAccess" method ="post">
		<%
		 if("1".equals(admin)){
			 %>
			 <td><input type ="hidden" name="email" value = "<%=rs.getString("email")%>" class="input" readonly style="text-align:center"></td>
		     <td><input type="hidden" name="password" value =  "<%=rs.getString("password")%>" readonly></td>
			 <td><input type ="hidden" name="admin" value = "0" class="input" readonly style="text-align:center"></td>	   	    
			  <td><input type="submit"value = "YES" class="noButton yesButton" style="background-color:lime;}"> </td>
		 <%
		}else if("0".equals(admin)){
			 %>
		    <td><input type ="hidden" name="email" value = "<%=rs.getString("email")%>" class="input" readonly style="text-align:center"></td>
		   <td><input type="hidden" name="password" value =  "<%=rs.getString("password")%>" readonly></td>
	       <td><input type ="hidden" name="admin" value = "1" class="input" readonly style="text-align:center"></td>	   	    
	       <td><input type="submit"value = "NO" class="noButton"> </td>
	    <%
		}
	%>
		  </form>
<%
  }
 %>	   
	   	
 </tr>
	<%
  }
   %>
   </table>
   <%
}catch(Exception e) {

	request.setAttribute("key","2");			
	RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
	rd.include(request,response);
}

%>
</body>
</html>