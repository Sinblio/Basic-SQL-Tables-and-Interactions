<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<HTML>
    <HEAD>
        <TITLE>The tableName Database Table </TITLE>
    </HEAD>

    <BODY>
        <H1>Query 3 </H1>

        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/project1", "root", "aaaa");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select courses.number, courses.name from courses join departments where department_code=code and (departments.name='Computer Science' or departments.name='Landscape Architect');") ; 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>Course Number</TH>
                <TH>Course Name</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
				<TD> <%= resultset.getString(2) %></td> 
            </TR>
            <% } %>
        </TABLE>
    </BODY>
</HTML>