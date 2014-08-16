<%-- 
    Document   : detail
    Created on : Aug 15, 2014, 2:40:30 PM
    Author     : dimuthuupeksha
--%>

<%@page import="corpus.sinhala.crawler.controller.webui.beans.DateRange"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<div id="middle">
    <div id="workArea">
    <style>
      html, body {
       height:100%;
       padding: 0px;
       margin: 0px;
      }
    </style>
        <title>JSP Page</title>
        <table>
            <tr>
                <td style="height: 80px">
                    <h1><%= request.getAttribute("name")%> Crawler</h1>
                    <%
                        String crawlerId = (String)request.getAttribute("id");
                        List<DateRange> ranges = (List<DateRange>)request.getAttribute("ranges");
                    %>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="timeline-embed"></div>
                </td>
            </tr>
        </table>
      <script type="text/javascript">
        var data= {"timeline":{
                    "type":"default",
                    "text":"People say stuff",
                    "startDate":"2014,8,20",
                    "date": [
                        <%for(int i=0;i<ranges.size();i++){
                            DateRange range = ranges.get(i);
                            if(i>0){
                                out.print(",");
                            }
                        %>
                        {
                            "startDate":"<%=range.sYear%>,<%=range.sMonth%>,<%=range.sDay%>",
                            "endDate":"<%=range.eYear%>,<%=range.eMonth%>,<%=range.eDay%>",
                            "headline":"Crawled",
                            "text":"<p>Currently crawled</p>"
                        }
                        <%}%>
                    ]
                }
            };
        var timeline_config = {
         width: "800",
         height: "400",
         source: data
        }
      </script>
      <script type="text/javascript" src="js/storyjs-embed.js"></script>
      <div id="timeline-embed"></div>
      </div>
</div>
<%@include file="footer.jsp" %>

