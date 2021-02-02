<%-- 
    Document   : viewstudents.jsp
    Created on : 02 2, 21, 5:03:55 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Students</title>
    </head>
    <body>
        <jsp:useBean id="studentBean" class="enrollment.students" scope="page" />
        <jsp:useBean id="studentTemp" class="enrollment.students" scope="page" />
        <% studentBean.viewRecord(); %>
        <p>There are <strong><%=studentBean.getStudentList().size()%></strong> students in the database</p>
        <table style="width:75%" border="1">
            <tr>
                <th>Student ID</th>
                <th>Complete Name</th>
                <th>Degree ID</th>
            </tr>
            <%
                for(int i = 0; i < studentBean.getStudentList().size(); i++) {
                    studentTemp = studentBean.getStudentList().get(i);
            %>
            <tr>
                <td><%=studentTemp.getStudentId()%></td>
                <td><%=studentTemp.getCompleteName()%></td>
                <td><%=studentTemp.getDegreeId()%></td>
            </tr>
            <% 
                }
            %>
        </table>
        <br/>
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
