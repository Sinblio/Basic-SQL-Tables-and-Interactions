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
			String dbServer = "jdbc:mysql://localhost:3306/";
			//String dbServer = "jdbc:mysql://mysql.cs.iastate.edu/[schema]";
			//Set up connection
			Class.forName("com.mysql.jdbc.Driver");
			
			connect = DriverManager.getConnection(dbServer,userName,password);
		
			stmt = connect.createStatement();
			
			stmt.addBatch("drop database if exists project1;");
			stmt.addBatch("create database project1;");
			stmt.addBatch("use project1;");
			
			stmt.addBatch("CREATE TABLE students (\r\n" + 
					"	snum INT,\r\n" + 
					"	ssn INTEGER,\r\n" + 
					"   name VARCHAR(10),\r\n" + 
					"   gender VARCHAR(1),\r\n" + 
					"   dob DATE, \r\n" + 
					"   c_addr VARCHAR(20),\r\n" + 
					"   c_phone VARCHAR(10),\r\n" + 
					"   p_addr VARCHAR(20),\r\n" + 
					"   p_phone VARCHAR(10),\r\n" + 
					"   PRIMARY KEY(ssn),\r\n" + 
					"   UNIQUE(snum)\r\n" + 
					");");
			
			stmt.addBatch("CREATE TABLE departments (\r\n" + 
					"	code INT,\r\n" + 
					"   name VARCHAR(50),\r\n" +
					"	phone varchar(10),\r\n" +
					"	college varchar(20),\r\n" +
					"   PRIMARY KEY(code),\r\n" + 
					"   UNIQUE(name)\r\n" + 
					");");
			
			stmt.addBatch("CREATE TABLE degrees (\r\n" + 
					"	name varchar(50),\r\n" + 
					"   level varchar(5),\r\n" +
					"	department_code int NOT NULL,\r\n" +
					"	FOREIGN KEY (department_code) REFERENCES departments(code) ON UPDATE CASCADE ON DELETE CASCADE,\r\n" +
					"   PRIMARY KEY(name, level)\r\n" + 
					");");
			
			stmt.addBatch("CREATE TABLE courses (\r\n"
					+ "number int,\r\n"
					+ "name varchar(50) UNIQUE,\r\n"
					+ "descrption varchar(50),\r\n"
					+ "credithours int,\r\n"
					+ "level varchar(20),\r\n"
					+ "department_code int NOT NULL,\r\n"
					+ "FOREIGN KEY (department_code) REFERENCES departments(code) ON UPDATE CASCADE ON DELETE CASCADE,\r\n"
					+ "PRIMARY KEY (number)\r\n"
					+ ");");
			
			stmt.addBatch("CREATE TABLE major (\r\n"
					+ "snum int,\r\n"
					+ "name varchar(50),\r\n"
					+ "level varchar(5),\r\n"
					+ "FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\r\n"
					+ "FOREIGN KEY (name, level) REFERENCES degrees(name, level) ON UPDATE CASCADE ON DELETE CASCADE,\r\n"
					+ "PRIMARY KEY(snum, name, level)\r\n" 
					+ ");");
			
			stmt.addBatch("CREATE TABLE minor (\r\n"
					+ "snum int,\r\n"
					+ "name varchar(50),\r\n"
					+ "level varchar(5),\r\n"
					+ "FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\r\n"
					+ "FOREIGN KEY (name, level) REFERENCES degrees(name, level) ON UPDATE CASCADE ON DELETE CASCADE,\r\n"
					+ "PRIMARY KEY(snum, name, level)\r\n" 
					+ ");");
			
			stmt.addBatch("CREATE TABLE register (\r\n"
					+ "snum int,\r\n"
					+ "course_number int,\r\n"
					+ "regtime varchar(20),\r\n"
					+ "grade int,\r\n"
					+ "FOREIGN KEY (snum) REFERENCES students(snum) ON UPDATE CASCADE ON DELETE CASCADE,\r\n"
					+ "FOREIGN KEY (course_number) REFERENCES courses(number) ON UPDATE CASCADE ON DELETE CASCADE,\r\n"
					+ "PRIMARY KEY(snum, course_number)\r\n"
					+ ");");
			
			stmt.executeBatch();
			
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
		out.println("Click Submit To Make Tables");

		if ("Submit".equals(button)) {
			CreateTable();
			String redirectURL = "CreateTableResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>
</body>
</html>