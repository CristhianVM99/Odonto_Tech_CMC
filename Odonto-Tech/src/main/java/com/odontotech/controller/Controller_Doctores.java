
package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.Doctores;
import com.odontotech.model.GenericClass;
import com.odontotech.model.especialidades;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

@MultipartConfig
@WebServlet(name = "Controller_Doctores", urlPatterns = {"/Controller_Doctores"})
public class Controller_Doctores extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                try {
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            genericDAO dao = new genericDAOimplements();

            List<GenericClass> lista_doctores = null; 
            List<GenericClass> lista_especialidades = null; 
            List<byte[]> lista_imagenes = null;
            Doctores doc = new Doctores();
            byte[] foto = null;
            switch (action) {
                case "add":
                    //buscamos la lista de especialidades.
                    lista_especialidades = dao.select("especialidades");
                    List<especialidades> lista_esp = new ArrayList<>();
                    for(GenericClass cl : lista_especialidades) {
                        String[] val = cl.getToString();
                        
                        especialidades e = new especialidades();
                            e.setId(Integer.parseInt(val[2]));
                            e.setNombre_especialidad(val[4]);
                            lista_esp.add(e);
                    }
                    
                    request.setAttribute("lista_especialidades", lista_esp);
                    request.setAttribute("doctor", doc);
                    request.getRequestDispatcher("FrmDoctores.jsp").forward(request, response);
                    break;
                case "edit":
                    //lista_seminarios = daoSeminario.getAll();
                    lista_especialidades = dao.select("especialidades");
                    
                    List<especialidades> lista_edit= new ArrayList<>();
                    for(GenericClass cl : lista_especialidades) {
                        String[] val = cl.getToString();
                        especialidades d = new especialidades();
                            d.setId(Integer.parseInt(val[2]));
                            d.setNombre_especialidad(val[4]);
                            lista_edit.add(d);
                    }
                    
                                        
                    //buscamos el registro
                    int pos = Integer.parseInt(request.getParameter("id")); 
                    String[] doct = dao.buscarById("doctores", pos);                    
                    Doctores docedit = new Doctores();
                    
                    docedit.setId(Integer.parseInt(doct[2]));
                    docedit.setNombre(doct[4]);
                    docedit.setCi(doct[6]);
                    docedit.setEspecialidad("ninguna");
                    docedit.setCelular(Integer.parseInt(doct[10]));
                    docedit.setDireccion(doct[12]);
                    foto = dao.buscarById_image("doctores", Integer.parseInt(doct[2]));
                    docedit.setImagen(foto);
                    docedit.setId_especialidad(Integer.parseInt(doct[14]));
                    
                    
                    request.setAttribute("lista_especialidades", lista_edit);
                    request.setAttribute("doctor", docedit);
                    request.getRequestDispatcher("FrmDoctores.jsp").forward(request, response);
                    break;
                case "delete":
                    int idd = Integer.parseInt(request.getParameter("id"));
                    dao.delete("doctores", idd);
                    response.sendRedirect("Controller_Doctores");
                    break;
                case "view":
                    //obtener la lista de registros de los pascientes.==========
                                        
                    lista_doctores = dao.select("doctores");                    
                    List<Doctores> lista = new ArrayList<>();
                    for(GenericClass cl : lista_doctores) {
                        String[] val = cl.getToString();
                        
                        Doctores d = new Doctores();
                            d.setId(Integer.parseInt(val[2]));
                            d.setNombre(val[4]);
                            d.setCi(val[6]);                            
                            d.setEspecialidad("ninguna");
                            d.setCelular(Integer.parseInt(val[10]));
                            d.setDireccion(val[12]);
                            foto = dao.buscarById_image("doctores", Integer.parseInt(val[2]));
                            d.setImagen(foto);
                            d.setId_especialidad(Integer.parseInt(val[14]));
                            lista.add(d);
                    }
                    
                    //agregamos la lista de especialidades
                    lista_especialidades = dao.select("especialidades");
                    
                    List<especialidades> lista_view= new ArrayList<>();
                    for(GenericClass cl : lista_especialidades) {
                        String[] val = cl.getToString();
                        especialidades d = new especialidades();
                            d.setId(Integer.parseInt(val[2]));
                            d.setNombre_especialidad(val[4]);
                            lista_view.add(d);
                    }
                    
                    request.setAttribute("lista_especialidades", lista_view);
                    request.setAttribute("lista_doctores", lista);
                    request.getRequestDispatcher("Doctores.jsp").forward(request, response);  
                    break;
                case "mostrarFoto":
                    int posicion = Integer.parseInt(request.getParameter("id"));
                    byte[] imagen = dao.buscarById_image("doctores", posicion);
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
        Doctores D = new Doctores();
        genericDAO dao = new genericDAOimplements();
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String ci = request.getParameter("ci");
        int celular = Integer.parseInt(request.getParameter("celular"));
        String direccion = request.getParameter("direccion");
        Part img = request.getPart("imagen");
        int id_especialidad = Integer.parseInt(request.getParameter("id_especialidad"));     
        
        //convertir una imagen a byte
        
        byte[] imagen = null;
        imagen=convierteImagen(img);
        //fin de convercion

        D.setId(id);
        D.setNombre(nombre);
        D.setCi(ci);
        D.setEspecialidad("ninguna");
        D.setCelular(celular);
        D.setDireccion(direccion);
        D.setId_especialidad(id_especialidad);
        
        System.out.println(D.toString());
                //if (imgSize > 0)
        //    paciente.setImagen(imagen); 
        if(id == 0)
        {
            try {
                
                //nuevo registro
                dao.insert(D.toString() , imagen);
                
            } catch (Exception ex){
                System.out.println("Error al insertar "+ex.getMessage());
            }
        }else{
            try {
                //imagen
                if(imagen == null)
                {
                    imagen=dao.buscarById_image("doctores", Integer.parseInt(D.getCi()));
                }
                //edicion de registro
                dao.update(D.toString(), imagen);
                
            } catch (Exception ex) {
                System.out.println("Error al editar "+ex.getMessage());
            } 
        }
        response.sendRedirect("Controller_Doctores");
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
