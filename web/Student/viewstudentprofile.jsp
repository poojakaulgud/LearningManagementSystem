<%-- 
    Document   : viewstudentprofile
    Created on : 28-Apr-2021, 3:38:48 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Styles/style.css">        
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        
        <title>My Profile</title>
    </head>
    <body>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.bean.Student"%>
         <%
             String uname = (String)session.getAttribute("userName");
             Student s=StudentDao.getRecordByUname(uname);
         %>
        <h1><%=s.getFname()%>'s Profile!</h1>
        
        
        
        <div align="center">
            <i class="fas fa-user" style="font-size:100px;"></i>
        <table border="1" bordercolor="brown" style="width:30%;font-size:20px">
            <tr>
                <td>ID:</td>
                <td><%=s.getId()%></td>
            </tr>
            <tr>
                <td>Username:</td>
                <td><%=s.getUname()%></td>
            </tr>
            <tr>
                <td>First Name:</td>
                <td><%=s.getFname()%></td>
            </tr>            
            <tr>
                <td>Last Name:</td>
                <td><%=s.getLname()%></td>
            </tr>                        
            <tr>
                <td>Branch:</td>
                <td><%=s.getBranch()%></td>
            </tr>            
            <tr>
                <td>Semester:</td>
                <td><%=s.getSem()%></td>
            </tr>            
            <tr>
                <td>Gender:</td>
                <td><%=s.getGender()%></td>
            </tr>            
            <tr>
                <td>Date of Birth:</td>
                <td><%=s.getDob()%></td>
            </tr>            
            <tr>
                <td>Email:</td>
                <td><%=s.getEmail()%></td>
            </tr>            
            <tr>
                <td>Contact:</td>
                <td><%=s.getContact()%></td>
            </tr>
        </table>
        <br/><a href="editstudentprofile.html"><input type="button" value="Edit Student Profile"></a>
        </div>
    </body>
</html>
