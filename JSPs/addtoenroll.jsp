<%-- 
    Document   : addenrollmentcart
    Created on : 02 2, 21, 6:38:30 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course to Enrollment Cart</title>
    </head>
    <body>
        <h1>Adding to your enrollment cart</h1>
        <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session" />
        <jsp:useBean id="enrollmentBean" class="enrollment.enrollment" scope="page" />
        <%
            enrollmentBean.setStudentId(enrollBean.getStudent().getStudentId());
            enrollmentBean.setCourseId(request.getParameter("courseid"));
            enrollmentBean.setTerm(enrollBean.getTerm());
            enrollmentBean.setSchoolYear(enrollBean.getSchoolYear());
            
            enrollBean.getEnrollmentList().add(enrollmentBean);
        %>
        Listing contents of the cart so far:<br>
        <ul>
        <% 
            for (int i = 0; i < enrollBean.getEnrollmentList().size(); i++) {
        %>
            <li><%=enrollBean.getEnrollmentList().get(i).getCourseId()%></li>
        <%  } %>
        </ul>
        <form name="backtoenrollmentselectcourses" action="enroll_selectcourses.jsp" method="POST">
            <input type="submit" value="Add more Courses" name="addmorecourse" />
        </form>
    </body>
</html>
