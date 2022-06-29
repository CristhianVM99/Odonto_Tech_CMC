package com.odontotech.dao;


import com.odontotech.model.GenericClass;
import com.odontotech.utiles.Conection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;


public class genericDAOimplements extends Conection implements genericDAO {

    @Override
    public void insert(String inser, byte[] image) throws Exception {
        this.conectar();
        String[] armar = verific_insert(inser,image);
        if(image==null)
        {
           String sql = "INSERT INTO " + armar[0] + " " + armar[1] + " VALUES " + armar[2] + ")";
           
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println(sql);
        }else{
            String sql = "INSERT INTO " + armar[0] + " " + armar[1] + " VALUES " + armar[2] + ",?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setBytes(1, image);
            System.out.println(sql);
            ps.executeUpdate();
        }
        this.desconn();
    }

    @Override
    public void update(String up, byte[] image) throws Exception {
        this.conectar();
        String[] consulta = verific_update(up);
        if(image==null)
        {    
            String sql = "UPDATE " + consulta[0] + " SET " + consulta[1] + consulta[2];
            System.out.println(sql);
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        }else{
            String sql = "UPDATE " + consulta[0] + " SET " + consulta[1] + ",imagen=? " + consulta[2];
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setBytes(1, image);
            ps.executeUpdate();
        }
        this.desconn();
    }

    @Override
    public void delete(String table, int id) throws Exception {
        this.conectar();
        if(table.equals("pacientes"))
        {
            String sql = "DELETE FROM " + table + " WHERE ci='" + id+ "'";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        }else{
            String sql = "DELETE FROM " + table + " WHERE id=" + id;
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.executeUpdate();
        }
        this.desconn();
    }

    @Override
    public String[] buscarById(String table, int id) throws Exception {


        String[] campos = verific_select_generic(table);
        String sql = "SELECT ";

        //armamos los campos de las posciones impares
        for (int i = 1; i < campos.length; i++) {
            if (i % 2 != 0) {
                sql = sql + campos[i] + ",";
            }
        }
        sql = sql.substring(0, sql.length() - 1);//kitamos la ultima coma(,)

        // verificamos en que posicion se encuentra la primary key
        int indice = 0;
        for (int i = 1; i < campos.length; i++) {
            if (i % 2 != 0 && campos[i].equals("id")) {
                indice = i;
                break;
            }
            if (i % 2 != 0 && campos[i].equals("ci")) {
                indice = i;
                break;
            }
        }
        //unimos los campos +tabla +  where 
        sql = sql + " FROM " + campos[0] + " WHERE " + campos[indice] + "='" + id + "' ";
         this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int indiceCampos = 1;
        while (rs.next()) {
            for (int i = 1; i < campos.length; i++) {
                if (i % 2 == 0)//en los indices pares se llenan los valores
                {
                    campos[i] = rs.getString(indiceCampos);
                    indiceCampos++;
                }

            }
        }

        this.desconn();
        return campos;
    }

    @Override
    public byte[] buscarById_image(String table, int id) throws Exception {
         byte[] image = null;

        String[] campos = verific_select_generic(table);
        // verificamos en que posicion se encuentra la primary key
        //los campos se encuentra en las posiciones imapres del vector
        int indice = 0;
        for (int i = 1; i < campos.length; i++) {
            if (i % 2 != 0 && campos[i].equals("id")) {
                indice = i;
            }
            if (i % 2 != 0 && campos[i].equals("ci")) {
                indice = i;
            }
        }
        String sql = verific_select_image(table) + " WHERE " + campos[indice] + "='" + id +"' ";

        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int indiceCampos = 1;
        while (rs.next()) {
       image=rs.getBytes("imagen");
        }

        this.desconn();
       
        return image;
    }

    @Override
    public List<GenericClass> select(String table) throws Exception {
        List<GenericClass> lista = new ArrayList<>();
 
        String[] campos = verific_select_generic(table);
        String sql = "SELECT ";

        //armamos los campos
        for (int i = 1; i < campos.length; i++) {
            if (i % 2 != 0) {
                sql = sql + campos[i] + ",";
            }
        }
        sql = sql.substring(0, sql.length() - 1);//kitamos la ultima coma(,)
        //unimos los campos +tabla +  where 
        sql = sql + " FROM " + campos[0]+" ";
        this.conectar();
        int indiceCampos = 1;
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            indiceCampos = 1;
            campos = verific_select_generic(table);
            for (int i = 1; i < campos.length; i++) {
                if (i % 2 == 0)//en los indices pares se llenan los valores
                {
                    campos[i] = rs.getString(indiceCampos);
                    indiceCampos++;
                }

            }
            GenericClass cl = new GenericClass();
            cl.setToString(campos);
            lista.add(cl);
        }

      this.desconn();
        return lista;

    }

    @Override
    public List<GenericClass>  select_image(String table) throws Exception {
         List<GenericClass> lista_image = new ArrayList<>();
        GenericClass p;
     
        String sql = verific_select_image(table) +"";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int indice= 0;
        while (rs.next()) {
           p=new GenericClass();
           
          p.setImg(rs.getBytes("imagen"));
       indice++;
        }

        this.desconn();
       
        return lista_image;
    }
