/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack1.Utilities;
import java.sql.*;
import pack1.bean.Notes;
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
public class NotesDao {
    public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms","root","");
	}catch(Exception e){System.out.println("Error In DB connection!!!"+e);}
	return con;
}
    public static int upload(Notes u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into notes (fac_id,file,filename,subject) values(?,?,?,?)");
		ps.setInt(1,u.getFacId());
		ps.setBlob(2,u.getFile());
		ps.setString(3,u.getFilename());
                ps.setString(4,u.getSubject());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Uploading Error!!!"+e);}
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
    
    public static List<Notes> getAllRecords(String subject){
	List<Notes> list=new ArrayList<Notes>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from notes where subject=?");
                ps.setString(1,subject);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String filename;
                        int fac_id;
                        Blob blob;
                        fac_id=rs.getInt(1);
                        blob=rs.getBlob(2);
                        filename=rs.getString(3);
                        InputStream file = blob.getBinaryStream();
                        
			Notes u=new Notes(fac_id,file,filename,subject);
			list.add(u);
		}
	}catch(Exception e){System.out.println("New error"+e);}
	return list;
    }
    
    
}

