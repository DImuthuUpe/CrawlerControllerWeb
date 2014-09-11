<%-- 
    Document   : task
    Created on : Aug 15, 2014, 12:23:47 AM
    Author     : dimuthuupeksha
--%>

<%@page import="corpus.sinhala.crawler.controller.webui.SysProperty"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-ui.js"></script>
<script type="text/javascript">
  $(function() {
    $( "#startDate" ).datepicker({ dateFormat: 'yy/mm/dd' });
    $( "#endDate" ).datepicker({ dateFormat: 'yy/mm/dd' });
  });
  </script>
<div id="middle">
    <div id="workArea">
    
        <%if(request.getParameter("id")!=null){%>
        <table>
            <tr>
                <td style="height: 50px">
                    <h1><%out.print(request.getParameter("name"));%> Crawler</h1>
                </td>
            
            </tr>
            
        </table>
        <form action="Communicator">
            <input type="hidden" name="id" value="<%out.print(request.getParameter("id"));%>">
                <table>
                    <thead>
                    <th width="50%"></th>
                    <th width="50%"></th>
                    </thead>
                    <tr style="width: 100%;height: 50px">
                        <td>
                            <p>Start Date: <input type="text" id="startDate" name="startDate"></p>
                        </td>
                        <td>
                            <p>End Date: <input type="text" id="endDate" name="endDate"></p>
                        </td>
                    </tr>
                    <tr>
                         <td>Port <input type="text" name="port" value="12346"></td>
                         <td></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Start Crawling" style="float: right"/></td>
                    </tr>
                </table>
            </form>
            <%}else{%>
            <h1>Add New Job</h1>
            <br/>
                <%

            try {
                // Step 1. Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Step 2. Create a Connection object
               Connection con = DriverManager.getConnection(
                        "jdbc:mysql://"+SysProperty.getProperty("dbHost")+":3306/crawler_data",
                        SysProperty.getProperty("dbUser"), SysProperty.getProperty("dbPassword"));

                System.out.println("got connection");


                // Step 3. Create a Statement object and call its executeUpdate 
                // method to insert a record
                Statement s = con.createStatement();

                // Step 4. Use the same Statement object to obtain a ResultSet object
                String sql = "SELECT ID, NAME FROM crawler";
                ResultSet rs = s.executeQuery(sql);
                
                
                %>
                <table class="styledLeft" id="crawlerListTable">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>
                            <%
                    while (rs.next()) {
                    
                    %>
                    <tr>
                        <td><%out.println(rs.getString(1));%></td>
                        <td><a href="task.jsp?id=<%out.println(rs.getString(1)+"&name="+rs.getString(2));%>"><%out.println(rs.getString(2));%></a></td>
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
            <%}%>
    </div>
        
</div>
<script type="text/javascript">

jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
    return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};
 
jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
    return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};

$(document).ready(function() {
	$('#crawlerListTable').dataTable({
		"bAutoWidth": false,
		"sPaginationType": "full_numbers",
		"bJQueryUI": true,
		"aaSorting": [[ 1, "desc" ]]
	});
} );
</script>
<%@include file="footer.jsp" %>