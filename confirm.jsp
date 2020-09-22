<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Confirmation</title>
<style>
body
{
	background-image:url("Pictures/confirm.jpg");
	background-repeat:no-repeat;
	background-color:#ffffff;
	background-position: top;
	background-size: auto;
}
h1
{
	font-style: oblique;
	color: #ff0000;
	font-size: 1.90em;
	font-family: cursive;
}
input.button
{
	text-align="center";
	width: 100px;
	background-color: #fcd89d;
	border-radius: 12px;
	border: 2px solid #08ff00;
}
h6
{
	font-size: 1.00em;
}
</style>
</head>
<body>
<%String user, top, base, id="", price;
price = session.getAttribute("price").toString();
user = session.getAttribute("userId").toString();
top = session.getAttribute("top").toString();
base = session.getAttribute("base").toString();
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN","ADMIN");
	Statement stmt = c.createStatement();
	PreparedStatement ps = c.prepareStatement("select username from pizzauser where name=?");
	ps.setString(1, user);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
		id = rs.getString(1);
	String sql = "update base set stock_quantity = (select stock_quantity from base where base_name='"+base+"')-1 where base_name='"+base+"'";
	stmt.executeUpdate(sql);
	sql = "update topping set stock_quantity = (select stock_quantity from topping where topping_name='"+top+"')-1 where topping_name='"+top+"'";
	stmt.executeUpdate(sql);
	sql = "insert into orders values('"+id+"', (SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY') FROM DUAL), '"+base+"', '"+top+"', '"+price+"')";
	stmt.executeUpdate(sql);
}catch(Exception e)
{
	System.out.println(e);
}
%>
<h1>Thanks for your order, <%=user %>.</h1>
<h6>(<%=top %> Topping on <%=base %> Base)</h6>
<table width = "22%" align="left">
<tr height="50"><form action = "homedirector.jsp"><td align="center"><%session.setAttribute("userId", user); %><input class="button" type="submit" value="HOME"></td></form></tr>
<tr height="50"><form action = "logout.jsp"><td align="center"><input class="button" type="submit" value="LOGOUT"></td></form></tr>
</table>
</body>
</html>