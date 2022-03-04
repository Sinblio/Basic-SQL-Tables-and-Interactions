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
        <H1>Query 2 </H1>

        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/project1", "root", "aaaa");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select degrees.name, degrees.level from degrees join departments where department_code=code and departments.name='Computer Science'") ; 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>Department Name</TH>
                <TH>Department Level</TH>
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