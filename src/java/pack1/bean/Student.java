/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack1.bean;
import java.awt.image.*;

/**
 *
 * @author POOJA KAULGUD
 */
public class Student {
     
    private int id,sem;  
    private String uname,pass,fname,lname,branch,gender,dob,email,contact;
    //functions  
    public Student(int id,String uname,String pass,String fname, String lname, String branch,int sem,String gender, String dob, String email, String contact){
         this.id=id;
         this.uname=uname;
         this.fname=fname;
         this.pass=pass;
         this.lname=lname;
         this.branch=branch;
         this.sem=sem;
         this.gender=gender;
         this.dob=dob;
         this.email=email;
         this.contact=contact;
     }
    
    public int getId() {
	return id;
    }
    public String getUname() {
	return uname;
    }
    public String getPass() {
	return pass;
    }
    public String getFname() {
	return fname;
    }
    public String getLname() {
	return lname;
    }
    public String getBranch() {
	return branch;
    }
    public int getSem() {
	return sem;
    }
    public String getGender() {
	return gender;
    }
    public String getDob() {
	return dob;
    }
    public String getEmail() {
	return email;
    }
    public String getContact() {
	return contact;
    }
    
    /**
     * @param args the command line arguments
     */
}
