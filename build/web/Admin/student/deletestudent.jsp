<%-- 
    Document   : deletestudent
    Created on : 28-Apr-2021, 1:39:18 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../Styles/style.css">
        <title>Delete Student</title>
    </head>
    <body>
        <h1>Deleting Logs</h1>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.bean.Student"%>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String flag;
        %>
        <%  
            int i=StudentDao.delete(id);  
            if(i>0){  
            //response.sendRedirect("adduser-success.jsp");
            flag="Student Deleted Successfully!";
                System.out.println("Student Deleted Successfully!");
            }else{  
            //response.sendRedirect("adduser-error.jsp");
            flag="Student Deleting Failed!";
                System.out.println("Student Deleting Failed!");
            }  
        %>  
        <h2><%=flag%></h2>
        <a href="viewstudent.jsp"><input type="button" value="View Students"></a>
    </body>
</html>
