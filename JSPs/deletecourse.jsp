<%-- 
    Document   : removecourse
    Created on : 02 2, 21, 12:39:17 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Course</title>
    </head>
    <body>
        <h1>Delete a Course</h1>
        <form name="deletecourse" action="deletecourse_process.jsp" method="POST">
            Course ID - <input type="text" name="courseid" id="courseid" /><br />
            <input type="submit" value="Delete Course" name="deletecourse" />
        </form>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
