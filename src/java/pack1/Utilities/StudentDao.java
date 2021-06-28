/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack1.Utilities;
import java.sql.*;
import pack1.bean.Student;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author POOJA KAULGUD
 */
public class StudentDao {
    public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms","root","");
	}catch(Exception e){System.out.println("Error In DB connection!!!"+e);}
	return con;
}
    public static int add(Student u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into student (id,uname,pass,fname,lname,branch,sem,gender,dob,email,contact) values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1,u.getId());
		ps.setString(2,u.getUname());
		ps.setString(3,u.getPass());
		ps.setString(4,u.getFname());
                ps.setString(5,u.getLname());
                ps.setString(6,u.getBranch());
                ps.setInt(7,u.getSem());
                ps.setString(8,u.getGender());
                ps.setString(9,u.getDob());
                ps.setString(10,u.getEmail());
                ps.setString(11,u.getContact());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Adding Error!!!"+e);}
	return status;
    }
    
    public static int update(Student u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update student set uname=?,pass=?,fname=?,lname=?,branch=?,sem=?,gender=?,dob=?,email=?,contact=? where id=?");
		ps.setString(1,u.getUname());
		ps.setString(2,u.getPass());
		ps.setString(3,u.getFname());
                ps.setString(4,u.getLname());
                ps.setString(5,u.getBranch());
                ps.setInt(6,u.getSem());
                ps.setString(7,u.getGender());
                ps.setString(8,u.getDob());
                ps.setString(9,u.getEmail());
                ps.setString(10,u.getContact());
                ps.setInt(11,u.getId());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Updating Error!!!"+e);}
	return status;
    }
    
    public static int delete(int id){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("delete from student where id=?");
		ps.setInt(1,id);
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Deleting Error!!!"+e);}

	return status;
    } 
    
    public static List<Student> getAllRecords(){
	List<Student> list=new ArrayList<Student>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from student");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String uname,pass,fname,lname,branch,gender,dob,email,contact;
                        int id,sem;
                        id=rs.getInt(1);
                        uname=rs.getString(2);                        
                        pass=rs.getString(3);                        
                        fname=rs.getString(4);                        
                        lname=rs.getString(5);                        
                        branch=rs.getString(6);                        
                        sem=rs.getInt(7);                        
                        gender=rs.getString(8);                        
                        dob=rs.getString(9);                        
                        email=rs.getString(10);                        
                        contact=rs.getString(11);
			Student u=new Student(id,uname,pass,fname,lname,branch,sem,gender,dob,email,contact);
			list.add(u);
		}
	}catch(Exception e){System.out.println("New error"+e);}
	return list;
    }
    
    public static Student getRecordByUname(String uname){
	Student u=null;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from student where uname=?");
		ps.setString(1,uname);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String pass,fname,lname,branch,gender,dob,email,contact;
                        int id,sem;
                        id=rs.getInt(1);
                        uname=rs.getString(2);                        
                        pass=rs.getString(3);                        
                        fname=rs.getString(4);                        
                        lname=rs.getString(5);                        
                        branch=rs.getString(6);                        
                        sem=rs.getInt(7);                        
                        gender=rs.getString(8);                        
                        dob=rs.getString(9);                        
                        email=rs.getString(10);                        
                        contact=rs.getString(11);
			u=new Student(id,uname,pass,fname,lname,branch,sem,gender,dob,email,contact);			
		}
	}catch(Exception e){System.out.println(e);}
	return u;
    }
}

