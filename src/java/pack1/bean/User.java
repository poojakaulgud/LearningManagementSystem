/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack1.bean;

/**
 *
 * @author POOJA KAULGUD
 */
public class User {
     
    private int id;  
    private String name,pass,dsgn;  
    //functions  
    public User(String dsgn,int id,String name,String pass){
         this.dsgn=dsgn;
         this.id=id;
         this.name=name;
         this.pass=pass;
     }
    
    public String getDsgn() {
	return dsgn;
    }
    
    public int getId() {
	return id;
    }
    public String getName() {
	return name;
    }
    public String getPass() {
	return pass;
    }
    /**
     * @param args the command line arguments
     */
}
