
package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Reserva_De_Citas;
import com.odontotech.model.especialidades;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Controller_Reserva_De_Citas", urlPatterns = {"/Controller_Reserva_De_Citas"})
public class Controller_Reserva_De_Citas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                try {
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            int id;
            genericDAO dao = new genericDAOimplements();
            List<GenericClass> lista_especialidades = null; 
            List<GenericClass> lista_citas = null;
            Reserva_De_Citas part = new Reserva_De_Citas();

            switch (action) {
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete("reserva_de_citas", id);
                    response.sendRedirect("Controller_Reserva_De_Citas");
                    break;
                case "view":
                    //obtener la lista de registros de los pascientes.==========
                    lista_especialidades = dao.select("especialidades");
                    
                    List<especialidades> lista_view= new ArrayList<>();
                    for(GenericClass cl : lista_especialidades) {
                        String[] val = cl.getToString();
                        especialidades d = new especialidades();
                            d.setId(Integer.parseInt(val[2]));
                            d.setNombre_especialidad(val[4]);
                            lista_view.add(d);
                    }
                    lista_citas = dao.select("reserva_de_citas");
                    List<Reserva_De_Citas> lista_view2= new ArrayList<>();
                    for(GenericClass cl : lista_citas) {
                        String[] val = cl.getToString();
                        Reserva_De_Citas RC = new Reserva_De_Citas();
                            RC.setId(Integer.parseInt(val[2]));
                            RC.setNombre_paciente(val[4]);
                            RC.setDescripcion_consulta(val[6]);
                            RC.setFecha(convierteFecha(val[8]));
                            RC.setHora(val[10]);
                            RC.setCelular(Integer.parseInt(val[12]));
                            RC.setId_especialidad(Integer.parseInt(val[14]));
                            RC.setServicios(val[16]);
                            lista_view2.add(RC);
                    }
                    
                    request.setAttribute("lista_especialidades", lista_view);
                    request.setAttribute("lista_citas", lista_view2);
                    request.getRequestDispatcher("ReservasDeCitas.jsp").forward(request, response);  
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error Get" + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
