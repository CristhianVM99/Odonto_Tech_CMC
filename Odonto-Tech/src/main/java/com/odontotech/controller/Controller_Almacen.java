package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.Doctores;
import com.odontotech.model.GenericClass;
import com.odontotech.model.almacen;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


@WebServlet(name = "Controller_Almacen", urlPatterns = {"/Controller_Almacen"})
public class Controller_Almacen extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            //String id;
            genericDAO dao = new genericDAOimplements();

            List<GenericClass> lista_almacen = null;
            List<GenericClass> lis= null;
            Doctores d;
            String val2[];
             List<Doctores> lis_doc= new ArrayList<Doctores>();
            //List<byte[]> lista_imagenes = null;
            //byte[] foto = null;
            almacen alm = new almacen();
            //String valor;
            //String visibilidad;
            switch (action) {
                case "add":
                    // valor="nuevo";
                    // visibilidad="text";
                    // request.setAttribute("valor",valor);
                    // request.setAttribute("visibilidad",visibilidad);
                    lis = dao.select("doctores");
                    for (GenericClass cls : lis) {
                        d = new Doctores();
                        val2 = cls.getToString();
                        d.setId(Integer.parseInt(val2[2]));
                        d.setNombre(val2[4]);
                        lis_doc.add(d);
                    }

                    request.setAttribute("doc", lis_doc);
                    request.setAttribute("pe", alm);
                    request.getRequestDispatcher("FrmAlmacen.jsp").forward(request, response);
                    break;
                case "edit":
                    //valor="editado";
                    //visibilidad="hidden";
                    int pos = Integer.parseInt(request.getParameter("id"));
                    String[] paci = dao.buscarById("almacen", pos);
                    //byte[] img = dao.buscarById_image("pacientes", pos);

                    //==========insertamos los datos al objeto==
                    almacen pe = new almacen();
                    pe.setId(Integer.parseInt(paci[2]));
                    pe.setNombre(paci[4]);
                    pe.setCantidad(Integer.parseInt(paci[6]));
                    pe.setFecha_venc(Date.valueOf(paci[8]));
                    pe.setPrecio_unit(Double.parseDouble(paci[10]));
                    pe.setId_doctor(Integer.parseInt(paci[12]));

                    //==========fin de insercion=============
                    //request.setAttribute("valor", valor);    
                    //request.setAttribute("visibilidad",visibilidad);
                       lis = dao.select("doctores");
                    for (GenericClass cls : lis) {
                        d = new Doctores();
                        val2 = cls.getToString();
                        d.setId(Integer.parseInt(val2[2]));
                        d.setNombre(val2[4]);
                        lis_doc.add(d);
                    }

                    request.setAttribute("doc", lis_doc);
                    request.setAttribute("pe", pe);
                    request.getRequestDispatcher("FrmAlmacen.jsp").forward(request, response);
                    break;
                case "delete":
                    int ci = Integer.parseInt(request.getParameter("id"));
                    dao.delete("almacen", ci);
                    response.sendRedirect("Controller_Almacen");
                    break;
                case "view":
                    //obtener la lista de registros de los pascientes.==========

                    lista_almacen = dao.select("almacen");
                    List<almacen> lista = new ArrayList();
                    for (GenericClass cl : lista_almacen) {
                        String[] val = cl.getToString();
                        almacen p = new almacen();
                        p.setId(Integer.parseInt(val[2]));
                        p.setNombre(val[4]);
                        p.setCantidad(Integer.parseInt(val[6]));
                        p.setFecha_venc(Date.valueOf(val[8]));
                        p.setPrecio_unit(Double.parseDouble(val[10]));
                        p.setId_doctor(Integer.parseInt(val[12]));
                        
                        lista.add(p);
                    }
                    request.setAttribute("lista_almacen", lista);
                    request.getRequestDispatcher("Almacen.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error Get" + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          request.setCharacterEncoding("UTF-8");
        almacen P = new almacen();
        genericDAO dao = new genericDAOimplements();

        //String valor = request.getParameter("valor");
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        Date fecha = Date.valueOf(request.getParameter("fecha_venc"));
        //Date fecha = Date.valueOf("2022-06-10");
        double precio_unit = Double.parseDouble((request.getParameter("Precio_unit")));
        int id_doctor = Integer.parseInt(request.getParameter("id_doctor"));
        
        
        
        System.out.println(" "+id+" "+nombre+" "+cantidad+" "+fecha+" "+precio_unit+" "+id_doctor);
        P.setId(id);
        P.setNombre(nombre);
        P.setCantidad(cantidad);
        P.setFecha_venc(fecha);
        P.setPrecio_unit(precio_unit);
        P.setId_doctor(id_doctor);
        //JOptionPane.showMessageDialog(null,P.toString() );
        System.out.println("datos : "+ P);
        
        //if (imgSize > 0)
        //    paciente.setImagen(imagen); 
        if (id == 0) {
            try {

                //nuevo registro
                dao.insert(P.toString(), null);

            } catch (Exception ex) {
                System.out.println("Error al insertar " + ex.getMessage());
            }
        } else {
            try {
                //edicion de registro
                dao.update(P.toString(), null);
            } catch (Exception ex) {
                System.out.println("Error al editar " + ex.getMessage());
            }
        }
        response.sendRedirect("Controller_Almacen");
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
}
