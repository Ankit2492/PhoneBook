<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>

<style>
   table{
   	margin:auto;
   	width:400px;
   }
   form{
   margin-top:150px;
  
   }
 .input1{
 height:20px;
 padding:10px;
 padding-right:40px;
 padding-left:15px;
 border-radius:30px;
 font-size:15px;
 width:220px;
 }
 label{
 font-size:20px;
 font-weight: bold;
 }
 .submit_button{
 height:30px;
 border-radius:30px;
 width:220px;
 padding-bottom:35px;
 padding-left:23px;
 margin-top:10px;
 font-size:20px;
 margin-left:112px;
 background-color:lime;
 }
 .sub_botton{
 padding-left:15px;
 padding-top:10px;
 
 }
 .submit_button:hover{
 background-color:red;
 color:lime;
 }
 .centerLogin{
 margin-left:88px;
 
 }
 .inputField{
   margin-left:100px;
 }
caption{
 padding-bottom:30px;
 font-size:35px;
 font-weight:bold;
}

.border{
 border:groove;
 width:400px;
 padding-left:25px;
 margin:auto;
 }
.Exception{
  
 width:400px;
 margin:auto;
 margin-top:196px;
 margin-bottom:-220px;
 margin-left:520px;
 font-size:20px;
 color:green;
 font-weight:bold;

}
.fh{

 width:450px;
 margin-left:473px;
}



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
 margin-left:30px;
color:white;
 font-weight:bold;
 }
div{
margin-left:930px;

width:250px;
margin-top:-30px;
}
.m1{
border:solid;
background-color:lime;
border-radius:8px;
padding:5px;
}
.m2{
border:solid;
background-color:red;
border-radius:8px;
padding:5px;

}

.re{


margin-top:60px;
margin-bottom:-100px;
font-size:20px;
font-weight:bold;
padding:10px;
background-color:red;

}

</style>

</head>
<body style="background:linear-gradient(blue,lime,green,white);">

<header>

<ul>
<a href ="index.jsp"class="a1">PhoneBook</a>
<a href ="request?id=2" class="a1">Home</a>
<a href ="request?id=2" class="a1">Add Phone No</a>
<a href ="request?id=2" class="a1">View Details</a>
<div class= "m" class="a1">
<a href ="login.jsp" class= "m1 a1">Login</a>
<a href ="register.jsp" class= "m2 a1">Register</a>
</div>
</ul>
</header>

<%
 String key = (String)request.getAttribute("key"); 

   if("f".equals(key)){
	   %>
	   <p class ="Exception" style="color:red;">Please Check Email Id And Password.....</p>
	   <%
   }else if("fh".equals(key)){
	   %>
	   	<p class ="Exception fh" style="color:red;">Exception Occure Servar Down Please try again</p>
	<%

   }else if("3".equals(key)){
       %>
   	<p class = "re">First You Login then it Will Work</p>
   	 <%
     }

%>

<form action="login" method = "post">
<div class = "border">
<table>
<caption>Login</caption>
	<tr>
		<td>
			<label for = "email">Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type = "email" name = "email" id = "email" placeholder = "enter your emil" required class="input1"><p></p>
		</td>
	</tr>
	<tr>
		<td>
			<label for = "password">password</label>
			<input type ="password" name = "password" id = "password" placeholder = "enter your password" required class="input1">
    	 </td>
     </tr>  
     <tr>
     	 <td>
     	 <p></p>
         	                 
          <a href = "forgotPassword.jsp" style="font-size:17px;font-weight:bold;text-decoration:none;margin-left:180px;padding-left:50px;color:blue">forgot password ?</a>
         </td>
         </tr>
     <tr>
    	 <td>
    	 
     		<input type = "submit" value = "Login" class = "submit_button sub_botton">
     	</td>
     </tr>
     <tr>
     	<td>
          <p class = "centerLogin" style= "font-size:20px;">Don't have an account ? <a href ="register.jsp" style= "text-decoration:none;color:blue">Register</a></p>
        </td>
     </tr>
</table>
</div>
</form>
</body>
</html>