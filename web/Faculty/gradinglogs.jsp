<%-- 
    Document   : gradinglogs
    Created on : 29-Apr-2021, 4:33:57 pm
    Author     : POOJA KAULGUD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grading Logs</title>
    </head>
    <body>
        <h1>Grading Logs</h1>
        <%@page import="pack1.Utilities.AssignmentDao"%>
        <%@page import="pack1.bean.Assignment"%>
        <%@page import="java.util.*"%>
        <%@page import="pack1.Utilities.FacultyDao"%>
        <%@page import="pack1.bean.Faculty"%>
        <%
             String uname = (String)session.getAttribute("userName");
             Faculty f=FacultyDao.getRecordByUname(uname);
             int fac_id=f.getId();
             List <Assignment> list=(List)session.getAttribute("assgnList");
        %>
        <%
           String[] grades=request.getParameterValues("grade");
           String flag="Error in uploading grade!";
            int j=0;
            try{
                for(int i=0;i<list.size();i++)
                {
                    String grade=grades[i];
                    Assignment a = list.get(i);
                    a.setGrade(grade);
                    a.setFacId(fac_id);
                    j=AssignmentDao.update(a);  
                    if(j>0){
                        flag="Faculty Updated Successfully!";
                        System.out.println("Faculty Updated Successfully!");
                    }
                    else{
                        flag="Faculty Updating Failed!";
                        System.out.println("Faculty Updating Failed!");
                    }  
                }
            }catch(Exception e){System.out.println("Error List: "+e);}
            
        %>
        
        <h2><%=flag%></h2>
        <% 
            if(j>0){
                response.sendRedirect("faculty.jsp");
            }
            else{
                //incorrect
            }
        %>
        <a href="grading.jsp"><input type="button" value="View Grades"></a>
    </body>
</html>
