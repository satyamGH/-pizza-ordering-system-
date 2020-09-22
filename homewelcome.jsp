<%@ page import="java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome- Online Pizza Ordering</title>
<style>
body
{
	background-image:url("Pictures/Pizza.jpg");
	background-repeat:no-repeat;
	background-color:#ffffff;
	background-position: center;
	background-size: cover;
}
input.button
{
	text-align="center";
	width: 100px;
	background-color: #fcd89d;
	border-radius: 12px;
	border: 2px solid #08ff00;
}
label.info
{
	font-style: oblique;
	font-size: 1.25em;
	font-family: monospace;
	color: #000000;
}
h6
{
	font-style: oblique;
	color: #ff0000;
	font-size: 1.00em;
	font-family: cursive;
}
h1
{
	font-style: oblique;
	color: #004040;
	font-size: 3.00em;
	font-family: cursive;
}
label.contact
{
	font-style: inherit;
	font-size: 1.00em;
	font-family: fantasy;
	color: #000000;
}
</style>
</head>
<body>
<% String uname = (String)request.getAttribute("uname");%>
<h1>Hello, <%= uname %>.</h1>
 <table width="25%">
<tr height="100"><td><label class="info">Order your new Pizza -> </label></td>
<td align="left"><form action="ordermenu.jsp"><%session.setAttribute("user", uname); %><input class="button" type="submit" value="Try it now!" size="60px"></form></td></tr>
<tr height="100"><td><label class="info">Your past orders -> </label></td>
<td align="left"><form action="orderhistory.jsp"><%session.setAttribute("user", uname); %><input class="button" type="submit" value="Order History" size="60px"></form></td></tr>
<tr valign="bottom" height="100"><td><label class="info">Done ordering? </label></td><td></td>
<tr><td align="left" height="100"><form action="logout.jsp"><input class="button" type="submit" value="Logout" size="60px"></form></td></tr>
 </table>
 <table align="center" width="25%">
 <tr><td align="right"><label class="contact">Contact us:</label></td><td align="left"><label class="contact">+911a2b3c4d5e</label></td></tr>
 <tr><td colspan="2" align="center">Online ordering service available 24x7</td></tr>
 </table>
</body>
</html>