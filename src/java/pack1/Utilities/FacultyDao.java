/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack1.Utilities;
import java.sql.*;
import pack1.bean.Faculty;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author POOJA KAULGUD
 */
public class FacultyDao {
    public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms","root","");
	}catch(Exception e){System.out.println("Error In DB connection!!!"+e);}
	return con;
}
    public static int add(Faculty u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into faculty (id,uname,pass,fname,lname,branch,gender,dob,email,contact) values(?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1,u.getId());
		ps.setString(2,u.getUname());
		ps.setString(3,u.getPass());
		ps.setString(4,u.getFname());
                ps.setString(5,u.getLname());
                ps.setString(6,u.getBranch());
                ps.setString(7,u.getGender());
                ps.setString(8,u.getDob());
                ps.setString(9,u.getEmail());
                ps.setString(10,u.getContact());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Adding Error!!!"+e);}
	return status;
    }
    
    public static int update(Faculty u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update faculty set uname=?,pass=?,fname=?,lname=?,branch=?,gender=?,dob=?,email=?,contact=? where id=?");
		ps.setString(1,u.getUname());
		ps.setString(2,u.getPass());
		ps.setString(3,u.getFname());
                ps.setString(4,u.getLname());
                ps.setString(5,u.getBranch());
                ps.setString(6,u.getGender());
                ps.setString(7,u.getDob());
                ps.setString(8,u.getEmail());
                ps.setString(9,u.getContact());
                ps.setInt(10,u.getId());
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
    
    public static List<Faculty> getAllRecords(){
	List<Faculty> list=new ArrayList<Faculty>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from faculty");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String uname,pass,fname,lname,branch,gender,dob,email,contact;
                        int id;
                        id=rs.getInt(1);
                        uname=rs.getString(2);                        
                        pass=rs.getString(3);                        
                        fname=rs.getString(4);                        
                        lname=rs.getString(5);                        
                        branch=rs.getString(6);                 
                        gender=rs.getString(7);                        
                        dob=rs.getString(8);                        
                        email=rs.getString(9);                        
                        contact=rs.getString(10);
			Faculty u=new Faculty(id,uname,pass,fname,lname,branch,gender,dob,email,contact);
			list.add(u);
		}
	}catch(Exception e){System.out.println("New error"+e);}
	return list;
    }
    
    
    
    public static Faculty getRecordByUname(String uname){
	Faculty u=null;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from faculty where uname=?");
		ps.setString(1,uname);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String pass,fname,lname,branch,gender,dob,email,contact;
                        int id;
                        id=rs.getInt(1);
                        uname=rs.getString(2);                        
                        pass=rs.getString(3);                        
                        fname=rs.getString(4);                        
                        lname=rs.getString(5);                        
                        branch=rs.getString(6);                 
                        gender=rs.getString(7);                        
                        dob=rs.getString(8);                        
                        email=rs.getString(9);                        
                        contact=rs.getString(10);
			u=new Faculty(id,uname,pass,fname,lname,branch,gender,dob,email,contact);			
		}
	}catch(Exception e){System.out.println(e);}
	return u;
    }
}

