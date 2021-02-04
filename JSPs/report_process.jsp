<%-- 
    Document   : report_process
    Created on : 02 4, 21, 8:35:48 PM
    Author     : Christopher Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report (Term <%=request.getParameter("term")%>, School Year <%=request.getParameter("schoolyear")%>)</title>
    </head>
    <body>
        <h1>Report (Term <%=request.getParameter("term")%>, School Year <%=request.getParameter("schoolyear")%>)</h1>
        <jsp:useBean id="reportBean" class="enrollment.report" scope="page" />
        <% 
            reportBean.setTerm(Integer.parseInt(request.getParameter("term")));
            reportBean.setSchoolYear(Integer.parseInt(request.getParameter("schoolyear")));
            reportBean.generateReport(); 
        %>
        <p>There are a total of <%=reportBean.getCourseList().size()%> courses in Term <%=request.getParameter("term")%> of School Year <%=request.getParameter("schoolyear")%></p>
        <table style="width:50%" border="1">
            <tr>
                <th>Course ID</th>
                <th>Count</th>
            </tr>
        <% 
            for(int i = 0; i < reportBean.getCourseList().size(); i++) {
        %>
                <tr>
                    <td><%=reportBean.getCourseList().get(i)%></td>
                    <td><%=reportBean.getCountList().get(i)%></td>
                </tr>
        <%
            }
        %>
        </table>
        <% reportBean.clearReport(); %>
        <br />
        <a href="index.html">Back to Enrollment Menu</a>
    </body>
</html>
