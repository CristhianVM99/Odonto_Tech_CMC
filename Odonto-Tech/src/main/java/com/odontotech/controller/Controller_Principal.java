package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Reserva_De_Citas;
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

@WebServlet(name = "Controller_Principal", urlPatterns = {"/Controller_Principal"})
public class Controller_Principal extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            genericDAO dao = new genericDAOimplements();
            String rol = request.getParameter("rol");
            int cont_doc = 0;
            int cont_pac = 0;
            int cont_res = 0;

            List<GenericClass> lista_doc = dao.select("doctores");
           // lista_doc = dao.select("doctores");

            List<GenericClass> lista_pac = dao.select("pacientes");
          //  lista_pac = dao.select("pacientes");

            List<GenericClass> lista_res = dao.select("reserva_de_citas");
          //  lista_res = dao.select("reserva_de_citas");

            List<Reserva_De_Citas> lista_citas = new ArrayList<Reserva_De_Citas>();
            //List<GenericClass> lista_pac = dao.select("pacientes");
            // List<GenericClass> lista_res = dao.select("reserva_de_citas");

            for (GenericClass cl : lista_doc) {
                String[] val = cl.getToString();
                if (val[2] != null) {
                    cont_doc++;
                }
                System.out.println("contador: " + cont_doc);
            }

            for (GenericClass cl : lista_pac) {
                String[] val = cl.getToString();
                if (val[2] != null) {
                    cont_pac++;
                }
                System.out.println("contador: " + cont_pac);
            }
            for (GenericClass cl : lista_res) {

                String[] val = cl.getToString();
                if (val[2] != null) {
                    Reserva_De_Citas cit = new Reserva_De_Citas();
                    cit.setId(Integer.parseInt(val[2]));
                    cit.setNombre_paciente(val[4]);
                    cit.setDescripcion_consulta(val[6]);
                    cit.setFecha(convierteFecha(val[8]));
                    cit.setHora(val[10]);
                    cit.setCelular(Integer.parseInt(val[12]));
                    cit.setId_especialidad(Integer.parseInt(val[14]));
                    cit.setServicios(val[18]);
                    lista_citas.add(cit);
                    cont_res++;
                    System.out.println(""+cont_res);
                }

            }
           // System.out.println("contador: " + cont_res + " " + cont_pac + " " + cont_doc);
            request.setAttribute("rol", rol);
            request.setAttribute("cont_res", cont_res);
            request.setAttribute("cont_pac", cont_pac);
            request.setAttribute("cont_doc", cont_doc);
            request.setAttribute("lista_citas", lista_citas);
            request.getRequestDispatcher("Principal.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("error: " + e.getMessage());
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    public Date convierteFecha(String fecha) {
        Date fechaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");

        java.util.Date fechaTMP;

        try {
            fechaTMP = formato.parse(fecha);
            fechaBD = new Date(fechaTMP.getTime());
        } catch (ParseException ex) {
            System.out.println("Error al convertir la fecha " + ex.getMessage());
        }
        return fechaBD;
    }
}
