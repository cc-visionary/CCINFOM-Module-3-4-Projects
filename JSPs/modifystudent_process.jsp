<%-- 
    Document   : modifystudent_process
    Created on : 02 2, 21, 4:40:27 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing the Modification of Student</title>
    </head>
    <body>
        <h1>Adding New Student Record</h1>
        <jsp:useBean id="studentBean" class="enrollment.students" scope="page" />
        <%
            studentBean.setStudentId(Integer.parseInt(request.getParameter("studentid")));
            studentBean.setCompleteName(request.getParameter("completename"));
            studentBean.setDegreeId(request.getParameter("degreeid"));
            if(studentBean.modRecord() == 1) {
        %>
                <p>Modifying the student with student id <strong><%=studentBean.getStudentId()%></strong> was successful.</p>
        <%
            } else {
        %>
                <p>Modifying the student was not successful.</p>
        <%
            }
        %>
        <br/>
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
