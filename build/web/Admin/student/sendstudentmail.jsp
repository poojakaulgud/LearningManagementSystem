<%-- 
    Document   : sendmai
    Created on : 01-May-2021, 3:30:52 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../Styles/style.css">
        <title>send mail</title>
    </head>
    <body>
        <h1>Mail Sending Logs</h1>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.bean.Student"%>
        <%@page import="pack1.bean.SendMail"%>
        <%
            Student s=(Student) session.getAttribute("StudentInfo");
            
        %>
        
        <%
                String host;
                String port;
                String user;
                String pass;
                    // reads SMTP server setting from web.xml file
                    ServletContext context = getServletContext();
                    host = context.getInitParameter("host");
                    port = context.getInitParameter("port");
                    user = context.getInitParameter("user");
                    pass = context.getInitParameter("pass");
            
            String recipient = s.getEmail();
            String subject = "Your Profile has been created on LMS!";
            String content = "Welcome to the College!"+"\nPlease use the following details for login."+"\nUsername: "+s.getUname()+"\nPassword: "+s.getPass();

            String resultMessage = "";

            try {
               SendMail.sendMail(host, port, user, pass, recipient, subject, content);
                resultMessage = "The e-mail was sent successfully";
            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "There were an error: " + ex.getMessage();
            } 
        %>
        
        <h2><%=resultMessage%></h2>
    </body>
</html>
