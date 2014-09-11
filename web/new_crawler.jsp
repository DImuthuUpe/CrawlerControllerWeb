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
                <thead>
                <th width="30%"></th>
                <th width="70%"></th>
                </thead>
                <tr style="height: 30px">
                    <td>Crawler Name</td>
                    <td><input type="text" size="50" name="name" style="height: 20px"/></td>
                </tr>   
                <tr>
                    <td>
                        Crawler File
                    </td>
                    <td>
                        <input type="file" name="file" size="60"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="Submit" value="Submit" style="float: right"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>

</script>
<%@include file="footer.jsp"%>
