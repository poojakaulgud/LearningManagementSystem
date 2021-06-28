<%-- 
    Document   : updatestudent
    Created on : 28-Apr-2021, 1:25:03 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../Styles/style.css">
        <title>Update Student</title>
    </head>
    <body>
        <h1>Updating Logs</h1>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.bean.Student"%>
        <% 
           int id = Integer.parseInt(request.getParameter("id"));
           String uname = request.getParameter("uname");
           String pass = request.getParameter("pass");
           String fname = request.getParameter("fname");
           String lname = request.getParameter("lname");
           String branch = request.getParameter("branch");
           int sem = Integer.parseInt(request.getParameter("sem"));
           String gender = request.getParameter("gender");
           String dob = request.getParameter("dob");
           String email = request.getParameter("email");
           String contact = request.getParameter("contact");
           String flag;
           
           Student u=new Student(id,uname,pass,fname,lname,branch,sem,gender,dob,email,contact);           
//           User u=UserDao.getRecordById(Integer.parseInt(id));           
        %>
        <%  
            int i=StudentDao.update(u);  
            if(i>0){  
            //response.sendRedirect("adduser-success.jsp");
            flag="Student Updated Successfully!";
                System.out.println("Student Updated Successfully!");
            }else{  
            //response.sendRedirect("adduser-error.jsp");
            flag="Student Updating Failed!";
                System.out.println("Student Updating Failed!");
            }  
        %>  
        <h2><%=flag%></h2>
        <a href="viewstudent.jsp"><input type="button" value="View Students"></a>
    </body>
</html>
