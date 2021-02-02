<%-- 
    Document   : viewcourses
    Created on : 02 2, 21, 5:04:37 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courses</title>
    </head>
    <body>
        <jsp:useBean id="courseBean" class="enrollment.courses" scope="page" />
        <jsp:useBean id="courseTemp" class="enrollment.courses" scope="page" />
        <% courseBean.viewRecord(); %>
        <p>There are <strong><%=courseBean.getCourseList().size()%></strong> courses in the database</p>
        <table style="width:75%" border="1">
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Department</th>
            </tr>
            <%
                for(int i = 0; i < courseBean.getCourseList().size(); i++) {
                    courseTemp = courseBean.getCourseList().get(i);
            %>
            <tr>
                <td><%=courseTemp.getCourseId()%></td>
                <td><%=courseTemp.getCourseName()%></td>
                <td><%=courseTemp.getDepartment()%></td>
            </tr>
            <% 
                }
            %>
        </table>
        <br/>
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
