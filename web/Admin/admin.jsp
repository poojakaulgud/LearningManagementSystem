<%-- 
    Document   : admin
    Created on : 21-Apr-2021, 8:09:30 pm
    Author     : POOJA KAULGUD
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../Styles/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        <title>Admin Page</title>
    </head>
    <body>
        <h1>
            <i class="fas fa-university" style="float:left;font-size:45px;"> LMS</i>
            <span style="margin-right:4%">Hello Admin!</span>
            <a href="../index.html"><input type="button" value="Logout" class="logout" style="float:right;"></a>
        </h1>
        <div align="center" style="margin:0 auto;width:70%">
            <div style="border:2px solid black;padding:2%;">
                <h3> Faculty Administration </h3>
                <a href="faculty/facultyprofileadmin.html" ><input type="button" value="Edit Faculty Profiles"></a><br><br>
                <a href="faculty/viewfaculty.jsp"><input type="button" value="View Faculty Profiles"></a>
            </div>
            <br><br>
            <div style="border:2px solid black;padding:2%;">
                <h3> Student Administration </h3>
                <a href="student/studentprofileadmin.html"><input type="button" value="Edit Student Profiles"></a><br><br>
                <a href="student/viewstudent.jsp"><input type="button" value="View Student Profiles"></a>
            </div>
        </div>
        
        <footer>
            <div align="center">
                Made with ♥ by, 
                Pooja & Chaitanya.
            </div>
            <div>
                Email us:
                <a href="mailto:pooja.kaulgud@somaiya.edu">Pooja</a>
                <a href="mailto:c.bandiwdekar@somaiya.edu">Chaitanya</a>
            </div>
            <div>
                <div>© <span id="year"></span>
                    <script>
                        var d = new Date();
                        var n = d.getFullYear();
                        document.getElementById("year").innerHTML = n;
                    </script>
                    Copyright. All Rights Reserved.
                  </div>
                <div class="footer-icons">
                  <i class="fab fa-twitter"></i>
                  <i class="fab fa-facebook"></i>
                  <i class="fas fa-envelope"></i>
                </div>
            </div>             
            
        </footer>
    </body>
</html>
