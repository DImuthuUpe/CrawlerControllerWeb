<%-- 
    Document   : task
    Created on : Aug 15, 2014, 12:23:47 AM
    Author     : dimuthuupeksha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui.js"></script>
        <title>JSP Page</title>
    </head>
    <script type="text/javascript">
  $(function() {
    $( "#startDate" ).datepicker({ dateFormat: 'yy/mm/dd' });
    $( "#endDate" ).datepicker({ dateFormat: 'yy/mm/dd' });
  });
  </script>
    <body>
        <table style="width: 100%">
            <tr>
                <td style="background-color: aqua">
                    <H2>Divaina Crawler<h2>
                </td>
            
            </tr>
            <tr>
                <td style="height: 50px;background-color: blanchedalmond">
                    
                </td>
            </tr>
            </table>
        <form action="Communicator">
                <table>
                    <tr style="width: 100%">
                        <td style="width: 300px;height: 200px;background-color: coral">
                            <p>Start Date: <input type="text" id="startDate" name="startDate"></p>
                        </td>
                        <td style="width: 300px;height: 200px;background-color: coral">
                            <p>End Date: <input type="text" id="endDate" name="endDate"></p>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Start Crawling"></td>
                    </tr>
                </table>
            </form>
        
    </body>
</html>
