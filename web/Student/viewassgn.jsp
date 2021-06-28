<%-- 
    Document   : viewassgn
    Created on : 29-Apr-2021, 5:44:41 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Styles/style.css">
        <title>My Assignments</title>
    </head>
    <body>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.bean.Student"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page import="pack1.Utilities.AssignmentDao"%>
        <%@page import="pack1.bean.Assignment"%>
        <%@page import="java.util.*"%>
        <%
            String uname = (String)session.getAttribute("userName");
            Student s=StudentDao.getRecordByUname(uname);
            int id=s.getId();
            List<Assignment> list=AssignmentDao.getAllRecordsById(id);
            request.setAttribute("list",list);
        %>
        
        <h1>My Assignments</h1>
        <table border="1" width="100%" style="text-align:center">
                <tr>
                    <th>Subject</th>
                    <th>Assignment</th>
                    <th>Grade</th>
                </tr>
                <c:forEach items="${list}" var="u">
                    <tr>
                        <td>${u.getSubject()}</td>
                        <td>${u.getFilename()}</td>
                        <td>${u.getGrade()}</td>
                    </tr>
            </c:forEach>
            </table>
    </body>
</html>
