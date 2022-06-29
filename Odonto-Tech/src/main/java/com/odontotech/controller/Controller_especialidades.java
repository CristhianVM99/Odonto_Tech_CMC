package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.GenericClass;
import com.odontotech.model.especialidades;
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
@MultipartConfig
@WebServlet(name = "Controller_especialidades", urlPatterns = {"/Controller_especialidades"})
public class Controller_especialidades extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            //String id;
            genericDAO dao = new genericDAOimplements();

            List<GenericClass> lista_especialidad = null;
            //List<byte[]> lista_imagenes = null;
            //byte[] foto = null;
            especialidades esp = new especialidades();
            //String valor;
            //String visibilidad;
            switch (action) {
                case "add":
                    // valor="nuevo";
                    // visibilidad="text";
                    // request.setAttribute("valor",valor);
                    // request.setAttribute("visibilidad",visibilidad);
                    request.setAttribute("esp", esp);
                    request.getRequestDispatcher("FrmEspecialidades.jsp").forward(request, response);
                    break;
                case "edit":
                    //valor="editado";
                    //visibilidad="hidden";
                    int pos = Integer.parseInt(request.getParameter("id"));
                    String[] paci = dao.buscarById("especialidades", pos);
                    //byte[] img = dao.buscarById_image("pacientes", pos);

                    //==========insertamos los datos al objeto==
                    especialidades pe = new especialidades();
                    pe.setId(Integer.parseInt(paci[2]));
                    pe.setNombre_especialidad(paci[4]);

                    //==========fin de insercion=============
                    //request.setAttribute("valor", valor);    
                    //request.setAttribute("visibilidad",visibilidad);
                    request.setAttribute("esp", pe);
                    request.getRequestDispatcher("FrmEspecialidades.jsp").forward(request, response);
                    break;
                case "delete":
                    int ci = Integer.parseInt(request.getParameter("id"));
                    dao.delete("especialidades", ci);
                    response.sendRedirect("Controller_especialidades");
                    break;
                case "view":
                    //obtener la lista de registros de los pascientes.==========

                    lista_especialidad = dao.select("especialidades");
                    List<especialidades> lista = new ArrayList();
                    for (GenericClass cl : lista_especialidad) {
                        String[] val = cl.getToString();
                        especialidades p = new especialidades();
                        p.setId(Integer.parseInt(val[2]));
                        p.setNombre_especialidad(val[4]);
                        //foto = dao.buscarById_image("pacientes", Integer.parseInt(val[4]));
                        //p.setImagen(foto);
                        lista.add(p);
                    }
                    request.setAttribute("lista_especialidad", lista);
                    request.getRequestDispatcher("Especialidades.jsp").forward(request, response);
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
        especialidades P = new especialidades();
        genericDAO dao = new genericDAOimplements();

        //String valor = request.getParameter("valor");
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre_especialidad");
        

        P.setId(id);
        P.setNombre_especialidad(nombre);
        
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
        response.sendRedirect("Controller_especialidades");
    }
}
