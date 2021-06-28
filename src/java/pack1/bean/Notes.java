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
public class Notes {
     
    private int fac_id;  
    private String subject,filename;
    private InputStream file;
    //functions  
    public Notes(int fac_id,InputStream file, String filename, String subject){
         this.subject=subject;
         this.file=file;
         this.filename=filename;
         this.fac_id=fac_id;
     }
    
    public String getSubject() {
	return subject;
    }
    
    public InputStream getFile() {
	return file;
    }
    
    public String getFilename() {
	return filename;
    }
    
    public int getFacId() {
	return fac_id;
    }
    
    
    
    public void setFacId(int fac_id){
        this.fac_id=fac_id;
    }
    /**
     * @param args the command line arguments
     */
}
