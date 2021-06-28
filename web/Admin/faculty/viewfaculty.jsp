<%-- 
    Document   : viewfaculty
    Created on : 28-Apr-2021, 2:52:50 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../Styles/style.css">
        <title>View Faculty</title>
    </head>
    <body>
        <h1>Faculty List</h1>
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.bean.Faculty"%>
        <%@page import="java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%
            List<Faculty> list=FacultyDao.getAllRecords();
            request.setAttribute("list",list);
        %>

        <table border="1" width="100%">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Branch</th>
            <th>Gender</th>
            <th>Date of Birth</th>
            <th>Email</th>
            <th>Contact</th>
        </tr>
            <c:forEach items="${list}" var="u">
                    <tr>
                        <td>${u.getId()}</td>
                        <td>${u.getUname()}</td>
                        <td>${u.getPass()}</td>
                        <td>${u.getFname()}</td>
                        <td>${u.getLname()}</td>
                        <td>${u.getBranch()}</td>
                        <td>${u.getGender()}</td>
                        <td>${u.getDob()}</td>
                        <td>${u.getEmail()}</td>
                        <td>${u.getContact()}</td>
                    </tr>
            </c:forEach>
            </table>
            <div align="center"><br/><a href="facultyprofileadmin.html"><input type="button" value="Edit Faculty Profiles"></a></div>
    </body>
</html>
