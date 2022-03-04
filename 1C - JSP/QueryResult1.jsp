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
        <H1>Querry 1 </H1>

        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/project1", "root", "aaaa");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select snum, ssn from students where name = 'Becky';") ; 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>snum</TH>
                <TH>ssn</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
            </TR>
            <% } %>
        </TABLE>
    </BODY>
</HTML>