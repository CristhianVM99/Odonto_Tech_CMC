package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.Doctores;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet(name = "Controller_Usuarios", urlPatterns = {"/Controller_Usuarios"})
public class Controller_Usuarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        String accion = request.getParameter("action") == null ? "view" : request.getParameter("action");
        Usuarios us;
        List<Usuarios> lis_us = new ArrayList<Usuarios>();
        List<GenericClass> lis;
        List<Doctores> lis_doc = new ArrayList<Doctores>();
        genericDAO dao = new genericDAOimplements();
        String val[];
        Doctores d = new Doctores();

        try {
            switch (accion) {
                case "view":
                    lis = dao.select("usuarios");
                    for (GenericClass cls : lis) {
                        us = new Usuarios();
                        val = cls.getToString();
                        us.setId(Integer.parseInt(val[2]));
                        us.setNombre_doctor(val[4]);
                        us.setUsuario(val[6]);
                        us.setPassword(val[8]);
                        us.setCorreo(val[10]);
                        us.setId_doctor(Integer.parseInt(val[12]));
                        us.setRol(val[14]);
                        lis_us.add(us);
                    }

                    request.setAttribute("usu", lis_us);
                    request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                    break;
                case "add":
                    lis = dao.select("doctores");
                    for (GenericClass cls : lis) {
                        d = new Doctores();
                        val = cls.getToString();
                        d.setId(Integer.parseInt(val[2]));
                        d.setNombre(val[4]);
                        lis_doc.add(d);
                    }

                    us = new Usuarios();

                    request.setAttribute("doc", lis_doc);
                    request.setAttribute("usuar", us);
                    request.setAttribute("val", "Guardar");
                    request.getRequestDispatcher("FrmUsuarios.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("fid"));
                    val = dao.buscarById("usuarios", id);
                    us = new Usuarios();

                    us.setId(Integer.parseInt(val[2]));
                    us.setNombre_doctor(val[4]);
                    us.setUsuario(val[6]);
                    us.setPassword(val[8]);
                    us.setCorreo(val[10]);
                    us.setId_doctor(Integer.parseInt(val[12]));
                    us.setRol(val[14]);

                    lis = dao.select("usuarios");
                    for (GenericClass cls : lis) {
                        us = new Usuarios();
                        val = cls.getToString();
                        us.setId(Integer.parseInt(val[2]));
                        us.setNombre_doctor(val[4]);
                        us.setUsuario(val[6]);
                        us.setPassword(val[8]);
                        us.setCorreo(val[10]);
                        us.setId_doctor(Integer.parseInt(val[12]));
                        us.setRol(val[14]);
                        lis_us.add(us);
                    }
                  
                    lis = dao.select("doctores");
                    for (GenericClass cls : lis) {
                        d = new Doctores();
                        val = cls.getToString();
                        d.setId(Integer.parseInt(val[2]));
                        d.setNombre(val[4]);
                        lis_doc.add(d);
                    }

                    request.setAttribute("doc", lis_doc);
                    request.setAttribute("usuar", us);
                    request.setAttribute("val", "Modificar");
                    request.getRequestDispatcher("FrmUsuarios.jsp").forward(request, response);

                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("fid"));
                    dao.delete("usuarios", id);
                    response.sendRedirect("Controller_Usuarios");
                    break;
            }
        } catch (Exception ex) {
            response.setContentType("text/html;character=UTF-8");
            try (PrintWriter escribe = response.getWriter()) {

                escribe.println("<!DCOTYPE Html>");
                escribe.println("<html>");
                escribe.println("<head>");
                escribe.println("<title>Error</title>");
                escribe.println("</head>");
                escribe.println("<body>");
                escribe.println("<h1>Error en el metodo get" + ex.getMessage() + "</h1>");
                escribe.println("</body>");
                escribe.println("</html>");

            }

        }

    }//class

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("fid"));
        String usuario = request.getParameter("fusuario");
        String password = request.getParameter("fpassword");
        String correo = request.getParameter("fcorreo");
        int id_doctor = Integer.parseInt(request.getParameter("fid-doctor"));
        String rol = request.getParameter("frol");

        genericDAO dao = new genericDAOimplements();

        String peticion = request.getParameter("fpeticion");
        try {
            String val[] = dao.buscarById("doctores", id_doctor);
            String nombre_doctor = val[4];

            Usuarios us = new Usuarios();
            us.setId(id);
            us.setNombre_doctor(nombre_doctor);
            us.setUsuario(usuario);
            us.setPassword(password);
            us.setCorreo(correo);
            us.setId_doctor(id_doctor);
            us.setRol(rol);

            if ("Guardar".equals(peticion)) {
                dao.insert(us.toString(), null);
                response.sendRedirect("Controller_Usuarios?action=add");
            }

            if ("Modificar".equals(peticion)) {
                dao.update(us.toString(), null);
                response.sendRedirect("Controller_Usuarios");
            }
        } catch (Exception ex) {
            response.setContentType("text/html;character=UTF-8");
            try (PrintWriter escribe = response.getWriter()) {

                escribe.println("<!DCOTYPE Html>");
                escribe.println("<html>");
                escribe.println("<head>");
                escribe.println("<title>Error</title>");
                escribe.println("</head>");
                escribe.println("<body>");
                escribe.println("<h1>Error en el metodo get" + ex.getMessage() + "</h1>");
                escribe.println("</body>");
                escribe.println("</html>");

            }
        }
    }
}
