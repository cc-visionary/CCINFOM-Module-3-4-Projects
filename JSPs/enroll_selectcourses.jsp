<%-- 
    Document   : enroll_choosecourses
    Created on : 02 2, 21, 5:57:49 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enroll - Choose Courses</title>
    </head>
    <body>
        <h1>Enroll - Choose Available Courses</h1>
        <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="page" />
        <jsp:useBean id="studentBean" class="enrollment.students" scope="page" />
        <jsp:useBean id="coursedegreeTemp" class="enrollment.coursedegree" scope="page" />
        <% 
            studentBean.setStudentId(Integer.parseInt(request.getParameter("studentid")));
            studentBean.getRecord();
            enrollBean.setStudent(studentBean);
            enrollBean.loadCourses(); 
        %>
        <p>Student ID     : <%=studentBean.getStudentId()%></p>
        <p>Complete Name  : <%=studentBean.getCompleteName()%></p>
        <p>Degree ID      : <%=studentBean.getDegreeId()%></p>
        <p>There are <strong><%=enrollBean.getCourseList().size()%></strong> courses that you can choose from:</p>
        <table style="width:50%" border="1">
            <tr>
                <th>Course ID</th>
            </tr>
            <%
                for(int i = 0; i < enrollBean.getCourseList().size(); i++) {
                    coursedegreeTemp = enrollBean.getCourseList().get(i);
            %>
                    <tr>
                        <td><%=coursedegreeTemp.getCourseId()%></td>
                    </tr>
            <% 
                }
            %>
        </table>
        <form name="enroll_choosecourses" action="addenrollmentcart.jsp" method="POST">
            <input type="hidden" name="studentid" id="studentid" value="<%=request.getParameter("studentid")%>" />
            <input type="hidden" name="term" id="term" value="<%=request.getParameter("term")%>" />
            <input type="hidden" name="schoolyear" id="schoolyear" value="<%=request.getParameter("schoolyear")%>" />
            Course ID - <input type="text" name="courseid" id="courseid" /><br />
            <input type="submit" value="Add to Enrollment Cart" name="addtoenrollmentcart" />
        </form>
        <form name="confirmenrollment" action="enroll_process.jsp" method = "POST">
            <input type="hidden" name="studentid" id="studentid" value="<%=request.getParameter("studentid")%>" />
            <input type="submit" value="Confirm Enrollment" name="confirmenrollment" />
        </form>    
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
