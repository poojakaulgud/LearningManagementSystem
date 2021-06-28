<%-- 
    Document   : notesdwnld
    Created on : 30-Apr-2021, 8:34:18 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notes Download</title>
    </head>
    <body>
        <%@page import="pack1.Utilities.NotesDao"%>
        <%@page import="pack1.bean.Notes"%>
        <%@page import="java.util.*"%>
        <%@page import="java.io.BufferedOutputStream"%>
        <%@page import="java.util.zip.*"%>
        <%@page import="java.io.*"%>
        <%@ page trimDirectiveWhitespaces="true" %>
        <h2>Downloading...</h2>
        <%
            List<Notes> list=(List)session.getAttribute("notesList");
                int DEFAULT_BUFFER_SIZE = 2048;
                response.setContentType("application/zip");
                response.setHeader("Content-Disposition", "attachment; filename=\"allnotes.zip\"");
                int status=0;
                ZipOutputStream output = null;
                byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
                try{
                    output = new ZipOutputStream(new BufferedOutputStream(response.getOutputStream(), DEFAULT_BUFFER_SIZE));

                    for (Notes a : list)
                    {
                        InputStream input = null;
                        try {
                                input=a.getFile();
                                output.putNextEntry(new ZipEntry(a.getFilename()));                                
                                for (int length = 0; (length = input.read(buffer)) > 0;)
                                {
                                    output.write(buffer, 0, length);
                                }
                            }//try
                            catch (Exception e) {e.printStackTrace();}
                            finally{}
                            output.closeEntry();
                    }//for
                }catch(Exception e){System.out.println("Download error!!"+e);}
//                return status;        
//            }
                output.flush();
                output.close();
        %>
        <%
            
//            int i=AssignmentDao.downloadZip(list);
        %>
        
    </body>
</html>
