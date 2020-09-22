<%@ page import="java.sql.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Please Wait</title>
<link rel="stylesheet" type="text/css" href="image.css" />
</head>
<body class="index">
<%

            String username = request.getParameter("usn");
            String password = request.getParameter("pswd");
            	try{
                	Class.forName("oracle.jdbc.driver.OracleDriver");
                	Connection c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN","ADMIN");
                	PreparedStatement ps = c.prepareStatement("select * from pizzauser where username=? and password=?");
                	ps.setString(1, username);
                	ps.setString(2, password);
                    ResultSet rs = ps.executeQuery();
                    if(rs.next())
                    {
                    	request.setAttribute("uname", rs.getString(1));
                    	request.getRequestDispatcher("homewelcome.jsp").forward(request, response);
                    }
                    else
                    {
                    	%>
                    	Invalid credentials. Please register if a new user.
                    	<form action="register.jsp">
                    	<br/>
                    	<input class="button" type="submit" value="Back" size="60px">
                    	</form>
                    	<%
                    }
        		}
                    catch(Exception e)
                    {
                    	System.out.println(e);
                    }
            %>
</body>
</html>