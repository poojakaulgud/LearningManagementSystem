/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack1.Utilities;
import java.sql.*;
import pack1.bean.User;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author POOJA KAULGUD
 */
public class UserDao {
    public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lms","root","");
	}catch(Exception e){System.out.println("Error In DB connection!!!"+e);}
	return con;
}
    public static int add(User u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into users (u_dsgn,u_id,u_name,u_pass) values(?,?,?,?)");
		ps.setString(1,u.getDsgn());
		ps.setInt(2,u.getId());
		ps.setString(3,u.getName());
		ps.setString(4,u.getPass());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Adding Error!!!"+e);}
	return status;
    }
    
    public static int update(User u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update users set u_dsgn=?,u_name=?,u_pass=? where u_id=?");
		ps.setString(1,u.getDsgn());
		ps.setString(2,u.getName());
		ps.setString(3,u.getPass());
		ps.setInt(4,u.getId());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Updating Error!!!"+e);}
	return status;
    }
    
    public static int delete(int id){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("delete from users where u_id=?");
		ps.setInt(1,id);
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println("Deleting Error!!!"+e);}

	return status;
    }       
    
    
    public static List<User> getAllRecords(){
	List<User> list=new ArrayList<User>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from users");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String name,dsgn,pass;
                        int id;
                        dsgn=rs.getString(1);
                        id=rs.getInt(2);
                        name=rs.getString(3);                        
                        pass=rs.getString(4);
			User u=new User(dsgn,id,name,pass);
			list.add(u);
		}
	}catch(Exception e){System.out.println("New error"+e);}
	return list;
    }
    
    public static User getRecordById(int id){
	User u=null;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from users where u_id=?");
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
                        String name,dsgn,pass;
                        dsgn=rs.getString(1);
                        id=rs.getInt(2);
                        name=rs.getString(3);                        
                        pass=rs.getString(4);
			u=new User(dsgn,id,name,pass);
			
		}
	}catch(Exception e){System.out.println(e);}
	return u;
    }
    /**
     * @param args the command line arguments
     */
//    public static void main(String args[]) {
//        // TODO code application logic here
//    }
}

