<%-- 
    Document   : deletestudent_process
    Created on : 02 2, 21, 4:39:07 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing the Deletion of Student</title>
    </head>
    <body>
        <h1>Deleting Student Record</h1>
        <jsp:useBean id="studentBean" class="enrollment.students" scope="page" />
        <%
            studentBean.setStudentId(Integer.parseInt(request.getParameter("studentid")));
            if(studentBean.delRecord() == 1) {
        %>
        <p>Deleting the student with student id <strong><%=studentBean.getStudentId()%></strong> was successful.</p>
        <% 
            } else {
        %>
                <p>Deleting the student was not successful.</p>
        <%
            }
        %>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
