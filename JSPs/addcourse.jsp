<%-- 
    Document   : addcourse
    Created on : 02 2, 21, 12:38:59 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course</title>
    </head>
    <body>
        <h1>Add a Course</h1>
        <form name="addcourse" action="addcourse_process.jsp" method="POST">
            Course ID   - <input type="text" name="courseid" id="courseid" /><br />
            Course Name - <input type="text" name="coursename" id="coursename" /><br />
            Department  - <input type="text" name="department" id="department" /><br />
            <input type="submit" value="Add Course" name="addcourse" />
        </form>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
