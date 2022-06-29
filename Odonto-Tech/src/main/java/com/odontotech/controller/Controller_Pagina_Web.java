package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.Doctores;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Reserva_De_Citas;
import com.odontotech.model.especialidades;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import com.odontotech.model.GenericClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet(name = "Controller_Pagina_Web", urlPatterns = {"/Controller_Pagina_Web"})
public class Controller_Pagina_Web extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String view = request.getParameter("view") == null ? "view" : request.getParameter("view");

            switch (view) {
                case "Dentista_De_Niños":
                    request.getRequestDispatcher("View_DentistaDeNiños.jsp").forward(request, response);
                    break;
                case "Higiene_Dental":
                    request.getRequestDispatcher("View_HigieneDental.jsp").forward(request, response);
                    break;
                case "Empastes_Dentales":
                    request.getRequestDispatcher("View_EmpastesDentales.jsp").forward(request, response);
                    break;
                case "Puentes_Dentales":
                    request.getRequestDispatcher("View_PuentesDentales.jsp").forward(request, response);
                    break;
                case "Coronas_Dentales":
                    request.getRequestDispatcher("View_CoronasDentales.jsp").forward(request, response);
                    break;
                case "Extraccion_Dental":
                    request.getRequestDispatcher("View_ExtraccionDental.jsp").forward(request, response);
                    break;
                case "Dentadura_Postiza":
                    request.getRequestDispatcher("View_DentaduraPostiza.jsp").forward(request, response);
                    break;
                case "Blanqueamiento_Dental":
                    request.getRequestDispatcher("View_BlanqueamientoDental.jsp").forward(request, response);
                    break;
                case "Brakets":
                    request.getRequestDispatcher("View_Brakets.jsp").forward(request, response);
                    break;
                case "Carillas_Dentales":
                    request.getRequestDispatcher("View_CarillasDentales.jsp").forward(request, response);
                    break;
                case "Adhesion_Dental":
                    request.getRequestDispatcher("View_AdhesionDental.jsp").forward(request, response);
                    break;
                case "Tarifas":
                    genericDAO dao = new genericDAOimplements();
                     List<GenericClass> lis1;
                    lis1=dao.select_estado("tarifas");
                    
                    request.setAttribute("lis_tar",lis1);
                    request.getRequestDispatcher("View_Tarifas.jsp").forward(request, response);
                    break;
                case "Promociones":
                    genericDAO dao2= new genericDAOimplements();
                    List<GenericClass> lis2;
                    lis2=dao2.select_estado("promociones");
                    
                    request.setAttribute("lis_pro",lis2);
                    request.getRequestDispatcher("View_Promociones.jsp").forward(request, response);
                    break;
                case "Reservar_Cita":
                    //obetenemos la lista de especialidades que tiene el consultorio.
                    genericDAO dao3 = new genericDAOimplements();
                    List<GenericClass> lista_especialidades = dao3.select("especialidades");
                    
                    List<especialidades> lista_view= new ArrayList<>();
                    for(GenericClass cl : lista_especialidades) {
                        String[] val = cl.getToString();
                        especialidades d = new especialidades();
                            d.setId(Integer.parseInt(val[2]));
                            d.setNombre_especialidad(val[4]);
                            lista_view.add(d);
                    }
                    
                    request.setAttribute("lista_especialidades", lista_view);
                    request.getRequestDispatcher("View_Reservar_Cita.jsp").forward(request, response);
                    break;
                case "Login":
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                    break;
                case "view":
                    //enviamos datos para sonrisa del mes 
                    genericDAO dao_v = new genericDAOimplements();
                    List<GenericClass> lis;
                    List<GenericClass> lis_doc;
                    lis_doc = dao_v.select("doctores");
                    lis = dao_v.select_estado("sonrisa_del_mes");
                    request.setAttribute("lis_son", lis);
                    request.setAttribute("lis_doc", lis_doc);
                    //enviamos datos para snoticias
                    List<GenericClass> lis_not;
                    lis_not = dao_v.select_estado("noticias");
                    request.setAttribute("lis_not", lis_not);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Reserva_De_Citas R = new Reserva_De_Citas();
        genericDAO dao = new genericDAOimplements();
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre_paciente = request.getParameter("nombre_paciente");
        String descripcion_consulta = request.getParameter("descripcion_consulta");
        Date fecha = convierteFecha(request.getParameter("fecha"));
        String hora = request.getParameter("hora");
        int celular = Integer.parseInt(request.getParameter("celular"));
        int id_especialidad = Integer.parseInt(request.getParameter("id_especialidad"));
        String servicio = request.getParameter("servicios");
        
        R.setId(id);
        R.setNombre_paciente(nombre_paciente);
        R.setDescripcion_consulta(descripcion_consulta);
        R.setFecha(fecha);
        R.setHora(hora);
        R.setCelular(celular);
        R.setId_especialidad(id_especialidad);
        R.setServicios(servicio);
        
        try {
                
                //nuevo registro
                dao.insert(R.toString() , null);
                
        } catch (Exception ex){
                System.out.println("Error al insertar "+ex.getMessage());
        }
        
        response.sendRedirect("Controller_Pagina_Web?view=Reservar_Cita");
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
