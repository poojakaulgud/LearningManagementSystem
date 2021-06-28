<%-- 
    Document   : sendfacutymail
    Created on : 01-May-2021, 4:21:22 pm
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
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.bean.Faculty"%>
        <%@page import="pack1.bean.SendMail"%>
        <%
            Faculty f=(Faculty) session.getAttribute("FacultyInfo");
            
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
            
            String recipient = f.getEmail();
            String subject = "Your Profile has been created on LMS!";
            String content = "Welcome to the College!"+"\nPlease use the following details for login."+"\nUsername: "+f.getUname()+"\nPassword: "+f.getPass();

            String resultMessage = "";

            try {
               SendMail.sendMail(host, port, user, pass, recipient, subject, content);
                resultMessage = "The e-mail was sent successfully";
            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "There were an error: " + ex.getMessage();
            } 
        %>
        <h1>Mail Sending Logs</h1>
        <h2><%=resultMessage%></h2>
    </body>
</html>
