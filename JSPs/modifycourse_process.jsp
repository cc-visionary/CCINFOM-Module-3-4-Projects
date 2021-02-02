<%-- 
    Document   : modifycourse_process
    Created on : 02 2, 21, 4:39:42 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing the Modification of Course</title>
    </head>
    <body>
        <h1>Modifying a Course</h1>
        <jsp:useBean id="courseBean" class="enrollment.courses" scope="page" />
        <%
            courseBean.setCourseId(request.getParameter("courseid"));
            courseBean.setCourseName(request.getParameter("coursename"));
            courseBean.setDepartment(request.getParameter("department"));
            if(courseBean.modRecord() == 1) {
        %>
                <p>Modifying the course with course id <strong><%=courseBean.getCourseId()%></strong> was successful.</p>
        <%
            } else {
        %>
                <p>Modifying the course was not successful.</p>
        <%
            }
        %>
        <br/>
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
