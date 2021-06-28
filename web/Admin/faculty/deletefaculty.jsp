<%-- 
    Document   : deletefaculty
    Created on : 28-Apr-2021, 2:50:38 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../Styles/style.css">
        <title>Delete Faculty</title>
    </head>
    <body>
        <h1>Deleting Logs</h1>
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.bean.Faculty"%>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String flag;
        %>
        <%  
            int i=FacultyDao.delete(id);  
            if(i>0){  
            //response.sendRedirect("adduser-success.jsp");
            flag="Faculty Deleted Successfully!";
                System.out.println("Faculty Deleted Successfully!");
            }else{  
            //response.sendRedirect("adduser-error.jsp");
            flag="Faculty Deleting Failed!";
                System.out.println("Faculty Deleting Failed!");
            }  
        %>  
        <h2><%=flag%></h2>
        <a href="viewfaculty.jsp"><input type="button" value="View Faculty"></a>
    </body>
</html>
