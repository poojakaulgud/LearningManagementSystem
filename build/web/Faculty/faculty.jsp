<%-- 
    Document   : faculty
    Created on : 21-Apr-2021, 8:10:05 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Styles/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        
        <title>Faculty Page</title>
    </head>
    <body>
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.bean.Faculty"%>
         <%
             String uname = (String)session.getAttribute("userName");
             Faculty f=FacultyDao.getRecordByUname(uname);
         %>
            <div align="center">
                <h1>
                    <i class="fas fa-university" style="float:left;font-size:45px;"> LMS</i>
                    <span style="margin-right:2.5%">Hello <%=f.getFname()%> !</span>
                    <a href="../index.html"><input type="button" value="Logout" class="logout" style="float:right;"></a>
                </h1>
                <i class="far fa-user-circle" style="font-size:100px;"></i><br><br>
                <a href="editfacultyprofile.html"><input type="button" value="Edit Profile"></a>
                <a href="viewfacultyprofile.jsp"><input type="button" value="View Profile"></a><br><br>
                <a href="notesupload.html"><input type="button" value="Upload Notes"></a>
            </div><br><br>
            <div align="center" style="background-color:rgb(205,133,63);">
                <br><h2>Grade Assignments</h2><br>
                <form action="grading.jsp" method="post">
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
                            <input type="submit" value="Grade" style="width:100%">
                        </td>
                    </tr>
                    </table>
                </form><br>
            </div>
            
            
    </body>
</html>
