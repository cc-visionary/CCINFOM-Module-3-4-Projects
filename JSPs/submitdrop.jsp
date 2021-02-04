<%-- 
    Document   : drop_process
    Created on : 02 4, 21, 6:42:14 PM
    Author     : Chris Cheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing Dropping of Courses</title>
    </head>
    <body>
        <h1>Dropping Selected Courses</h1>
        <jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
        <%
            if(dropBean.confirmDrop() == 1) {
        %>
                <p>Dropping student ID <strong><%=dropBean.getStudent().getStudentId()%></strong>'s courses was successful</p>
        <%
            } else {
        %>
                <p>Dropping student ID <strong><%=dropBean.getStudent().getStudentId()%></strong>'s courses was unsuccessful</p>
        <% } %>
        <% dropBean.clearDrop(); %>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
