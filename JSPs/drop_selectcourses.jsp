<%-- 
    Document   : drop_selectcourses
    Created on : 02 4, 21, 6:41:44 PM
    Author     : Chris Cheng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Drop - Choose Courses</title>
    </head>
    <body>
        <h1>Drop - Choose Available Courses</h1>
        <jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
        <jsp:useBean id="studentBean" class="enrollment.students" scope="page" />
        <jsp:useBean id="enrollmentTemp" class="enrollment.enrollment" scope="page" />
        <% 
            if(request.getParameterMap().containsKey("studentid")) {
                studentBean.setStudentId(Integer.parseInt(request.getParameter("studentid")));
                studentBean.getRecord();
                dropBean.setStudent(studentBean);
            } else studentBean = dropBean.getStudent();
            
            if(request.getParameterMap().containsKey("term")) 
                dropBean.setTerm(Integer.parseInt(request.getParameter("term")));
            if(request.getParameterMap().containsKey("schoolyear")) 
                dropBean.setSchoolYear(Integer.parseInt(request.getParameter("schoolyear")));
            
            dropBean.loadEnrollment(); 
        %>
        <p>Student ID     : <%=studentBean.getStudentId()%></p>
        <p>Complete Name  : <%=studentBean.getCompleteName()%></p>
        <p>Degree ID      : <%=studentBean.getDegreeId()%></p>
        <p>There are <strong><%=dropBean.getEnrollmentList().size()%></strong> courses <%=studentBean.getCompleteName()%> has enrolled in Term <%=request.getParameter("term")%>, School Year <%=request.getParameter("schoolyear")%></p>
        <table style="width:50%" border="1">
            <tr>
                <th>Course ID</th>
            </tr>
            <%
                for(int i = 0; i < dropBean.getEnrollmentList().size(); i++) {
                    enrollmentTemp = dropBean.getEnrollmentList().get(i);
            %>
                    <tr><td><%=enrollmentTemp.getCourseId()%></td></tr>
            <% 
                }
            %>
        </table>
        <form name="drop_selectcourses" action="addtodrop.jsp" method="POST">
            Course ID - <input type="text" name="courseid" id="courseid" /><br />
            <input type="submit" value="Add to Drop Cart" name="addtodropcart" />
        </form>
        <p>There are <strong><%=dropBean.getDropList().size()%></strong> courses in your drop cart:</p>
        <table style="width:50%" border="1">
            <tr>
                <th>Course ID</th>
            </tr>
            <%
                for(int i = 0; i < dropBean.getDropList().size(); i++) {
                    enrollmentTemp = dropBean.getDropList().get(i);
            %>
                    <tr><td><%=enrollmentTemp.getCourseId()%></td></tr>
            <% 
                }
            %>
        </table>
        <form name="confirmdrop" action="submitdrop.jsp" method = "POST">
            <input type="submit" value="Confirm Drop" name="confirmdrop" />
        </form>    
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
