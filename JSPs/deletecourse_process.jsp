<%-- 
    Document   : deletecourse_process
    Created on : 02 2, 21, 4:39:21 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing the Deletion of Course</title>
    </head>
    <body>
        <h1>Deleting a Course</h1>
        <jsp:useBean id="courseBean" class="enrollment.courses" scope="page" />
        <%
            courseBean.setCourseId(request.getParameter("courseid"));
            if(courseBean.delRecord() == 1) {
        %>
                <p>Deleting the course with course id <strong><%=courseBean.getCourseId()%></strong> was successful.</p>
        <%
            } else {
        %>
                <p>Deleting the course was not successful.</p>
        <%
            }
        %>
        <br/>
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
