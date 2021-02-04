<%-- 
    Document   : adddropcart
    Created on : 02 4, 21, 6:41:58 PM
    Author     : Chris Cheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course to your Drop Cart</title>
    </head>
    <body>
        <h1>Adding to your drop cart</h1>
        <jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
        <jsp:useBean id="enrollmentBean" class="enrollment.enrollment" scope="page" />
        <%
            enrollmentBean.setStudentId(dropBean.getStudent().getStudentId());
            enrollmentBean.setCourseId(request.getParameter("courseid"));
            enrollmentBean.setTerm(dropBean.getTerm());
            enrollmentBean.setSchoolYear(dropBean.getSchoolYear());
            
            dropBean.getDropList().add(enrollmentBean);
        %>
        Listing contents of the cart so far:<br>
        <ul>
        <% 
            for (int i = 0; i < dropBean.getDropList().size(); i++) {
        %>
                <li><%=dropBean.getDropList().get(i).getCourseId()%></li>
        <%  } %>
        </ul>
        <form name="backtodropselectcourses" action="drop_selectcourses.jsp" method="POST">
            <input type="submit" value="Add more Courses" name="addmorecourse" />
        </form>
    </body>
</html>
