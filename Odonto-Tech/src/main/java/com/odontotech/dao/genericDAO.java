
package com.odontotech.dao;

import com.odontotech.model.GenericClass;
import java.io.InputStream;
import java.util.List;
//import org.graalvm.compiler.bytecode.Bytes;

public interface genericDAO {
    
    public void insert(String  inser, byte[] img) throws Exception;

    public void update(String up,byte[] img) throws Exception;

    public void delete(String table,int id) throws Exception;

    public String[] buscarById(String table,int id) throws Exception;
    
    public byte[] buscarById_image(String table,int id) throws Exception;
    
    public List<GenericClass> select(String table) throws Exception;
    
    public  List<GenericClass> select_image(String table) throws Exception;
    
    public  List<GenericClass> select_estado(String table) throws Exception;
  
}
