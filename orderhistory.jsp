<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@ page import="java.sql.*, java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Past Orders</title>
<style>
body
{
	background-image:url("Pictures/download.jpg");
	background-repeat:no-repeat;
	background-color:#ffffff;
	background-position: right;
	background-size: 35%;
}
label.info
{
	font-style: oblique;
	font-size: 1.30em;
	font-family: monospace;
	color: #000000;
}
h1
{
	font-style: oblique;
	color: #ff0000;
	font-size: 2.50em;
	font-family: cursive;
}
input.logout
{
	position: absolute;
	bottom: 30px;
	right: 10px;
	text-align="center";
	width: 100px;
	background-color: #fcd89d;
	border-radius: 12px;
	border: 2px solid #08ff00;
}
input.cancel
{
	position: absolute;
	bottom: 30px;
	left: 10px;
	text-align="center";
	width: 100px;
	background-color: #fcd89d;
	border-radius: 12px;
	border: 2px solid #08ff00;
}
</style>
</head>
<body>
<%
String user = session.getAttribute("user").toString();
String username="";
String date="", base="", top="";
int amt=0;
int count = 0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN","ADMIN");
	PreparedStatement ps = c.prepareStatement("select username from pizzauser where name=?");
	ps.setString(1, user);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
		username = rs.getString(1);
	ps = c.prepareStatement("select count(username) from orders where username=?");
	ps.setString(1, username);
	rs = ps.executeQuery();
	if(rs.next())
		count = rs.getInt(1);
	}
catch(Exception e)
{
	System.out.println(e);
}
	%>
<h1><%=count %> orders found for <%=user %>.</h1>
<%if(count!=0)
	{
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN","ADMIN");
	PreparedStatement ps = c.prepareStatement("select * from orders where username=?");
	ps.setString(1, username);
	ResultSet rs2 = ps.executeQuery();
	while(rs2.next())
	{
		date = rs2.getString("ord_date");
		base = rs2.getString("base");
		top = rs2.getString("topping");
		amt = rs2.getInt("amnt");
		%>
		<br/><br/><br/><label class="info"><%= date%> -- <%= top%> on <%= base%> -- Rs. <%= amt%></label>
		<%
	}
	}catch(Exception e)
	{
		System.out.println(e);
	}
	}
	%>
	<form action="logout.jsp">
<input class="logout" type="submit" value="LOGOUT">
</form>
<form action="homedirector.jsp">
<%session.setAttribute("userId", user);%>
<input class="cancel" type="submit" value="HOME">
</form>
</body>
</html>