<%-- 
    Document   : notesupload
    Created on : 30-Apr-2021, 8:09:48 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notes Upload</title>
    </head>
    <body>
        <h1>Uploading Logs</h1>
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.Utilities.NotesDao"%>
        <%@page import="pack1.bean.Faculty"%>
        <%@page import="pack1.bean.Notes"%>
        <%@page import="java.io.InputStream,javax.servlet.http.Part,javax.servlet.annotation.MultipartConfig"%> 
        
        <%  
           String uname = (String)session.getAttribute("userName");
           Faculty f=FacultyDao.getRecordByUname(uname);
           int fac_id=f.getId();
           String subject=request.getParameter("subject");
           String flag="Uploading Error!!";
           Part filePart = request.getPart("notes");
           String filename=request.getParameter("filename");
           InputStream file=NotesDao.partToIS(filePart);
            
            Notes a = new Notes(fac_id,file,filename,subject);
        %>
        
        <%  
            int i=NotesDao.upload(a);  
            if(i>0){  
            //response.sendRedirect("adduser-success.jsp");
            flag="Notes Updloaded Successfully!";
                System.out.println("Notes Updloaded Successfully!");
            }else{  
            //response.sendRedirect("adduser-error.jsp");
            flag="Notes Updloading Failed!";
                System.out.println("Notes Updloading Failed!");
            }  
        %>  
        <h2><%=flag%></h2>
        <% 
            if(i>0){
                response.sendRedirect("faculty.jsp");
            }
            else{
                //incorrect
            }
        %>
        
    </body>
</html>
