
package com.odontotech.controller;

import com.odontotech.dao.genericDAO;
import com.odontotech.dao.genericDAOimplements;
import com.odontotech.model.GenericClass;
import com.odontotech.model.Historial;
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

@WebServlet(name = "Controller_Historial", urlPatterns = {"/Controller_Historial"})
public class Controller_Historial extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            genericDAO dao = new genericDAOimplements();
            List<GenericClass> lista_historial = null; 
            Historial historial = new Historial();
            String ci;
            switch (action) {
                case "add":
                    String id_registro = request.getParameter("id_registro"); 
                    historial.setCi_paciente(id_registro);
                    request.setAttribute("id_registro", id_registro);
                    request.setAttribute("historial", historial);
                    request.getRequestDispatcher("FrmHistorial.jsp").forward(request, response);
                    break;
                case "edit":
                    String id_registroedit = request.getParameter("id_registro"); 
                    int pos = Integer.parseInt(request.getParameter("id")); 
                    String[] paci = dao.buscarById("historial", pos);                    
                    
                    //==========insertamos los datos al objeto==
                    Historial he = new Historial();
                    he.setId(Integer.parseInt(paci[2]));
                    he.setCi_paciente(paci[4]);
                    he.setFecha(convierteFecha(paci[6]));
                    he.setDescripcion(paci[8]);
                    
                    //==========fin de insercion=============
                    request.setAttribute("id_registro", id_registroedit);
                    request.setAttribute("historial", he);
                    request.getRequestDispatcher("FrmHistorial.jsp").forward(request, response);
                    break;
                case "delete":
                    String id_registrodelete = request.getParameter("id_registro"); 
                    int reg = Integer.parseInt(request.getParameter("id"));
                    dao.delete("historial", reg);
                    response.sendRedirect("Controller_Historial?action=view&id="+id_registrodelete);
                    break;
                case "view":
                    //obtener la lista de registros de los pascientes.==========
                    ci =request.getParameter("id");
                    lista_historial = dao.select("historial");
                    List<Historial> lista = new ArrayList<>();
                    for(GenericClass cl : lista_historial) {
                        String[] val = cl.getToString();
                        Historial h = new Historial();
                            if(val[4].equals(ci)){
                                h.setId(Integer.parseInt(val[2]));
                                h.setCi_paciente(val[4]);
                                h.setFecha(convierteFecha(val[6]));
                                h.setDescripcion(val[8]);
                                lista.add(h);
                            }
                    }
                    request.setAttribute("id_registro", ci);
                    request.setAttribute("lista_historial", lista);
                    request.getRequestDispatcher("Historial.jsp").forward(request, response);  
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
        Historial H = new Historial();
        genericDAO dao = new genericDAOimplements();
        
        int id = Integer.parseInt(request.getParameter("id"));
        String ci_paciente = request.getParameter("ci_paciente");
        String fecha = request.getParameter("fecha");
        String descripcion = request.getParameter("descripcion");
          
        H.setId(id);
        H.setCi_paciente(ci_paciente);
        H.setFecha(convierteFecha(fecha));
        H.setDescripcion(descripcion);

        if(id == 0)
        {
            try {
                
                //nuevo registro
                dao.insert(H.toString(), null);
                
            } catch (Exception ex){
                System.out.println("Error al insertar "+ex.getMessage());
            }
        }else{
            try {
                //edicion de registro
                dao.update(H.toString(), null);
                
            } catch (Exception ex) {
                System.out.println("Error al editar "+ex.getMessage());
            } 
        }
        response.sendRedirect("Controller_Historial?action=view&id="+ci_paciente);
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
