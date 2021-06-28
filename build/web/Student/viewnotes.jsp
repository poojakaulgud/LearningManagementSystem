<%-- 
    Document   : viewnotes
    Created on : 30-Apr-2021, 8:27:34 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Styles/style.css">
        <title>View notes</title>
    </head>
    <body>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.bean.Student"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page import="pack1.Utilities.NotesDao"%>
        <%@page import="pack1.bean.Notes"%>
        <%@page import="java.util.*"%>
        <%
            String subject=request.getParameter("subject");
            List<Notes> list=NotesDao.getAllRecords(subject);
            request.setAttribute("list",list);
            session.setAttribute("notesList",list);
        %>
        
        <h1>My Notes</h1>
        <table border="1" width="100%" style="text-align:center">
                <tr>
                    <th>Subject</th>
                    <th>Notes</th>
                </tr>
                <c:forEach items="${list}" var="u">
                    <tr>
                        <td>${u.getSubject()}</td>
                        <td>${u.getFilename()}</td>
                    </tr>
            </c:forEach>
            </table>
            <div align="center"><a href="notesdwnld.jsp" ><input type="button" value="Download All Files"></a></div>
    </body>
</html>
