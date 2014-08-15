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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Style-->
    <style>
      html, body {
       height:100%;
       padding: 0px;
       margin: 0px;
      }
    </style>
        <title>JSP Page</title>
    </head>
    
    <body>
        <h1>Crawler : <%= request.getAttribute("id")%></h1>
        <%
            String crawlerId = (String)request.getAttribute("id");
            List<DateRange> ranges = (List<DateRange>)request.getAttribute("ranges");
        %>
              
      <div id="timeline-embed"></div>
      
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
         width: "600",
         height: "100%",
         source: data
        }
      </script>
      <script type="text/javascript" src="js/storyjs-embed.js"></script>
      <div id="timeline-embed"></div>
      
    </body>
</html>
