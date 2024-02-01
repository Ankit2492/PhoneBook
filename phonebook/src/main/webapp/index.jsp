<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.navbar{
border:solid black;
overflow:auto;
font-size:30px;
font-weight:bold;
border-radius:20px;
background-color:black;
}
a{
text-decoration:none;
margin:20px;
float:right;
border:solid white;
border-radius:15px;
color:white;
padding:5px;
}

.welcome{

font-size:45px;
font-weight:bold;
color:white;
width:900px;
margin-top:-80px;
margin-left:70px;

}
.image{

margin:auto;
width:800px;
margin-top:10px;
margin-left:20px;
}

.user{


font-size:40px;
font-weight:bold;
color:white;
width:850px;
margin:auto;
margin-top:150px;
margin-bottom:-200px;
}

</style>
<title>Insert title here</title>
</head>

<body style ="background: rgb(63,94,251);
background: radial-gradient(circle, rgba(112,94,251,1) 0%, rgba(252,70,107,1) 100%);">
<header>
<nav class ="navbar">

  <a href = "register.jsp" style="background-color:red;">Register</a>
  <a href = "login.jsp" style="background-color:lime;color:black">Login</a>
  
</nav>

 <p class = "welcome">Welcome PhoneBook System Upload Details</p>
 
</header>
<p class="user">Hi User ! Welcome Use This PhoneBook System</p>
<div class="image">
<img src="picimage/pic/many-hands-holding-mobile-phones-against-blue-sky-79718166-removebg-preview.png" width="1200px;">
</div>
</body>
</html>