package com.odontotech.utiles;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import java.io.DataInputStream;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

public class Recovery {

    private static byte[] image;
    private Part file;
    private String table;
    private int id;

    public Recovery(Part file) {
        this.image = null;
        this.file = file;
        byte_image();
    }

    public Recovery(String table,int id) {
        this.image = null;
        this.file = null;
        this.table=table;
        this.id=id;
    byte_image_write();
    }

    public static byte[] getImageConvert() {
        return image;
    }
    public static byte[] getImageWrite()
    {
       return image; 
    }


 private void byte_image(){
     try {
     int tam=(int)this.file.getSize();
     if(tam>0)
     {
      this.image= new byte[tam];
      DataInputStream data= new DataInputStream(this.file.getInputStream());
     data.readFully(this.image);
     }
  
     }catch(Exception ex)
     {
     JOptionPane.showMessageDialog(null,"Error al covertir imagen"+ex.getMessage());
     }  
 }
 
 private void byte_image_write(){
     genericDAO dao=new genericDAOimplements();
     try{
     image=dao.buscarById_image(this.table,this.id);
     }catch(Exception ex){
         JOptionPane.showMessageDialog(null,"Error al recuperar imagen:"+ex.getMessage());
     }
     
 }
}
