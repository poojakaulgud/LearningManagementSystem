/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack1.bean;
import java.io.InputStream;

/**
 *
 * @author POOJA KAULGUD
 */
public class Assignment {
     
    private int stu_id,fac_id;  
    private String subject,grade,filename;
    private InputStream file;
    //functions  
    public Assignment(String subject,int stu_id,InputStream file, String filename, String grade, int fac_id){
         this.subject=subject;
         this.stu_id=stu_id;
         this.file=file;
         this.filename=filename;
         this.grade=grade;
         this.fac_id=fac_id;
     }
    
    public String getSubject() {
	return subject;
    }
    
    public int getStuId() {
	return stu_id;
    }
    public InputStream getFile() {
	return file;
    }
    
    public String getFilename() {
	return filename;
    }
    
    public String getGrade() {
	return grade;
    }
    
    public int getFacId() {
	return fac_id;
    }
    
    public void setGrade(String grade){
        this.grade=grade;
    }
    
    public void setFacId(int fac_id){
        this.fac_id=fac_id;
    }
    /**
     * @param args the command line arguments
     */
}
