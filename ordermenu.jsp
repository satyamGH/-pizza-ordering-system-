<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ordering Home</title>
<style>
body
{
	background-image:url("Pictures/base.jpeg");
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
	color: #ff0000;
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
	color: #8a0005;
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
<%String usr = session.getAttribute("user").toString(); %>
<form action="logout.jsp">
<input class="logout" type="submit" value="LOGOUT">
</form>
<form action="homedirector.jsp">
<%session.setAttribute("userId", usr);%>
<input class="cancel" type="submit" value="HOME">
</form>
<h1>Select a Base of your choice:</h1>
<% 
	String a1="", a2="", a3="";
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN","ADMIN");
	PreparedStatement ps = c.prepareStatement("select stock_quantity from base where base_name=?");
	ps.setString(1, "Thin Crust");
	ResultSet rs = ps.executeQuery();
	if(rs.next());
	a1 = rs.getString(1);
	ps.setString(1, "Stuffed Crust");
	rs = ps.executeQuery();
	if(rs.next());
	a2 = rs.getString(1);
	ps.setString(1, "Pan Pizza");
	rs = ps.executeQuery();
	if(rs.next());
	a3 = rs.getString(1);
	}catch(Exception e)
	{
		System.out.println(e);
	}%>
<form action="toppingmenu.jsp">
<table width="100%" align="center">
<tr height="100"><td align="center"><label class="info">Thin Crust</label></td><td align="center"><img src="Pictures/ThinCrust.jpg"></td><td align="center"><input type="radio" name="base" value="TC"/><label class="select">Rs. 120 </label><label class="stock"> AVAILABILITY: <%= a1 %> in stock.</label></td></tr>
<tr height="100"><td align="center"><label class="info">Stuffed Crust</label></td><td align="center"><img src="Pictures/StuffedCrust.jpg"></td><td align="center"><input type="radio" name="base" value="SC"/><label class="select">Rs. 180 </label><label class="stock"> AVAILABILITY: <%= a2 %> in stock.</label></td></tr>
<tr height="100"><td align="center"><label class="info">Pan Pizza</label></td><td align="center"><img src="Pictures/PanPizza.jpg"></td><td align="center"><input type="radio" name="base" value="PP"/><label class="select">Rs. 160 </label><label class="stock"> AVAILABILITY: <%= a3 %> in stock.</label></td></tr>
</table>
<br/>
<br/>
<table width="20%" align="center">
<%session.setAttribute("userId", usr);%>
<tr height="80"><td align="center"><input class="button" type="submit" value="PROCEED"></td></tr>
</table>
</form>
</body>
</html>