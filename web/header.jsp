<%-- 
    Document   : header
    Created on : Aug 16, 2014, 2:38:30 PM
    Author     : dimuthuupeksha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/global.css" rel="stylesheet"
              type="text/css" media="all"/>
        <link href="css/lightBox.css" rel="stylesheet"
              type="text/css" media="all"/>
        <link href="css/app.css" rel="stylesheet"
              type="text/css" media="all"/>

        <script type="text/javascript">var baseAt=""</script>

        <link href="css/ion.tabs.skinFlat.css" rel="stylesheet"
              type="text/css" />

        <link rel="stylesheet" href="css/jquery-ui.css" />


        <script type="text/javascript"
        src="js/jquery-1.10.2.min.js"></script>


        <script src="js/ion-tabs/ion.tabs.min.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
        <link href="css/ion.tabs.css" rel="stylesheet" type="text/css">
        <!-- link href="css/demo_table.css" rel="stylesheet" type="text/css">
        <link href="css/jquery.dataTables.css" rel="stylesheet" type="text/css"-->
        <link href="css/demo_table_jui.css" rel="stylesheet" type="text/css">

    </head>

    <body>

        <!-- JS imports for collapsible menu -->
        <script src="js/yahoo-dom-event.js" type="text/javascript"></script>
        <script src="js/animation-min.js" type="text/javascript"></script>

        <script src="js/template_admin.js" type="text/javascript"></script>

        <script src="js/yahoo-min.js" type="text/javascript"></script>
        <script src="js/selector-min.js" type="text/javascript"></script>

        <table id="main-table" border="0" cellspacing="0">
            <tbody>
                <tr>	
                    <td id="header" colspan="3">
                        <div id="header-div">
                            <div class="right-logo">Management Console</div>
                            <div class="left-logo">
                                <a href="../admin/index.jsp" class="header-home"><img
                                        src="images/logo.png" width="300px" height="32px">
                                </a>
                            </div>
                            <div class="middle-ad"></div>
                            
                        </div>
                    </td>
                </tr>
                <tr style="height:600px">
                    <td class="vertical-menu-container" id="vertical-menu-container"
                        style="">
                        <div id="menu-panel-button0" class="showToHidden"></div>

                        <div id="menu-panel-button1" class="menu-panel-buttons selected"></div>

                        <div id="menu-panel-button2" class="menu-panel-buttons"></div>

                    </td>
                    <td id="menu-panel" valign="top">
                        <table id="menu-table" border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td id="region2">
                                        <div id="menu">
                                            <ul class="main">
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="region3">
                                        <div id="menu">
                                            <ul class="main">
                                                <li id="region3_registry_menu" class="menu-header"
                                                    onclick="mainMenuCollapse(this.childNodes[0])"
                                                    style="cursor: pointer">Main Menu</li>
                                                <li class="normal">
                                                    <ul class="sub">
                                                        <li><a
                                                                href="crawlers.jsp"
                                                                class="menu-default"
                                                                style="">Crawler List</a>
                                                        </li>
                                                        <li><a
                                                                href="new_crawler.jsp"
                                                                class="menu-default"
                                                                style="">New Crawler</a>
                                                        </li>
                                                        <li><a
                                                                href="task.jsp"
                                                                class="menu-default"
                                                                style="">Add New Job</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <td id="middle-content">
                        <table id="content-table" border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td id="page-header-links">





                                        <table class="page-header-links-table" cellspacing="0">
                                            <tbody>
                                                <tr>
                                                    <td class="breadcrumbs">
                                                        <table class="breadcrumb-table" cellspacing="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <div id="breadcrumb-div"></div>
                                                                    </td>
                                                                </tr>

                                                            </tbody>
                                                        </table>
                                                    </td>

                                                    <td class="page-header-help"><a href="./docs/userguide.html"
                                                                                    target="_blank">Help</a></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="body">
