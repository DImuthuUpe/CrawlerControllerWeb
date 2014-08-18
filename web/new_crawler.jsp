<%-- 
    Document   : new_crawler.jsp
    Created on : Aug 17, 2014, 9:53:53 AM
    Author     : dimuthuupeksha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
<div id="middle">
    <h1>Create New Crawler</h1>
    <br/><br/>
    <div id="workArea">
        <form action="NewCrawler" method="post" enctype="multipart/form-data">
            <table>
                <tr style="height: 30px">
                    <td>Crawler Name</td>
                    <td><input type="text" size="50" name="name"/></td>
                </tr>   
                <tr>
                    <td>
                        Crawler File
                    </td>
                    <td>
                        <input type="file" name="file" size="50"/>
                    </td>
                </tr>
            </table>
            <input type="Submit" value="Submit"/>
        </form>
    </div>
</div>
<script>

</script>
<%@include file="footer.jsp"%>
