package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Sonrisa_del_mes;
import com.odontotech.model.Doctores;
import com.odontotech.model.Pacientes;
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
@WebServlet(name = "Controller_Sonrisa_Del_Mes", urlPatterns = {"/Controller_Sonrisa_Del_Mes"})
public class Controller_Sonrisa_Del_Mes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        genericDAO dao = new genericDAOimplements();
        String peticion = request.getParameter("action") == null ? "view" : request.getParameter("action");
        List<GenericClass> lista;
        List<GenericClass> lis_doctor;
        List<Doctores> doc = new ArrayList<Doctores>();
        List<GenericClass> lis_paci;
        List<Pacientes>  paci=new ArrayList<Pacientes>();
         Pacientes p;       
        Doctores d;
        Sonrisa_del_mes son;
        String val_dao[];
        try {
            switch (peticion) {
                case "view":
                    lista = dao.select("sonrisa_del_mes");
                    request.setAttribute("li", lista);
                    request.getRequestDispatcher("SonrisaDelMes.jsp").forward(request, response);
                    break;
                    
                case "add":
                    son = new Sonrisa_del_mes();
                    lis_doctor = dao.select("doctores");
                    for (GenericClass cls : lis_doctor) {
                        val_dao = cls.getToString();
                        d = new Doctores();
                        d.setId(Integer.parseInt(val_dao[2]));
                        d.setNombre(val_dao[4]);
                        doc.add(d);
                    }
                    
                     lis_paci = dao.select("pacientes");
                    for (GenericClass cls : lis_paci) {
                        val_dao = cls.getToString();
                        p = new Pacientes();
                        p.setCi(val_dao[2]);
                        p.setNombre(val_dao[4]);
                        paci.add(p);
                    }
                    
                    request.setAttribute("paciente",paci);
                    request.setAttribute("li_doc", doc);
                    request.setAttribute("sonrisa", son);
                    request.setAttribute("valor", "nuevo");
                    request.getRequestDispatcher("FrmSonrisaDelMes.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("fid"));
                    val_dao = dao.buscarById("sonrisa_del_mes", id);

                    son = new Sonrisa_del_mes();
                    son.setId(Integer.parseInt(val_dao[2]));
                    son.setNombre_paciente(val_dao[4]);
                    son.setNombre_doctor(val_dao[6]);
                    son.setDescripcion(val_dao[8]);
                    son.setId_doctor(Integer.parseInt(val_dao[10]));
                    son.setCi_paciente(val_dao[12]);
                    son.setEstado(val_dao[14]);
                    
                       lis_doctor = dao.select("doctores");
                    for (GenericClass cls : lis_doctor) {
                        val_dao = cls.getToString();
                        d = new Doctores();
                        d.setId(Integer.parseInt(val_dao[2]));
                        d.setNombre(val_dao[4]);
                        doc.add(d);
                    }

                         lis_paci = dao.select("pacientes");
                    for (GenericClass cls : lis_paci) {
                        val_dao = cls.getToString();
                        p = new Pacientes();
                        p.setCi(val_dao[2]);
                        p.setNombre(val_dao[4]);
                        paci.add(p);
                    }
                    
                    request.setAttribute("paciente",paci);
                    request.setAttribute("li_doc", doc);
                    request.setAttribute("sonrisa", son);
                    request.setAttribute("valor", "modificar");
                    request.getRequestDispatcher("FrmSonrisaDelMes.jsp").forward(request, response);
                    break;
                case "remove":
                    id = Integer.parseInt(request.getParameter("fid"));
                    dao.delete("sonrisa_del_mes", id);
                    response.sendRedirect("Controller_Sonrisa_Del_Mes");

                    break;
            }//switch

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("fid"));

     
        Part imagen = request.getPart("fimagen");
        String descripcion = request.getParameter("fdescripcion");
        int id_doctor = Integer.parseInt(request.getParameter("fid-doctor"));
        String ci_paciente = request.getParameter("fci-paciente");
        String estado=request.getParameter("festado");
        Sonrisa_del_mes son = new Sonrisa_del_mes();


        genericDAO dao = new genericDAOimplements();
        try {
            //buscamos el nombre del doctor con el id recuperado del formulario 
            String doc[]=dao.buscarById("doctores", id_doctor);
            String nombre_doctor=doc[4];
            son.setNombre_doctor(nombre_doctor);
            
            //buscamos el nombre del paciente con el ci recuperado del formulario
            String paci[]=dao.buscarById("pacientes",Integer.parseInt(ci_paciente));
            String nombre_paciente=paci[4];
            son.setNombre_paciente(nombre_paciente);
            
            //verificamos si es imagen nueva o antigua
            if (id == 0 || imagen.getSize() > 0) {
                son.setImagen(new Recovery(imagen).getImageConvert());
            } else {
                byte[] img;
                img = dao.buscarById_image("sonrisa_del_mes", id);
                son.setImagen(img);
            }
            
      //llenamos todos los datos que faltan en la clase sonrisa del mes      
        son.setId(id);
       son.setDescripcion(descripcion);
        son.setId_doctor(id_doctor);
        son.setCi_paciente(ci_paciente);
        son.setEstado(estado);
            //ejecutamos segun los metodos pedidos del formulario
            if (id == 0) {
                dao.insert(son.toString(), son.getImagen());
                response.sendRedirect("Controller_Sonrisa_Del_Mes?action=add");
            } else {
                dao.update(son.toString(), son.getImagen());
                response.sendRedirect("Controller_Sonrisa_Del_Mes");
            }

        } catch (Exception ex) {
            response.setContentType("text/html;character=UTF-8");
            try (PrintWriter r = response.getWriter()) {
                r.println("!DOCTYPE Html");
                r.println("<html>");
                r.println("<head>");
                r.println("<title>Error</title>");
                r.println("</head>");
                r.println("<body>");
                r.println("<h1>Error en el metodo post:" + ex.getMessage() + "</h1>");
                r.println("</body>");
                r.println("</html>");

            }
        }

    }
}
