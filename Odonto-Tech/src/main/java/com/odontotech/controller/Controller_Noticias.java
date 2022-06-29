package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.Doctores;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Noticias;
import com.odontotech.utiles.Recovery;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
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
@WebServlet(name = "Controller_Noticias", urlPatterns = {"/Controller_Noticias"})
public class Controller_Noticias extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        Noticias n;
        String accion = (request.getParameter("action") == null) ? "vista" : request.getParameter("action");
        genericDAO dao;
        String valores_dao[];
        List<GenericClass> lista;
        Doctores d;
        List<Doctores> doc= new ArrayList<Doctores>();
        try {
            if (accion.equals("vista")) {
                dao = new genericDAOimplements();
                lista = dao.select("noticias");
                request.setAttribute("list", lista);
                request.getRequestDispatcher("Noticias.jsp").forward(request, response);
            }
            if (accion.equals("add")) {
                 dao = new genericDAOimplements();
                     lista = dao.select("doctores");
                    for (GenericClass cls : lista) {
                        valores_dao = cls.getToString();
                        d = new Doctores();
                        d.setId(Integer.parseInt(valores_dao[2]));
                        d.setNombre(valores_dao[4]);
                        doc.add(d);
                    }
                
                n = new Noticias();
                request.setAttribute("valor", "nuevo");
                 request.setAttribute("lis_doc", doc);
                request.setAttribute("noti", n);
                request.getRequestDispatcher("FrmNoticias.jsp").forward(request, response);
            }
            if (accion.equals("edit")) {
                 dao = new genericDAOimplements();
                     lista = dao.select("doctores");
                    for (GenericClass cls : lista) {
                        valores_dao = cls.getToString();
                        d = new Doctores();
                        d.setId(Integer.parseInt(valores_dao[2]));
                        d.setNombre(valores_dao[4]);
                        doc.add(d);
                    }
                
                
                id = Integer.parseInt(request.getParameter("fid"));
                dao = new genericDAOimplements();
                valores_dao = dao.buscarById("noticias", id);
                n = new Noticias();
                n.setId(Integer.parseInt(valores_dao[2]));
                n.setTitulo(valores_dao[4]);
                n.setContenido(valores_dao[6]);
                n.setFecha(Date.valueOf(valores_dao[8]));
                n.setId_doctor(Integer.parseInt(valores_dao[10]));
                n.setEstado(valores_dao[12]);
                
                request.setAttribute("noti", n);
                 request.setAttribute("lis_doc", doc);
                request.setAttribute("valor", "modificar");
                request.getRequestDispatcher("FrmNoticias.jsp").forward(request, response);

            }
            if (accion.equals("remove")) {
                id = Integer.parseInt(request.getParameter("fid"));
                dao = new genericDAOimplements();
                dao.delete("noticias", id);
                response.sendRedirect("Controller_Noticias");
            }

        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Error</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Error en el metodo get: " + ex.getMessage() + " </h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }

    }//method get

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //f = formulario
        int id = Integer.parseInt(request.getParameter("fid"));
        String titulo = request.getParameter("ftitulo");
        String contenido = request.getParameter("fcontenido");
        Part imagen = request.getPart("fimagen");
        String fecha = request.getParameter("ffecha");
        int id_doctor = Integer.parseInt(request.getParameter("fid_doctor"));
        String estado =request.getParameter("festado");
        
        
        Noticias n= new Noticias();
        n.setId(id);
        n.setTitulo(titulo);
        n.setContenido(contenido);
        n.setFecha(Date.valueOf(fecha));
        n.setId_doctor(id_doctor);
        n.setEstado(estado);
        
        genericDAO dao= new genericDAOimplements(); 
    
        try {
      if(id==0 || imagen.getSize()>0)
      {
       n.setImagen(new Recovery(imagen).getImageConvert()); 
      }else
      {
        n.setImagen(dao.buscarById_image("noticias", id));
      }
    
      if(id==0){
          dao.insert(n.toString(),n.getImagen());
          response.sendRedirect("Controller_Noticias?action=add");
      }else
      {
          dao.update(n.toString(),n.getImagen());
           response.sendRedirect("Controller_Noticias");
      }
            
            
        } catch (Exception ex) {

            try (PrintWriter es = response.getWriter()) {
                es.println("<!DOCTYPE html>");
                es.println("<html>");
                es.println("<head>");
                es.println("<title>Error</title>");
                es.println("</head>");
                es.println("<body>");
                es.println("<h1>Error en el metodo post: " + ex.getMessage() + " </h1>");
                es.println("</body>");
                es.println("</html>");

            }

        }

    }//do post

}
