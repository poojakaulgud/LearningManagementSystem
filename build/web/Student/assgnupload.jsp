<%-- 
    Document   : assgnupload
    Created on : 28-Apr-2021, 8:22:04 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment Upload</title>
    </head>
    <body>
        <h1>Uploading Logs</h1>
        <%@page import="pack1.Utilities.StudentDao"%>
        <%@page import="pack1.Utilities.AssignmentDao"%>
        <%@page import="pack1.bean.Student"%>
        <%@page import="pack1.bean.Assignment"%>
        <%@page import="java.io.InputStream,javax.servlet.http.Part,javax.servlet.annotation.MultipartConfig"%>        
        
        <%  
           String uname = (String)session.getAttribute("userName");
           Student s=StudentDao.getRecordByUname(uname);
           int stu_id=s.getId();
           String subject=request.getParameter("subject");
           String flag="Uploading Error!!";
           Part filePart = request.getPart("assgn");
           String filename=request.getParameter("filename");
           InputStream file=AssignmentDao.partToIS(filePart);
            
            Assignment a = new Assignment(subject,stu_id,file,filename,"-",-1);
        %>
        
        <%  
            int i=AssignmentDao.upload(a);  
            if(i>0){  
            //response.sendRedirect("adduser-success.jsp");
            flag="Assignment Updloaded Successfully!";
                System.out.println("Assignment Updloaded Successfully!");
            }else{  
            //response.sendRedirect("adduser-error.jsp");
            flag="Assignment Updloading Failed!";
                System.out.println("Assignment Updloading Failed!");
            }  
        %>  
        <h2><%=flag%></h2>
        <% 
            if(i>0){
                response.sendRedirect("student.jsp");
            }
            else{
                //incorrect
            }
        %>
        <a href="viewassgn.jsp"><input type="button" value="View Assignments"></a>
    </body>
</html>
