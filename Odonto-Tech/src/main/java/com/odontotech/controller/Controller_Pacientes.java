
package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Pacientes;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;
import javax.swing.text.html.HTML;

@MultipartConfig
@WebServlet(name = "Controller_Pacientes", urlPatterns = {"/Controller_Pacientes"})
public class Controller_Pacientes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            //String id;
            genericDAO dao = new genericDAOimplements();

            List<GenericClass> lista_pacientes = null; 
            //List<byte[]> lista_imagenes = null;
            byte[] foto = null;
            Pacientes paciente = new Pacientes();
            String valor;
            String visibilidad;
            switch (action) {
                case "add":
                    valor="nuevo";
                    visibilidad="text";
                    request.setAttribute("valor",valor);
                    request.setAttribute("visibilidad",visibilidad);
                    request.setAttribute("paciente", paciente);
                    request.getRequestDispatcher("FrmPasciente.jsp").forward(request, response);
                    break;
                case "edit":
                    valor="editado";
                    visibilidad="hidden";
                    int pos = Integer.parseInt(request.getParameter("id")); 
                    String[] paci = dao.buscarById("pacientes", pos);                    
                    byte[] img = dao.buscarById_image("pacientes", pos);
                    
                    //==========insertamos los datos al objeto==
                    Pacientes pe = new Pacientes();
                    pe.setNombre(paci[4]);
                    pe.setCi(paci[2]);
                    pe.setFecha_inicio(convierteFecha(paci[6]));
                    pe.setDescripcion(paci[8]);
                    pe.setCelular(Integer.parseInt(paci[10]));
                    pe.setServicio(paci[12]);
                    pe.setDireccion(paci[14]);
                    pe.setImagen(img);    
                    
                    
                    //==========fin de insercion=============
                    
                    request.setAttribute("valor", valor);    
                    request.setAttribute("visibilidad",visibilidad);
                    request.setAttribute("paciente", pe);
                    request.getRequestDispatcher("FrmPasciente.jsp").forward(request, response);
                    break;
                case "delete":
                    int ci = Integer.parseInt(request.getParameter("id"));
                    dao.delete("pacientes", ci);
                    response.sendRedirect("Controller_Pacientes");
                    break;
                case "view":
                    //obtener la lista de registros de los pascientes.==========
                    
                    lista_pacientes = dao.select("pacientes");
                    List<Pacientes> lista = new ArrayList();
                    for(GenericClass cl : lista_pacientes) {
                        String[] val = cl.getToString();
                        Pacientes p = new Pacientes();
                            p.setNombre(val[4]);
                            p.setCi(val[2]);
                            p.setFecha_inicio(convierteFecha(val[6]));
                            p.setDescripcion(val[8]);
                            p.setCelular(Integer.parseInt(val[10]));
                            p.setServicio(val[12]);
                            p.setDireccion(val[14]);
                            foto = dao.buscarById_image("pacientes", Integer.parseInt(val[2]));
                            p.setImagen(foto);
                            lista.add(p);
                    }
                    request.setAttribute("lista_pacientes", lista);
                    request.getRequestDispatcher("Pasciente.jsp").forward(request, response);  
                    break;
                case "mostrarFoto":
                    String tabla =request.getParameter("tabla");
                        int posicion = Integer.parseInt(request.getParameter("id"));
                        byte[] imagen = dao.buscarById_image(tabla, posicion);
                        response.getOutputStream().write(imagen);
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error Get" + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          request.setCharacterEncoding("UTF-8");
        Pacientes P = new Pacientes();
        genericDAO dao = new genericDAOimplements();
        
        
        String valor = request.getParameter("valor");
        String nombre = request.getParameter("nombre");
        String ci = request.getParameter("ci");
        String fecha_inicio = request.getParameter("fecha_inicio");
        String descripcion = request.getParameter("descripcion");
        int celular = Integer.parseInt(request.getParameter("celular"));
        String servicio = request.getParameter("servicio");
        String direccion = request.getParameter("direccion");
        Part img = request.getPart("imagen");
        
        //convertir una imagen a byte
        
        byte[] imagen = null;
        imagen=convierteImagen(img);
        //fin de convercion
        
        
        
        P.setNombre(nombre);
        P.setCi(ci);
        P.setFecha_inicio(convierteFecha(fecha_inicio));
        P.setDescripcion(descripcion);
        P.setCelular(celular);
        P.setServicio(servicio);
        P.setDireccion(direccion);
        System.out.println(P.getFecha_inicio());

        //if (imgSize > 0)
        //    paciente.setImagen(imagen); 
        
        if(valor.equals("nuevo"))
        {
            try {
                
                //nuevo registro
                dao.insert(P.toString(), imagen);
                
            } catch (Exception ex){
                System.out.println("Error al insertar "+ex.getMessage());
            }
        }else{
            try {
                //imagen
                if(imagen == null)
                {
                    imagen=dao.buscarById_image("pacientes", Integer.parseInt(P.getCi()));
                }
                //edicion de registro
                dao.update(P.toString(), imagen);
                
            } catch (Exception ex) {
                System.out.println("Error al editar "+ex.getMessage());
            } 
        }
        response.sendRedirect("Controller_Pacientes");
    }
    
        public Date convierteFecha(String fecha)
    {
        Date fechaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");
        
        java.util.Date fechaTMP;
      
        try {
            fechaTMP = formato.parse(fecha);
            fechaBD = new Date(fechaTMP.getTime());    
        } catch (ParseException ex) {
            System.out.println("Error al convertir la fecha "+ex.getMessage());
        }        
        return fechaBD;
    }
        
    public byte[] convierteImagen( Part img) throws IOException
    {
        int imgSize = (int)img.getSize(); //si no tiene tamaño, no hay foto

        byte[] imagen = null; //el buffer
        if (imgSize > 0) {
            imagen = new byte[imgSize];
            try ( DataInputStream dis = new DataInputStream(img.getInputStream())) {
                dis.readFully(imagen);
            }
        }
        return imagen;
    }        
        
}
