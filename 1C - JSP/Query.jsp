<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Click Q1 to see result of query 1
	
	<%
		String button1 = request.getParameter("Q1");

		if ("Q1".equals(button1)) {
			String redirectURL = "QueryResult1.jsp";
			response.sendRedirect(redirectURL);
		}
	%>
	
	<form method="post">
		<input type="submit" name="Q1" value="Q1" />

	</form>
	
	Click Q2 to see result of query 2
	
	<%
		String button2 = request.getParameter("Q2");

		if ("Q2".equals(button2)) {
			String redirectURL = "QueryResult2.jsp";
			response.sendRedirect(redirectURL);
		}
	%>
	
	<form method="post">
		<input type="submit" name="Q2" value="Q2" />

	</form>
	
	Click Q3 to see result of query 3
	
	<%
		String button3 = request.getParameter("Q3");

		if ("Q3".equals(button3)) {
			String redirectURL = "QueryResult3.jsp";
			response.sendRedirect(redirectURL);
		}
	%>
	
	<form method="post">
		<input type="submit" name="Q3" value="Q3" />

	</form>

</body>
</html>