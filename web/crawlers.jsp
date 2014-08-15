<%-- 
    Document   : crawlers
    Created on : Aug 15, 2014, 1:23:21 PM
    Author     : dimuthuupeksha
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            try {
                // Step 1. Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Step 2. Create a Connection object
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/crawler_data",
                        "root", "");

                System.out.println("got connection");


                // Step 3. Create a Statement object and call its executeUpdate 
                // method to insert a record
                Statement s = con.createStatement();

                // Step 4. Use the same Statement object to obtain a ResultSet object
                String sql = "SELECT ID, NAME, ACTIVE, PORT FROM Crawler";
                ResultSet rs = s.executeQuery(sql);
                
                
        %>
        <h1>Crawler List</h1>
        
        <table border="1">
           
            <tbody>
                <tr>
                    <td style="width: 100px">Id</td>
                    <td style="width: 300px">Name</td>
                    <td style="width: 100px">Active</td>
                    <td style="width: 100px">Port</td>
                </tr>
                
                    <%
                    while (rs.next()) {
                    
                    %>
                    <tr>
                    <td><%out.println(rs.getString(1));%></td>
                    <td><a href="Detail?id=<%out.println(rs.getString(1));%>"><%out.println(rs.getString(2));%></a></td>
                    <td><%out.println(rs.getString(3));%></td>
                    <td><%out.println(rs.getString(4));%></td>
                    </tr>
                    <%
                    }
                    %>
                
            </tbody>
            
        </table>
        
        <%
        rs.close();
                s.close();
                con.close();
            } catch (ClassNotFoundException e1) {
                // JDBC driver class not found, print error message to the console
                System.out.println(e1.toString());
            } catch (SQLException e2) {
                // Exception when executing java.sql related commands, print error message to the console
                System.out.println(e2.toString());
            } catch (Exception e3) {
                // other unexpected exception, print error message to the console
                System.out.println(e3.toString());
            }
        %>
    </body>
</html>
