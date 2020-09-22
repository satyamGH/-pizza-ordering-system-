<%@ page import="java.sql.*,java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="image.css" />
</head>
<body class="register">
<%String name=request.getParameter("name");
  String address=request.getParameter("add");
  String usn=request.getParameter("usn");
  String pswd=request.getParameter("pswd"); 
  try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection c= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN","ADMIN");
      Statement st=c.createStatement();
      ResultSet rs=st.executeQuery("insert into pizzauser values('"+name+"','"+address+"','"+usn+"','"+pswd+"')"); %>
      <%= "Successfully Registered. Click BACK to return to homepage and Login." %>
			<form action="index.html">          
            <input class="button" type="submit" value="BACK">
            </form> 
 <%   }catch(SQLException e)
  	  {
	  System.out.print(e);
	  e.printStackTrace();
	  }
  catch(Exception i)
  {
	  System.out.println(i.getMessage());
  }%>
</body>
</html>