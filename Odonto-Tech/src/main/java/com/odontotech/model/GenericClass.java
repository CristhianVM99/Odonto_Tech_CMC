
package com.odontotech.model;


public class GenericClass {
    private String[] toString;
    private byte[] img;
    
   public GenericClass(String[] toString)
   {
      this.toString=toString;
   }
     
   public GenericClass()
   {
      this.toString=null;
   }

    public String[] getToString() {
        return toString;
    }

    public byte[] getImg() {
        return img;
    }

    public void setImg(byte[] img) {
        this.img = img;
    }

    public void setToString(String[] toString) {
        this.toString = toString;
    }
 
}
