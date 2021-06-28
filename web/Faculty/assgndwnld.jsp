<%-- 
    Document   : assgndwnld
    Created on : 29-Apr-2021, 12:35:19 am
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment Download</title>
    </head>
    <body>
        <%@page import="pack1.Utilities.AssignmentDao"%>
        <%@page import="pack1.bean.Assignment"%>
        <%@page import="java.util.*"%>
        <%@page import="java.io.BufferedOutputStream"%>
        <%@page import="java.util.zip.*"%>
        <%@page import="java.io.*"%>
        <%@ page trimDirectiveWhitespaces="true" %>
        <h2>Downloading...</h2>
        <%
//                public static int downloadZip(List<Assignment> list){
                List<Assignment> list=(List)session.getAttribute("assgnList");
                int DEFAULT_BUFFER_SIZE = 2048;
                response.setContentType("application/zip");
                response.setHeader("Content-Disposition", "attachment; filename=\"allassgns.zip\"");
                int status=0;
                ZipOutputStream output = null;
                byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
                try{
                    output = new ZipOutputStream(new BufferedOutputStream(response.getOutputStream(), DEFAULT_BUFFER_SIZE));

                    for (Assignment a : list)
                    {
                        InputStream input = null;
                        try {
//                              input = new BufferedInputStream(a.getFile(), DEFAULT_BUFFER_SIZE);
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
                }catch(Exception e){System.out.println("Sabse bekaar error!!"+e);}
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
