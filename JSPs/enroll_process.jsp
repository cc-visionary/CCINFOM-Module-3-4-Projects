<%-- 
    Document   : enroll_process
    Created on : 02 2, 21, 4:40:38 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing the Enrollment</title>
    </head>
    <body>
        <h1>Enrolling Registered Courses</h1>
        <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session" />
        <%
            if(enrollBean.confirmEnrollment() == 1) {
        %>
                <p>Student ID <strong><%=request.getParameter("studentid")%></strong>'s enrollment was successful</p>
        <%
            } else {
        %>
                <p>Student ID <strong><%=request.getParameter("studentid")%></strong>'s enrollment was unsuccessful</p>
        <% } %>
        <% enrollBean.clearEnrollment(); %>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
