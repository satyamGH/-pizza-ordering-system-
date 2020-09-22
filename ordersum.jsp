<%@ page import="java.sql.*, java.io.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Summary</title>
<style>
body
{
	background-image:url("Pictures/ordersumimg.jpg");
	background-repeat:no-repeat;
	background-color:#ffffff;
	background-position: top;
	background-size: cover;
}
h1
{
	font-style: oblique;
	color: #04007d;
	font-size: 3.00em;
	font-family: cursive;
}
label.info
{
	font-style: oblique;
	font-size: 2.50em;
	font-family: monospace;
	color: #efff00;
}
input.button
{
	text-align="center";
	width: 100px;
	background-color: #fcd89d;
	border-radius: 12px;
	border: 2px solid #08ff00;
}
input.logout
{
	position: absolute;
	top: 10px;
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
	top: 10px;
	left: 10px;
	text-align="center";
	width: 100px;
	background-color: #fcd89d;
	border-radius: 12px;
	border: 2px solid #08ff00;
}
label.select
{
	font-style: normal;
	font-size: 2.00em;
	font-family: cursive;
	color: #0000ff;
}
label.stock
{
	font-style: normal;
	font-size: 1.50em;
	font-family: fantasy;
	color: #00a200;
}
</style>
</head>
<body>
<%String top = request.getParameter("topp");
String base = session.getAttribute("base").toString();
String user = session.getAttribute("userId").toString();
if(top.equals("EC"))
	top = "Extra Cheese";
else
	if(top.equals("BCP"))
		top = "Baby Corns and Pepperoni";
	else
		if(top.equals("MD"))
			top = "Mushroom Delight";
		else
			if(top.equals("OC"))
				top = "Olives and Capsicum";
String cb="", ct="";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN","ADMIN");
	PreparedStatement psb = c.prepareStatement("select cost from base where base_name=?");
	psb.setString(1, base);
	ResultSet rsb = psb.executeQuery();
	if(rsb.next())
		cb = rsb.getString(1);
	PreparedStatement pst = c.prepareStatement("select cost from topping where topping_name=?");
	pst.setString(1, top);
	ResultSet rst = pst.executeQuery();
	if(rst.next())
		ct = rst.getString(1);
}
catch(Exception e)
{
	System.out.println(e);
}

%>
<form action="logout.jsp">
<input class="logout" type="submit" value="LOGOUT">
</form>
<form action="homedirector.jsp">
<%session.setAttribute("userId", user);%>
<input class="cancel" type="submit" value="HOME">
</form>
<h1>Here's what you've selected, <%=user %>:</h1>
<table align="center" width="70%">
<tr height="120"><td><label class="info">Base: </label></td><td><label class="select"><%=base %></label></td><td><label class="stock">Rs. <%=cb %></label><td></tr>
<tr height="120"><td><label class="info">Topping: </label></td><td><label class="select"><%=top %></label></td><td><label class="stock">Rs. <%=ct %></label><td></tr>
</table>
<form action="confirm.jsp">
<table width="50%" align="center">
<tr height="80"><td align="center"><label class="info">Confirm your order for Rs. <%=(Integer.parseInt(cb)+Integer.parseInt(ct)) %>?</label></td></tr>
<tr height="80"><td align="center"><input class="button" type="submit" value="CONFIRM"></td></tr>
</table>
<%
session.setAttribute("userId", user);
session.setAttribute("base", base);
session.setAttribute("top", top);
session.setAttribute("price", Integer.toString(Integer.parseInt(cb)+Integer.parseInt(ct)));
%>
</form>
</body>
</html>