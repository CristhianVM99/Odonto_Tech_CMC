package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.GenericClass;

import com.odontotech.model.Tarifas;
import com.odontotech.model.especialidades;
import com.odontotech.utiles.Recovery;
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

@MultipartConfig
@WebServlet(name = "Controller_Tarifas", urlPatterns = {"/Controller_Tarifas"})
public class Controller_Tarifas extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        List<GenericClass> lista;
        String val[];
        Tarifas t;
        genericDAO dao = new genericDAOimplements();
        String peticion = request.getParameter("action") == null ? "vista" : request.getParameter("action");
        List<especialidades> list_es = new ArrayList<especialidades>();
        especialidades e;
        
        try {
            switch (peticion) {
                case "vista":
                    lista = dao.select("tarifas");
                    request.setAttribute("lis", lista);
                    request.getRequestDispatcher("Tarifa.jsp").forward(request, response);
                    break;
                case "add":
                    t = new Tarifas();
                    lista = dao.select("especialidades");
                    for (GenericClass cls : lista) {
                        val = cls.getToString();
                        e = new especialidades();
                        e.setId(Integer.parseInt(val[2]));
                        e.setNombre_especialidad(val[4]);
                        list_es.add(e);
                    }
                    
                    request.setAttribute("lis_es", list_es);
                    request.setAttribute("tari", t);
                    request.setAttribute("accion", "nuevo");
                    request.getRequestDispatcher("FrmTarifa.jsp").forward(request, response);
                    break;
                case "edit":
                    t = new Tarifas();
                    id = Integer.parseInt(request.getParameter("fid"));
                    val = dao.buscarById("tarifas", id);
                    t.setId(Integer.parseInt(val[2]));
                    t.setId_especialidad(Integer.parseInt(val[4]));
                    t.setServicio(val[6]);
                    t.setPrecio(Double.parseDouble(val[8]));
                    t.setNombre_especialidad(val[10]);
                    t.setEstado(val[12]);
                    t.setTipo_tarifa(val[14]);
                    
                    lista = dao.select("especialidades");
                    for (GenericClass cls : lista) {
                        val = cls.getToString();
                        e = new especialidades();
                        e.setId(Integer.parseInt(val[2]));
                        e.setNombre_especialidad(val[4]);
                        list_es.add(e);
                    }
                    
                    request.setAttribute("lis_es", list_es);
                    request.setAttribute("tari", t);
                    request.setAttribute("accion", "modificar");
                    request.getRequestDispatcher("FrmTarifa.jsp").forward(request, response);
                    
                    break;
                case "eliminar":
                    id = Integer.parseInt(request.getParameter("fid"));
                    
                    dao.delete("tarifas", id);
                    response.sendRedirect("Controller_Tarifas");
                    break;
                
            }
            
        } catch (Exception ex) {
            response.setContentType("text/html;character=UTF-8");
            try (PrintWriter s = response.getWriter()) {
                s.println("!DOCTYPE html");
                s.println("<html>");
                s.println("<head>");
                s.println("<title>Error</title>");
                s.println("</head>");
                s.println("<body>");
                s.println("<h1>Error en el metodo get:" + ex.getMessage() + "</h1>");
                s.println("</body>");
                s.println("</html>");
            }
        }
    }//do get

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("fid"));
        int id_especialidad = Integer.parseInt(request.getParameter("fid-especialidad"));
        String servicio = request.getParameter("fservicio");
        double precio = Double.parseDouble(request.getParameter("fprecio"));
        Part imagen = request.getPart("fimagen");
        String estado = request.getParameter("festado");
        String  tipo_tarifa=request.getParameter("ftipo-tarifa");
        
        Tarifas ta = new Tarifas();
        ta.setId(id);
        ta.setId_especialidad(id_especialidad);
        ta.setServicio(servicio);
        ta.setPrecio(precio);
        ta.setEstado(estado);
        ta.setTipo_tarifa(tipo_tarifa);
        
        
        byte[] img;
        genericDAO dao = new genericDAOimplements();
        
        try {
            //bucamos el nombre de la especialida por id
            String nombre_especialidad;
            String val[] = dao.buscarById("especialidades", id_especialidad);
            nombre_especialidad = val[4];
            ta.setNombre_especialidad(nombre_especialidad);
            
            if (id == 0 || imagen.getSize() > 0) {
                img = new Recovery(imagen).getImageConvert();
                ta.setImagen(img);
            } else {
                img = dao.buscarById_image("tarifas", id);
                ta.setImagen(img);
            }
            String ac = request.getParameter("metodo");
            if (ac.equals("nuevo")) {
                dao.insert(ta.toString(), ta.getImagen());
                response.sendRedirect("Controller_Tarifas?action=add");
            } else {
                dao.update(ta.toString(), ta.getImagen());
                response.sendRedirect("Controller_Tarifas");
            }
            
        } catch (Exception ex) {
            response.setContentType("text/html;character=UTF-8");
            try (PrintWriter e = response.getWriter()) {
                e.println("!DOCTYPE html");
                e.println("<html>");
                e.println("<head>");
                e.println("<title>Error</title>");
                e.println("</head>");
                e.println("<body>");
                e.println("<h1>Error en el metodo post:" + ex.getMessage() + "</h1>");
                e.println("</body>");
                e.println("</html>");
                
            }
        }
        
    }//do post

}//class
