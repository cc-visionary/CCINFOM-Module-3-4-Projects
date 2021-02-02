<%-- 
    Document   : addenrollmentcart
    Created on : 02 2, 21, 6:38:30 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Item to Enrollment Cart</title>
    </head>
    <body>
        <h1>Adding to your enrollment cart</h1>
        <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session" />
        <jsp:useBean id="enrollmentBean" class="enrollment.enrollment" scope="page" />
        <%
            enrollmentBean.setStudentId(Integer.parseInt(request.getParameter("studentid")));
            enrollmentBean.setCourseId(request.getParameter("courseid"));
            enrollmentBean.setTerm(Integer.parseInt(request.getParameter("term")));
            enrollmentBean.setSchoolYear(Integer.parseInt(request.getParameter("schoolyear")));
            
            enrollBean.getEnrollmentList().add(enrollmentBean);
        %>
        Listing contents of the cart so far:<br>
        <ul>
        <% 
            for (int i = 0; i < enrollBean.getEnrollmentList().size(); i++) {
        %>
            <li>Course ID : <%=enrollBean.getEnrollmentList().get(i).getCourseId()%></li>
        <%  } %>
        </ul>
        <form name="addenrollmentcart" action="enroll_selectcourses.jsp" method="POST">
            <input type="hidden" name="studentid" id="studentid" value="<%=request.getParameter("studentid")%>" />
            <input type="hidden" name="term" id="term" value="<%=request.getParameter("term")%>" />
            <input type="hidden" name="schoolyear" id="schoolyear" value="<%=request.getParameter("schoolyear")%>" />
            <input type="submit" value="Add more Courses" name="addmorecourse" />
        </form>
    </body>
</html>
