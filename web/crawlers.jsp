<%-- 
    Document   : test
    Created on : Aug 16, 2014, 1:36:26 PM
    Author     : dimuthuupeksha
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
<div id="middle">
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

	<h2>Crawler List</h2>


	<div id="workArea">
		<table class="styledLeft" id="userListTable">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Active</th>
					<th>Port</th>
				</tr>
			</thead>
			<tbody>
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
        </div>
</div>
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
<script type="text/javascript">

jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
    return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};
 
jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
    return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};

$(document).ready(function() {
	$('#userListTable').dataTable({
		"bAutoWidth": false,
		"sPaginationType": "full_numbers",
		"bJQueryUI": true,
		"aaSorting": [[ 4, "desc" ]]
	});
} );
</script>

<%@include file="footer.jsp" %>