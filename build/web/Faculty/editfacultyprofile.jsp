<%-- 
    Document   : editfacultyprofile
    Created on : 28-Apr-2021, 7:55:43 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Styles/style.css">
        <title>Edit Profile</title>
    </head>
    <body>
        <h1>Editing Logs</h1>
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.bean.Faculty"%>
        <%  
           String uname = (String)session.getAttribute("userName");
           Faculty s=FacultyDao.getRecordByUname(uname);
           int id=s.getId();
           String pass = s.getPass();
           String fname = request.getParameter("fname");
           String lname = request.getParameter("lname");
           String branch = request.getParameter("branch");
           String gender = request.getParameter("gender");
           String dob = request.getParameter("dob");
           String email = request.getParameter("email");
           String contact = request.getParameter("contact");
           String flag;
           
           Faculty u=new Faculty(id,uname,pass,fname,lname,branch,gender,dob,email,contact);           
//           User u=UserDao.getRecordById(Integer.parseInt(id));           
        %>
        <%  
            int i=FacultyDao.update(u);  
            if(i>0){  
            //response.sendRedirect("adduser-success.jsp");
            flag="Faculty Updated Successfully!";
                System.out.println("Faculty Updated Successfully!");
            }else{  
            //response.sendRedirect("adduser-error.jsp");
            flag="Faculty Updating Failed!";
                System.out.println("Faculty Updating Failed!");
            }  
        %>  
        <h2><%=flag%></h2>
        <% 
            if(i>0){
                response.sendRedirect("viewfacultyprofile.jsp");
            }
            else{
                //incorrect
            }
        %>
        <a href="viewfacultyprofile.jsp"><input type="button" value="View Faculty"></a>
    </body>
</html>
