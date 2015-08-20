<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign the Technician</title>
</head>
<body>
<%
int x1 = Integer.parseInt(request.getParameter("x1"));
%>
<%= x1 %><br><br>
<form method="post">
<select>
<option>a</option>
<option>b</option>
<option>c</option></select>
<br><br>
<input type="submit" value="Submit" onclick="window.close()">
</form>
</body>
</html>