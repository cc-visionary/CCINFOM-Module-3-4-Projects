<%-- 
    Document   : modifycourse
    Created on : 02 2, 21, 12:39:08 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Course</title>
    </head>
    <body>
        <h1>Modify a Course</h1>
        <form name="modifycourse" action="modifycourse_process.jsp" method="POST">
            Course ID   - <input type="text" name="courseid" id="courseid" /><br />
            Course Name - <input type="text" name="coursename" id="coursename" /><br />
            Department  - <input type="text" name="department" id="department" /><br />
            <input type="submit" value="Modify Course" name="modifycourse" />
        </form>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
