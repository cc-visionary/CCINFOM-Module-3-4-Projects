<%-- 
    Document   : drop_studentdata
    Created on : 02 4, 21, 6:38:06 PM
    Author     : Chris Cheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Drop - Student Details</title>
    </head>
    <body>
        <h1>Drop - Enter Student Details</h1>
        <form name="drop_studentdetails" action="drop_selectcourses.jsp" method="POST">
            Student ID   - <input type="text" name="studentid" id="studentid" /><br />
            Term         - <input type="text" name="term" id="term" /><br />
            School Year  - <input type="text" name="schoolyear" id="schoolyear" /><br />
            <input type="submit" value="Enter Student Details" name="enterstudentdetails" />
        </form>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
