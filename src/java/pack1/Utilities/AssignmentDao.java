/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack1.Utilities;
import java.sql.*;
import pack1.bean.Assignment;
import java.util.*;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import java.io.*;
import javax.servlet.http.Part;

/**
 *
 * @author POOJA KAULGUD
 */
@MultipartConfig(maxFileSize = 16177215)
public class AssignmentDao {
    public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms","root","");
	}catch(Exception e){System.out.println("Error In DB connection!!!"+e);}
	return con;
}
    public static int upload(Assignment u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into assignment (subject,stu_id,file,filename,grade,fac_id) values(?,?,?,?,?,?)");
		ps.setString(1,u.getSubject());
		ps.setInt(2,u.getStuId());
		ps.setBlob(3,u.getFile());
		ps.setString(4,u.getFilename());
		ps.setString(5,u.getGrade());
                ps.setInt(6,u.getFacId());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Uploading Error!!!"+e);}
	return status;
    }
    
    public static int update(Assignment u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update assignment set grade=?,fac_id=? where filename=? and stu_id=?");
		ps.setString(1,u.getGrade());
		ps.setInt(2,u.getFacId());
		ps.setString(3,u.getFilename());
		ps.setInt(4,u.getStuId());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Updating Error!!!"+e);}
	return status;
    }
    
    public static int delete(int id){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("delete from faculty where id=?");
		ps.setInt(1,id);
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Deleting Error!!!"+e);}

	return status;
    } 
    
    
    public static InputStream partToIS(Part filePart){
        int status=0;
        InputStream file = null;
	try{         
            // obtains the upload file part in this multipart request            
            if (filePart != null) {
            // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());             
                // obtains input stream of the upload file
                file = filePart.getInputStream();                
            }
        }catch(Exception e){System.out.println("Convert error!!!"+e);}
        
        return file;
    }
    
    public static List<Assignment> getAllRecords(String subject){
	List<Assignment> list=new ArrayList<Assignment>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from assignment where subject=?");
                ps.setString(1,subject);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String grade,filename;
                        int stu_id,fac_id;
                        Blob blob;
                        stu_id=rs.getInt(2);
                        blob=rs.getBlob(3);
                        filename=rs.getString(4);
                        grade=rs.getString(5); 
                        fac_id=rs.getInt(6);
                        InputStream file = blob.getBinaryStream();
                        
			Assignment u=new Assignment(subject,stu_id,file,filename,grade,fac_id);
			list.add(u);
		}
	}catch(Exception e){System.out.println("New error"+e);}
	return list;
    }
    
    public static List<Assignment> getAllRecordsById(int stu_id){
	List<Assignment> list=new ArrayList<Assignment>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from assignment where stu_id=?");
                ps.setInt(1,stu_id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String grade,filename,subject;
                        int fac_id;
                        Blob blob;
                        subject=rs.getString(1);
                        stu_id=rs.getInt(2);
                        blob=rs.getBlob(3);
                        filename=rs.getString(4);
                        grade=rs.getString(5); 
                        fac_id=rs.getInt(6);
                        InputStream file = blob.getBinaryStream();
                        
			Assignment u=new Assignment(subject,stu_id,file,filename,grade,fac_id);
			list.add(u);
		}
	}catch(Exception e){System.out.println("New error"+e);}
	return list;
    }
    
}

