<%-- 
    Document   : addstudent
    Created on : 02 2, 21, 12:35:23 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student</title>
    </head>
    <body>
        <h1>Add a Student</h1>
        <form name="addstudent" action="addstudent_process.jsp" method="POST">
            Student ID    - <input type="text" name="studentid" id="studentid" /><br />
            Complete Name - <input type="text" name="completename" id="completename" /><br />
            Degree ID     - <input type="text" name="degreeid" id="degreeid" /><br />
            <input type="submit" value="Add Student" name="addstudent" />
        </form>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