@Override
public List<GenericClass> select_estado(String table) throws Exception{
       List<GenericClass> lista = new ArrayList<>();
 
        String[] campos = verific_select_generic(table);
        String sql = "SELECT ";

        //armamos los campos
        for (int i = 1; i < campos.length; i++) {
            if (i % 2 != 0) {
                sql = sql + campos[i] + ",";
            }
        }
        sql = sql.substring(0, sql.length() - 1);//kitamos la ultima coma(,)
        //unimos los campos +tabla +  where 
        sql = sql + " FROM " + campos[0]+" where estado='habilitado'";
        this.conectar();
        int indiceCampos = 1;
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            indiceCampos = 1;
            campos = verific_select_generic(table);
            for (int i = 1; i < campos.length; i++) {
                if (i % 2 == 0)//en los indices pares se llenan los valores
                {
                    campos[i] = rs.getString(indiceCampos);
                    indiceCampos++;
                }

            }
            GenericClass cl = new GenericClass();
            cl.setToString(campos);
            lista.add(cl);
        }

      this.desconn();
        return lista;
}
//mis metodos no abstractos
    private String[] verific_insert(String val,byte[] img) {
        val = val.replace("{", ";");
        val = val.replace("=", ";");
        val = val.replace(",", ";");
        val = val.replace("}", "");
        val = val.replace("}", "");

        String[] split = val.split(";");
        val = "";
        String[] consulta = new String[3];
        consulta[0] = split[0];
        consulta[1] = "(";//campo
        consulta[2] = "(";//valor
        int sw = 0;
        int cont=0;//para saltar el campo valor del id
        for (int i = 1; i < split.length; i++) {
            // par -> valor
            // impar ->  campo
            if (split[i].equals("id")) {
                sw = 1;
            }
            
            if(sw==1 )
            {
                cont++;
            }
            if(cont==3)
            {
                sw=0;
            }
            if (i % 2 == 0 && sw == 0) {
                    consulta[2] = consulta[2] + "'" + split[i] + "',";
            } else {
                if (sw == 0) {
                  consulta[1] = consulta[1] +split[i] + ",";
                }


            }
        }
        
        if(img==null)
        {
          consulta[1] = consulta[1].substring(0, consulta[1].length() - 1);
          consulta[1] =consulta[1]+")";
        }else
        {
        consulta[1] = consulta[1] + "imagen)";
        }

        //para eliminar el el ultimo caracter
        consulta[2] = consulta[2].substring(0, consulta[2].length() - 1);
        return consulta;
    }
    

    private String[] verific_update(String val) {
        val = val.replace("{", ";");
        val = val.replace("=", ";");
        val = val.replace(",", ";");
        val = val.replace("}", "");
        val = val.replace("}", "");

        String[] split = val.split(";");
        String[] consulta = new String[3];
        consulta[0] = split[0];
        consulta[1] = "";//campo

        for (int i = 3; i < split.length; i++) {

            // par -> valor
            // impar ->  campo
            if (i % 2 == 0) {
                consulta[1] = consulta[1] + "'" + split[i] + "',";
            } else {
                consulta[1] = consulta[1] + split[i] + "=";
            }
        }
        //para eliminar el ultimo caracter de el String
        consulta[1] = consulta[1].substring(0, consulta[1].length() - 1);
        consulta[2] = "WHERE " + split[1] + "='" + split[2] + "'";
        return consulta;

    }
    
    private String[] verific_select_generic(String table) {
        try {
          this.conectar();
            int row = 0;
            String sql_column = "SELECT column_name FROM information_schema.columns "
                    + "WHERE table_schema = 'public' "
                    + "AND table_name   = '" + table + "'";
            PreparedStatement ps = this.conn.prepareStatement(sql_column);
            ResultSet rs_column = ps.executeQuery();

            String sql_row = "SELECT count(column_name) FROM information_schema.columns "
                    + "WHERE table_schema = 'public' "
                    + "AND table_name   = '" + table + "'";

            ps = this.conn.prepareStatement(sql_row);
            ResultSet rs_row = ps.executeQuery();

            while (rs_row.next()) {
                row = rs_row.getInt(1);
            }

            String campos[] = new String[row + 1];
            campos[0] = table;
            int indice = 1;

            while (rs_column.next()) {
                campos[indice] = rs_column.getString(1);
                indice++;
            }

            Boolean img = false;
            String camposfinal[] = new String[row + 1];
            //verificamos si existe el campo "imagen"
            camposfinal[0] = campos[0];
            indice = 1;

            for (int i = 1; i < campos.length; i++) {
                if (campos[i].equals("imagen")) {
                    img = true;
                } else {
                    camposfinal[indice] = campos[i];
                    indice++;
                }
            }
            //verificamos si existe el campo "imagen"
            String retorna[];

            if (img) {
                // si campo imagen existe lo quitamos dos campo del vector y aumentamos campo para tabla
                retorna = new String[row + row - 2 + 1];
            } else {
                //si campo imagen NO existe no quitamos nada y aumentamos campo patra tabla
                retorna = new String[row + row + 1];
            }

            indice = 1;//indice se actualiza en 1
            retorna[0] = camposfinal[0];//campo reservado para la tabla
            for (int i = 1; i < retorna.length; i++) {    //indice impar->para campos

                if (i % 2 != 0) {
                    retorna[i] = camposfinal[indice];
                    indice++;
                }

            }
       this.desconn();
            return retorna;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error :" + ex.getMessage());
            return null;
        }
    }

    private String verific_select_image(String table) {
        return "SELECT imagen FROM " + table;
    }
    
    private int verific_cantidad_registros (String table)
    {
        this.conectar();
        int cantidad=0;
        String sql="SELECT count(id) FROM "+table;
        try {
        PreparedStatement ps=this.conn.prepareStatement(sql);
        ResultSet  rs=ps.executeQuery();
        while(rs.next())
        {
            cantidad=rs.getInt(1);
        }
        this.desconn();
        return cantidad;
        }catch (Exception ex)
        {
            return cantidad;
        }
        
    }
}//class
