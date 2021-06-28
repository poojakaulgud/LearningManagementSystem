<%-- 
    Document   : student
    Created on : 28-Apr-2021, 3:14:33 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Styles/style.css">
        
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        <title>Student Page</title>
    </head>
     <body>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.bean.Student"%>
         <%
             String uname = (String)session.getAttribute("userName");
             Student s=StudentDao.getRecordByUname(uname);
         %>
            <div align="center">
                <h1>
                    <i class="fas fa-university" style="float:left;font-size:45px;"> LMS</i>
                    <span style="margin-right:2.5%">Hello <%=s.getFname()%> !</span>
                    <a href="../index.html"><input type="button" value="Logout" class="logout" style="float:right;"></a>
                </h1>
                <i class="far fa-user-circle" style="font-size:100px;"></i><br><br>
                <a href="editstudentprofile.html"><input type="button" value="Edit Profile"></a>
                <a href="viewstudentprofile.jsp"><input type="button" value="View Profile"></a><br><br>
                <a href="assgnupload.html"><input type="button" value="Upload Assignments"></a>
                <a href="viewassgn.jsp"><input type="button" value="View My Assignments"></a><br><br>
            </div>    
            <div align="center" style="background-color:rgb(205,133,63);">
                <br><h2>View Notes</h2><br>
                <form action="viewnotes.jsp" method="post">
                    <table>
                    <tr>
                        <td>Select Subjects:</td>
                        <td>
                            <select id="subject" name="subject" style="width:100%">
                                <option value="Maths">Maths</option>
                                <option value="Chem">Chem</option>
                                <option value="Phy">Phy</option>
                                <option value="EEEE">EEEE</option>
                                <option value="ED">ED</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="View Notes" style="width:100%">
                        </td>
                    </tr>
                    </table>
                </form><br>
            </div>
                    
            
    </body>
</html>
