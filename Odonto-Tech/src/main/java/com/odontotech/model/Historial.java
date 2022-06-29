
package com.odontotech.model;

import java.sql.Date;

public class Historial {
    private int id;
    private String ci_paciente;
    private Date fecha;
    private String descripcion;

    public Historial() {
        this.id=0;
        this.ci_paciente="";
        this.fecha=null;
        this.descripcion="";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCi_paciente() {
        return ci_paciente;
    }

    public void setCi_paciente(String ci_paciente) {
        this.ci_paciente = ci_paciente;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Historial{" + "id=" + id + ", ci_paciente=" + ci_paciente + ", fecha=" + fecha + ", descripcion=" + descripcion + '}';
    }
    
    
}
