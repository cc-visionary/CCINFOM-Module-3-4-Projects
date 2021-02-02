<%-- 
    Document   : removestudent
    Created on : 02 2, 21, 12:38:51 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Student</title>
    </head>
    <body>
        <h1>Delete a Student</h1>
        <form name="deletestudent" action="deletestudent_process.jsp" method="POST">
            Student ID - <input type="text" name="studentid" id="studentid" /><br/>
            <input type="submit" value="Delete Student" name="deletestudent" />
        </form>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
