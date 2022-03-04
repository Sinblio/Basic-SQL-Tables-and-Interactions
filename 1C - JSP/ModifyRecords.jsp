<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!
	public void CreateTable(){
		Connection connect = null;
		Statement stmt = null;
		try {
			//Set up connection parameters
			String userName = "root";
			String password = "aaaa";
			String dbServer = "jdbc:mysql://localhost:3306/project1";
			//String dbServer = "jdbc:mysql://mysql.cs.iastate.edu/[schema]";
			//Set up connection
			Class.forName("com.mysql.jdbc.Driver");
			
			connect = DriverManager.getConnection(dbServer,userName,password);
		
			stmt = connect.createStatement();
			
			stmt.executeUpdate("set sql_safe_updates = 0;");
			stmt.executeUpdate("update students set name = 'Scott' where ssn = 746897816;");
			stmt.executeUpdate("update major set name = 'Computer Science', level = 'MS' where snum in (select snum from students where ssn = 746897816);");
			stmt.executeUpdate("delete from register where regtime = 'Spring2021';");
			stmt.executeUpdate("set sql_safe_updates = 1;");
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// Close connection
				if (stmt != null) {
					stmt.close();
				}
				if (connect != null) {
					connect.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click Submit To Modify Records");

		if ("Submit".equals(button)) {
			CreateTable();
			String redirectURL = "ModifyRecordsResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>
</body>
</html>