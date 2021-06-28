<%-- 
    Document   : grading
    Created on : 28-Apr-2021, 11:14:26 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Styles/style.css">
        <title>Grade Assignments</title>
    </head>
    <body>
        <h1>Grade Assignments</h1>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page import="pack1.Utilities.AssignmentDao"%>
        <%@page import="pack1.bean.Assignment"%>
        <%@page import="java.util.*"%>
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.bean.Faculty"%>
         
        <%
            String subject=request.getParameter("subject");
            List<Assignment> list=AssignmentDao.getAllRecords(subject);
            request.setAttribute("list",list);
            session.setAttribute("assgnList",list);
        %>
        <br>
        <div align="center" class="new">  
            <form method="post" action="gradinglogs.jsp" >
            <table border="1" width="100%" style="text-align:center">
                <tr>
                    <th>Student ID</th>
                    <th>Assignment</th>
                    <th>Current Grade</th>
                    <th>Grade</th>
                </tr>
                <c:forEach items="${list}" var="u">
                    <tr>
                        <td>${u.getStuId()}</td>
                        <td>${u.getFilename()}</td>
                        <td>${u.getGrade()}</td>
                    
                        <td>
                            <select id="grade" name="grade" style="width:100%">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="E">E</option>
                            </select>
                        </td>
                    </tr>
            </c:forEach>
            </table>                
            <input type="submit" value="Grade All">
            <a href="assgndwnld.jsp" ><input type="button" value="Download All Files"></a>
            </form>
            
        </div>
    </body>
</html>
