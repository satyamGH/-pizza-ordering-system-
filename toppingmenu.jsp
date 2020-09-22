<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose your Toppings</title>
<style>
body
{
	background-image:url("Pictures/pizzatop.jpg");
	background-repeat:no-repeat;
	background-color:#ffffff;
	background-position: top;
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
label.info
{
	font-style: oblique;
	font-size: 1.50em;
	font-family: monospace;
	color: #ffd700;
}
label.stock
{
	font-style: normal;
	font-size: 1.50em;
	font-family: fantasy;
	color: #00a200;
}
label.select
{
	font-style: normal;
	font-size: 2.00em;
	font-family: cursive;
	color: #0000ff;
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
	color: #ff0000;
	font-size: 3.00em;
	font-family: cursive;
}
img
{
    max-width: 40%;
    max-height: 40%;
    display: block;
}
</style>
</head>
<body>
<%String base = request.getParameter("base");
String uname = session.getAttribute("userId").toString();
if(base.equals("TC"))
	base="Thin Crust";
if(base.equals("SC"))
	base="Stuffed Crust";
if(base.equals("PP"))
	base="Pan Pizza";
String cost="", t1="", t2="", t3="", t4="";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN","ADMIN");
	PreparedStatement ps = c.prepareStatement("select cost from base where base_name=?");
	ps.setString(1, base);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
		cost = rs.getString(1);
	PreparedStatement ps2 = c.prepareStatement("select stock_quantity from topping where topping_name=?");
	ps2.setString(1, "Extra Cheese");
	ResultSet rs2 = ps.executeQuery();
	if(rs2.next());
	t1 = rs2.getString(1);
	ps2.setString(1, "Baby Corns and Pepperoni");
	rs2 = ps2.executeQuery();
	if(rs2.next());
	t2 = rs2.getString(1);
	ps2.setString(1, "Mushroom Delight");
	rs2 = ps2.executeQuery();
	if(rs2.next());
	t3 = rs2.getString(1);
	ps2.setString(1, "Olives and Capsicum");
	rs2 = ps2.executeQuery();
	if(rs2.next());
	t4 = rs2.getString(1);
}
catch(Exception exc)
{
	System.out.println(exc);
}
%>
<h1>Delicious toppings to go with <%=base %>:</h1>
<form action="logout.jsp">
<input class="logout" type="submit" value="LOGOUT">
</form>
<form action="homedirector.jsp">
<%session.setAttribute("userId", uname);%>
<input class="cancel" type="submit" value="HOME">
</form>
<form action="ordersum.jsp">
<table width="100%" align="center">
<tr height="100"><td align="center"><label class="info">Extra Cheese</label></td><td align="center"><img src="Pictures/cheese.jpg"></td><td align="center"><input type="radio" name="topp" value="EC"/><label class="select">Rs. 120 </label><label class="stock"> AVAILABILITY: <%= t1 %> in stock.</label></td></tr>
<tr height="100"><td align="center"><label class="info">Baby Corns and Pepperoni</label></td><td align="center"><img src="Pictures/corn.jpg"></td><td align="center"><input type="radio" name="topp" value="BCP"/><label class="select">Rs. 140 </label><label class="stock"> AVAILABILITY: <%= t2 %> in stock.</label></td></tr>
<tr height="100"><td align="center"><label class="info">Mushroom Delight</label></td><td align="center"><img src="Pictures/mush.jpg"></td><td align="center"><input type="radio" name="topp" value="MD"/><label class="select">Rs. 160 </label><label class="stock"> AVAILABILITY: <%= t3 %> in stock.</label></td></tr>
<tr height="100"><td align="center"><label class="info">Olives and Capsicum</label></td><td align="center"><img src="Pictures/oli.jpg"></td><td align="center"><input type="radio" name="topp" value="OC"/><label class="select">Rs. 200 </label><label class="stock"> AVAILABILITY: <%= t4 %> in stock.</label></td></tr>
</table>
<br/>
<br/>
<table width="20%" align="center">
<tr height="80"><td align="center"><input class="button" type="submit" value="PROCEED"></td></tr>
</table>
<%session.setAttribute("userId", uname);
session.setAttribute("base", base);
%>
</form>
</body>
</html>