<%-- 
    Document   : loginlogs
    Created on : 28-Apr-2021, 11:47:56 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Styles/style.css">
        <title>Login Logs</title>
    </head>
    <body>
        <h1>Login Logs</h1>
        <%@page import="pack1.Utilities.*"%>
        <%@page import="pack1.bean.*"%>
        <%@page import="pack1.bean.SendMail"%>
        <%
            String dsgn=request.getParameter("dsgn");
            String uname=request.getParameter("u_name");
            String pass=request.getParameter("u_pass");
            session.setAttribute("userName", uname);
            String flag="Login Error! Invalid Username or Password";
            int check=0;
            
            if(dsgn.equals("admin")){
                System.out.println("stage 1");
                if(uname.equals("kjsceadmin")){
                    System.out.println("stage 2");
                    if(pass.equals("admin@42069")){
                        System.out.println("stage 3");
                        flag="Admin Login Successful!";
                        check=1;
                    }
                    else{
                        System.out.println("stage 4");
                        flag="Admin Password Incorrect!";
                    }
                }
                else{
                    System.out.println("stage 5");
                    flag="Admin Username Incorrect!";
                }
            }
            else{
                System.out.println("stage 6");
            }
        %>
        
        <%
            if(dsgn.equals("student")){
                System.out.println("stage 1");
                try{
                    Student s=StudentDao.getRecordByUname(uname);                
                    if(s.getUname().equals(uname)){
                        System.out.println("stage 2");
                        if(s.getPass().equals(pass)){
                            System.out.println("stage 3");
                            flag="Student Login Successful!";
                            check=1;
                        }
                        else{
                            System.out.println("stage 4");
                            flag="Student Password Incorrect!";
                        }
                    }
                    else{
                        System.out.println("stage 5");
                        flag="Student Username Incorrect!";
                    }
                }catch(Exception e){
                }                  
            }
            else{
                System.out.println("stage 6");
            }
        %>
        
        <%
            if(dsgn.equals("faculty")){
                System.out.println("stage 1");
                try{
                    Faculty f=FacultyDao.getRecordByUname(uname);
                    if(f.getUname().equals(uname)){
                        System.out.println("stage 2");
                        if(f.getPass().equals(pass)){
                            System.out.println("stage 3");
                            flag="Faculty Login Successful!";
                            check=1;
                        }
                        else{
                            System.out.println("stage 4");
                            flag="Faculty Password Incorrect!";
                        }
                    }
                    else{
                        System.out.println("stage 5");
                        flag="Faculty Username Incorrect!";
                    }
                }catch(Exception e){
                }
            }
            else{
                System.out.println("stage 6");
            }
        %>
            <h2><%=flag%></h2>
            <%
                if(dsgn.equals("admin") && check==1){
                    response.sendRedirect("Admin/admin.jsp");
                }
                else if(dsgn.equals("student") && check==1){
                    response.sendRedirect("Student/student.jsp");
                }
                else if(dsgn.equals("faculty") && check==1){
                    response.sendRedirect("Faculty/faculty.jsp");
                }
                else{
                    //incorrect
                }
            %>
    </body>
</html>
