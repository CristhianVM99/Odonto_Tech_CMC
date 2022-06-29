package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Promociones;
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
import javax.swing.JOptionPane;

@MultipartConfig
@WebServlet(name = "Controller_Promociones", urlPatterns = {"/Controller_Promociones"})
public class Controller_Promociones extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        genericDAO dao = new genericDAOimplements();
        Promociones p;
        List<Promociones> lista = new ArrayList<Promociones>();
        List<GenericClass> lista_generica = new ArrayList<GenericClass>();
        List<especialidades> list_es = new ArrayList<especialidades>();
        especialidades e;
        String val[];
        String accion = (request.getParameter("action") == null) ? "vista" : request.getParameter("action");
        try {
            switch (accion) {
                case "vista":
                    lista_generica = dao.select("promociones");
                    for (GenericClass g : lista_generica) {
                        p = new Promociones();
                        val = g.getToString();
                        p.setId(Integer.parseInt(val[2]));
                        p.setServicio(val[4]);
                        p.setPrecio(Double.parseDouble(val[6]));
                        p.setId_especialidad(Integer.parseInt(val[8]));
                        p.setNombre_especialidad(val[10]);
                        p.setEstado(val[12]);
                        lista.add(p);
                    }
                    request.setAttribute("list", lista);
                    request.getRequestDispatcher("Promociones.jsp").forward(request, response);
                    break;
                case "add":
                    /*falta mandar datos de las especialidades*/
                    lista_generica = dao.select("especialidades");
                    for (GenericClass cls : lista_generica) {
                        val = cls.getToString();
                        e = new especialidades();
                        e.setId(Integer.parseInt(val[2]));
                        e.setNombre_especialidad(val[4]);
                        list_es.add(e);
                    }

                    p = new Promociones();

                    request.setAttribute("lis_es", list_es);
                    request.setAttribute("promo", p);
                    request.setAttribute("action", "nuevo");
                    request.getRequestDispatcher("FrmPromociones.jsp").forward(request, response);
                    break;
                case "edit":
                    /*falta mandar datos de las especialidades*/
                    lista_generica = dao.select("especialidades");
                    for (GenericClass cls : lista_generica) {
                        val = cls.getToString();
                        e = new especialidades();
                        e.setId(Integer.parseInt(val[2]));
                        e.setNombre_especialidad(val[4]);
                        list_es.add(e);
                    }

                    id = Integer.parseInt(request.getParameter("fid"));
                    val = dao.buscarById("promociones", id);
                    p = new Promociones();
                    p.setId(Integer.parseInt(val[2]));
                    p.setServicio(val[4]);
                    p.setPrecio(Double.parseDouble(val[6]));
                    p.setId_especialidad(Integer.parseInt(val[8]));
                    p.setNombre_especialidad(val[10]);
                    p.setEstado(val[12]);

                    request.setAttribute("lis_es", list_es);
                    request.setAttribute("promo", p);
                    request.setAttribute("action", "editar");
                    request.getRequestDispatcher("FrmPromociones.jsp").forward(request, response);
                    break;
                case "remove":
                    id = Integer.parseInt(request.getParameter("fid"));
                    dao.delete("promociones", id);
                    response.sendRedirect("Controller_Promociones");
            }
        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Controller_Noticias</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Error en el metodo get: " + ex.getMessage() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }//doGet

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("fid"));
        String servicio = request.getParameter("fservicio");
        String estado = request.getParameter("festado");
        double precio = Double.parseDouble(request.getParameter("fprecio"));
        Part imagen = request.getPart("fimagen");
        int id_especialidad = Integer.parseInt(request.getParameter("fid_especialidad"));

        Promociones p = new Promociones();
        p.setId(id);
        p.setServicio(servicio);
        p.setPrecio(precio);
        p.setId_especialidad(id_especialidad);
         p.setEstado(estado);
         
        genericDAO dao = new genericDAOimplements();
        try {
            //buscamos el nombre de la especialidad segun id del formulario
            String nombre_especialidad;
            String val[] = dao.buscarById("especialidades", id_especialidad);
            nombre_especialidad = val[4];
            p.setNombre_especialidad(nombre_especialidad);

            /* validar si es imagen nueva o antes*/
            if (id == 0 || imagen.getSize() > 0) {
                //imagen nueva
                //clase Recovery metodo estatico no ncesita ser instanciada
                byte[] img = new Recovery(imagen).getImageConvert();
                p.setImagen(img);
            } else {
                //imagen de antes 
                byte[] img = dao.buscarById_image("promociones", id);
                p.setImagen(img);
            }
            if (id == 0)//nuevo registro??
            {
                dao.insert(p.toString(), p.getImagen());
                response.sendRedirect("Controller_Promociones?action=add");
            } else {
                dao.update(p.toString(), p.getImagen());
                response.sendRedirect("Controller_Promociones");
            }

        } catch (Exception ex) {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Controller_Noticias</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Error en el metodo post: " + ex.getMessage() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }

    }//doPost
}
