<%-- 
    Document   : viewstudent
    Created on : 28-Apr-2021, 1:46:49 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../Styles/style.css">
        <title>View Students</title>
    </head>
    <body>
        <h1>Student List</h1>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.bean.Student"%>
        <%@page import="java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%
            List<Student> list=StudentDao.getAllRecords();
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
            <th>Semester</th>
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
                        <td>${u.getSem()}</td>
                        <td>${u.getGender()}</td>
                        <td>${u.getDob()}</td>
                        <td>${u.getEmail()}</td>
                        <td>${u.getContact()}</td>
                    </tr>
            </c:forEach>
            </table>
            <div align="center"><br/><a href="studentprofileadmin.html"><input type="button" value="Edit Student Profiles" ></a></div>
    </body>
</html>
