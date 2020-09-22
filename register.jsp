<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register- Online Pizza Ordering</title>
<link rel="stylesheet" type="text/css" href="image.css" />
</head>
<body class="register">
<h1 align="center">PIZZA ORDERING</h1>
<h2 align="center">REGISTRATION</h2>
<form action="registerprocess.jsp" method="post">
<table align="center" width="25%">
<tr height="50"><td><label class="info">FullName:</label></td><td><input type="text" name="name"></td></tr><tr>
<tr height="50"><td><label class="info">Address:</label></td><td><input type="text" name="add"></td></tr><tr>
<tr height="50"><td><label class="info">Username:</label></td><td><input type="text" name="usn"></td></tr><tr>
<tr height="50"><td><label class="info">PassWord:</label></td><td><input type="text" name="pswd"></td></tr>
<tr height="50"><td colspan="2" align="center"><input class="button" type="submit" value="SUBMIT"></td></tr>
</table>
</form>
<form action="index.html">
<table align="center" width="25%">
<tr><td align="center"><input class="button" type="submit" value="HOME"></td></tr></table></form>
</body>
</html>