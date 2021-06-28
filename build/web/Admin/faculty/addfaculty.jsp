<%-- 
    Document   : addfaculty
    Created on : 28-Apr-2021, 2:38:17 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../Styles/style.css">
        <title>Add Faculty</title>
    </head>
    <body>
        <h1>Adding Logs</h1>
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.bean.Faculty"%>
        <%
           int id = Integer.parseInt(request.getParameter("id"));
           String uname = request.getParameter("uname");
           String pass = request.getParameter("pass");
           String fname = request.getParameter("fname");
           String lname = request.getParameter("lname");
           String branch = request.getParameter("branch");
           String gender = request.getParameter("gender");
           String dob = request.getParameter("dob");
           String email = request.getParameter("email");
           String contact = request.getParameter("contact");
           String flag;
           
           Faculty u=new Faculty(id,uname,pass,fname,lname,branch,gender,dob,email,contact);
            session.setAttribute("FacultyInfo",u);           
        %>
        <%  
            int i=FacultyDao.add(u);  
            if(i>0){  
            //response.sendRedirect("adduser-success.jsp");
            flag="Faculty Added Successfully!";
                System.out.println("Faculty Added Successfully!");
                response.sendRedirect("sendfacultymail.jsp");
            }else{  
            //response.sendRedirect("adduser-error.jsp");
            flag="Faculty Adding Failed!";
                System.out.println("Faculty Adding Failed!");
            }  
        %>  
        <h2><%=flag%></h2>
        <a href="viewfaculty.jsp"><input type="button" value="View Faculty"></a>
    </body>
</html>
