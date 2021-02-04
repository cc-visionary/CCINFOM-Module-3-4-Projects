<%-- 
    Document   : report_info
    Created on : 02 4, 21, 8:35:32 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report - Details</title>
    </head>
    <body>
        <h1>Report Details</h1>
        <form name="report_details" action="report_process.jsp" method="POST">
            Term         - <input type="text" name="term" id="term" /><br />
            School Year  - <input type="text" name="schoolyear" id="schoolyear" /><br />
            <input type="submit" value="Enter Report Details" name="enterreportdetails" />
        </form>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
